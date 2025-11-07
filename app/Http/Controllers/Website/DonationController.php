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

    public function donation(Request $request)
    {
        $item = [
            "campaignId" => request("campaignId", null),
            "donorId" => auth() ? auth()->id() : null,
            "donateType" => request("donateType", null),
            "amount" => request("amount", 0),
            "tip" => request("tip", 0),
            "total" => request("total", 0),
            "paymentMethod" => request("paymentMethod", null),
            "note" => request("note", null),
            "isConfirmAgreement" => request("isConfirmAgreement", false),
            "donationDate" => Carbon::now()
        ];

        try {
            $donation = Donation::create($item);
            $campaign = Campaign::where("id", $request->campaignId)->first();
            Campaign::where("id", $request->campaignId)->update([
                "totalTip" => $campaign->totalTip + $item["tip"],
                "totalRaised" => $campaign->totalRaised + $item["amount"],
                "balance" => $campaign->balance + $item["amount"],
                "totalDonation" => $campaign->totalDonation + 1
            ]);
            $user = User::where("id", $item["donorId"])->first();
            if($user) {
                User::where("id", $item["donorId"])->update([
                    "totalDonation" => $user->totalDonation + ($item["tip"] + $item["amount"])
                ]);
                Feed::create([
                    "creatorId" => $user->id,
                    "feedType" => "DONATION",
                    "campaignId" => $request->campaignId,
                    "donationId" => $donation->id,
                    "publishedAt" => Carbon::now()
                ]);
            }
        } catch (Exception $th) {
            Log::info("Donation Fail", $th);
            return response()->json([
                "message" => "Donation Failed!",
                "status" => "fail"
            ], 200);
        }

        return response()->json([
            "message" => "Donation Successfully!",
            "status" => "success"
        ], 200);
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
}
