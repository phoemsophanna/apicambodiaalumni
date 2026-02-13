<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\Donation;
use App\Models\Feed;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class DonationController extends Controller
{
    public function topDonation()
    {
        $donors = User::where("totalDonation", ">", 0)->select("id", "name", "image", "totalDonation", "loginWith")->orderBy("totalDonation", "DESC")->limit(9)->get();
        $donations = Donation::where("donorId", null)->get();
        $donations->each(function($query) use ($donors) {
            $donors->push(new User(["id" => 1, "name" => "Anonymous", "image" => null, "totalDonation" => $query->amount, "loginWith" => null]));
        });
        $donors->each(function($donor) {
            $donor->totalProjects = Donation::where("donorId", $donor->id)->distinct("campaignId")->count();
            $donor->loginBy = $donor->loginWith;
        });
        return response()->json($donors);
    }
    public function donationList()
    {
        $donors = User::where("totalDonation", ">", 0)->select("id", "name", "image", "totalDonation", "loginWith")->orderBy("totalDonation", "DESC")->get();
        $donations = Donation::where("donorId", null)->get();
        $donations->each(function($query) use ($donors) {
            $donors->push(new User(["id" => 1, "name" => "Anonymous", "image" => null, "totalDonation" => $query->amount, "loginWith" => null]));
        });
        $donors->each(function($donor) {
            $donor->totalProjects = Donation::where("donorId", $donor->id)->distinct("campaignId")->count();
            $donor->loginBy = $donor->loginWith;
        });
        return response()->json($donors);
    }

    public function donorList() {
        $donor = Donation::orderBy('id','desc')->get();
        $donor->each(function($q) {
            $q['user'] = User::where("id", $q->donorId)->first();
        });
        $total = Donation::sum('amount');

        return response()->json(["donors" => $donor, "total" => $total]);
    }

    public function donorListUser($id) {
        $donor = Donation::where("donorId", $id)->orderBy('id','desc')->get();
        $donor->each(function($q) {
            $q->campaign = $q->campaign ? $q->campaign : [];
            $q->date = Carbon::parse($q->donationDate)->format("d M Y");
        });
        $total = Donation::where("donorId", $id)->sum('amount');

        return response()->json(["donors" => $donor, "total" => $total]);
    }

    public function donation(Request $request)
    {
        $transactionId = 'PAID' . round(microtime(true) * 1000);
        $req_time = round(microtime(true) * 1000);
        $amount = number_format(request("total", 0), 2, '.');
        $firstName = request("firstName", '');
        $lastName = request("lastName", '');
        $phone = request("receiverPhone", "");
        $payment_option = $request->paymentOption; #abapay_khqr, cards

        $item = [
            "campaignId" => request("campaignId", 0),
            "donorId" => auth() ? auth()->id() : null,
            "donateType" => request("donateType", null),
            "amount" => request("amount", 0),
            "tip" => request("tip", 0),
            "total" => request("total", 0),
            "paymentMethod" => request("paymentMethod", null),
            "note" => request("note", null),
            "isConfirmAgreement" => request("isConfirmAgreement", false),
            "donationDate" => Carbon::now(),
            "paymentStatus" => "DRAFT",
            "transactionId" => $transactionId,
            "requestTime" => $req_time
        ];

        try {
            $donation = Donation::create($item);

            $data = PaymentController::generatePaymentResponse(
                $req_time,
                $transactionId,
                $amount,
                "USD",
                $firstName,
                $lastName,
                null,
                $phone,
                $payment_option,
                base64_encode('https://api.cambodiaalumni.org/api/web/update-donation/' . $transactionId),
                'https://cambodiaalumni.org/'
            );
        } catch (Exception $th) {
            Log::info("Donation Fail", $th);
            return response()->json([
                "message" => "Donation Failed!",
                "status" => "fail"
            ], 200);
        }

        return response()->json([
            "message" => "Donation Successfully!",
            "status" => "success",
            "data" => $data,
        ], 200);
    }

    public function checkOrder($transactionId)
    {
        try {
            DB::transaction(function () use ($transactionId) {
                $donation = Donation::where('transactionId', $transactionId)->where("paymentStatus", "!=", "APPROVED")->first();
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

                    $notification = $this->sentNotification($donation, $user, $campaign);
                    
                    if(!$notification->status){
                        return response()->json([
                            "message" => "Sent Notification Fail",
                            "error" => $notification->message,
                            "status" => "fail"
                        ], 200);
                    }
                    
                    Log::alert("Update Donation{$transactionId} Success.");
                }
            });
        } catch (Exception $th) {
            Log::alert("Update Order Fail: " + $th->getMessage());
        }
    }

    public function listAllDonations(Request $request)
    {
        $donations = Donation::orderBy("created_at", "DESC")->paginate(request("limit", 10));
        $donations->each(function ($donation) {
            $donation->donor =  User::select("id", "name", "image")->where("id", $donation->donorId)->first();
            $donation->dayPass = Carbon::parse($donation->donationDate)->diffForHumans();
        });

        return response()->json($donations->items());
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
