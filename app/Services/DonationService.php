<?php

namespace App\Services;

use Illuminate\Support\Facades\Log;
use App\Models\Donation;
use App\Models\User;
use App\Models\Campaign;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Exception;

class DonationService
{
    public static function approved($id)
    {
        try {
            DB::transaction(function () use ($id) {
                $donation = Donation::where('id', $id)->where("paymentStatus", "!=", "APPROVED")->first();
                if ($donation) {
                    $value = self::getTransactionDetail($donation->requestTime, $donation->transactionId);
                    $payment_type = self::checkPaymentType($value->payment_type);
                    $donation->paymentStatus = "APPROVED";
                    $donation->paymentMethod = $payment_type;
                    $donation->save();

                    Log::alert("Transaction Detail: {$payment_type}");

                    $campaign = Campaign::where("id", $donation->campaignId)->first();
                    if($campaign){
                        Campaign::where("id", $donation->campaignId)->update([
                            "totalTip" => $campaign->totalTip + $donation->tip,
                            "totalRaised" => $campaign->totalRaised + $donation->amount,
                            "balance" => $campaign->balance + $donation->amount,
                            "totalDonation" => $campaign->totalDonation + 1
                        ]);
                    }

                    $user = User::where("id", $donation->donorId)->first();
                    if($user) {
                        User::where("id", $donation->donorId)->update([
                            "totalDonation" => $user->totalDonation + ($donation->tip + $donation->amount)
                        ]);
                        Feed::create([
                            "creatorId" => $user->id,
                            "feedType" => "DONATION",
                            "campaignId" => $donation->campaignId ? $donation->campaignId : 0,
                            "donationId" => $donation->id,
                            "publishedAt" => Carbon::now()
                        ]);
                    }

                    $notification = self::sentNotification($donation, $user, $campaign);
                    
                    if(!$notification->status){
                        return response()->json([
                            "message" => "Sent Notification Fail",
                            "error" => $notification->message,
                            "status" => "fail"
                        ], 200);
                    }
                    
                    Log::alert("Update Donation {$donation->transactionId} Success.");
                }
            });
        } catch (Exception $th) {
            Log::alert("Update Order Fail: {$th->getMessage()}");
        }
    }

    private static function sentNotification($item, $user = null, $campaign = null) {
        try {
            $curl = curl_init();

            curl_setopt_array($curl, array(
                CURLOPT_URL => "https://api.telegram.org/bot8590989809:AAEuh7sDgw5alUoQv76QzdOfYbJ2BCqGITo/sendMessage",
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS => array(
                    'chat_id' => '-1003584798129',
                    'text' => '<b>Donation:</b>
' . ($campaign ? '<b><u>Project:</u></b> ' . $campaign['campaignTile'] : '') . '
<b><u>Donor Info:</u></b>
<code>' . ($user ? $user['name'] : "Anonymous") . '</code>
<code>' . ($user ? $user['phoneNumber'] : "") . '</code>
<b>Payment Method:</b> <u>' . $item['paymentMethod'] . '</u> ' . '
<b>Amount:</b> <u>' . number_format($item['total'], 2, '.') . '</u> ' . '
<b><u>Note:</u></b> ' . "\n" . $item['note'],
                    'parse_mode' => 'HTML'
                ),
            ));

            curl_exec($curl);

            curl_close($curl);
        } catch (Exception $th) {
            // Log::error($th->getMessage(), $th);
            return (object)['message' => $th->getMessage(), "status" => false];
        }
        return (object)["status" => true];
    }

    public static function getTransactionDetail($req_time, $tran_id)
    {
        $merchant_id = config('services.payway.api_merchant_id');
        $b4hash = $req_time . $merchant_id . $tran_id;
        $key = config('services.payway.api_key');
        $hash = base64_encode(hash_hmac('sha512', $b4hash, $key, true));
        $api = config('services.payway.api_url');
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => $api.'/api/payment-gateway/v1/payments/transaction-detail',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => '{
            "req_time": "' . $req_time . '",
            "merchant_id": "' . $merchant_id . '",
            "tran_id": "' . $tran_id . '",
            "hash": "' . $hash . '"
        }',
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        return json_decode($response);
    }

    private static function checkPaymentType($type) {
        $payment_type = "ABA KHQR";
        switch($value->payment_type) {
            case "ABA Pay":
                $payment_type = "ABA KHQR";
                break;
            case "VISA":
                $payment_type = "Visa card";
                break;
            case "MC":
                $payment_type = "Mastercard";
                break;
            case "JCB":
                $payment_type = "JCB card";
                break;
            case "CUP":
                $payment_type = "UPI card";
                break;
            default: 
                $payment_type = "ABA KHQR";
        }

        return $payment_type;
    }
}
