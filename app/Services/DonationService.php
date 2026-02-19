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
                    $donation->paymentStatus = "APPROVED";
                    $donation->save();

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
}
