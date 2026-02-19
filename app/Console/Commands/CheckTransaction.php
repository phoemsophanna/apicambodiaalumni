<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Website\PaymentController;
use App\Models\Donation;
use App\Services\DonationService;

class CheckTransaction extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'check:transaction';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Check Transaction Status';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $orders = Donation::select("id", "transactionId", "requestTime", "created_at")->where("paymentStatus", "DRAFT")->where('created_at', '>=', Carbon::now()->subMinutes(5))->get();
        foreach ($orders as $key => $order) {
            Log::info("Current Date: " . Carbon::now() . "Order Date: " . Carbon::parse($order->created_at));
            $transaction = PaymentController::checkTransaction($order->requestTime, $order->transactionId);
            if ($transaction->status->code == 6) {
                Log::alert("Transaction not found: ", (array)$transaction);
            } else if ($transaction->status->code == 5) {
                Log::alert("Invalid hash: ", (array)$transaction);
            } else if ($transaction->status->code == 8) {
                Log::alert("Invalid merchant profile: ", (array)$transaction);
            } else if ($transaction->status->code == 11) {
                Log::alert("Internal server error: ", (array)$transaction);
            } else if ($transaction->status->code == 429) {
                Log::alert("Reach request limit: ", (array)$transaction);
            } else if ($transaction->status->code == '00') {
                if ($transaction->data->payment_status_code == 0) {
                    DonationService::approved($order->id);
                }
                if ($transaction->data->payment_status_code == 2) {
                    Log::alert("Transaction is PENDING: ", (array)$transaction);
                }
                if ($transaction->data->payment_status_code == 3) {
                    Log::alert("Transaction is DECLINDED: ", (array)$transaction);
                } else if ($transaction->data->payment_status_code == 4) {
                    Log::alert("Transaction is REFUNDED: ", (array)$transaction);
                } else if ($transaction->data->payment_status_code == 7) {
                    Log::alert("Transaction is CANCELLED: ", (array)$transaction);
                }
            }
        }
    }
}
