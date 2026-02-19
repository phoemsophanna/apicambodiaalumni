<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;
use App\Controllers\Website\DonationController;
use App\Models\Donation;

class DonationService
{
    public static function approved($id)
    {
        $donation = Donation::where("paymentStatus", "DRAFT")->where("id", $id)->first();
        if($donation) {
            DonationController::checkOrder($donation->transactionId);
        }
    }
}
