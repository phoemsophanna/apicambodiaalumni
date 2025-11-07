<?php

namespace App\Http\Controllers\AdminController;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\User;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
	public function index()
	{
        $campaign = Campaign::all();
        $campaignComplete = Campaign::where("status", "COMPLETE")->get();
        $member = User::where("memberType", "!=", "ADMIN")->get();
        $memberOrganization = User::where("memberType", "ORGANIZATION")->get();
		return response()->json([
			[
				"id" => 1,
				"feaIcon" => "briefcase",
				"feaIconClass" => "primary",
				"label" => "Total Campaigns",
				"badgeClass" => "success",
				"icon" => "ri-arrow-up-s-line",
				"percentage" => number_format(($campaignComplete->count() / $campaign->count()) * 100,0)." %",
				"caption" => "Campaign completed is ".$campaignComplete->count(),
				"subCounter" => [["id" => 1, "counter" => $campaign->count(), "suffix" => ""]],
			],
			[
				"id" => 2,
				"feaIcon" => "heart",
				"feaIconClass" => "primary",
				"label" => "Total Donors",
				"caption" => "Record all user donations",
				"subCounter" => [[
					"id" => 1,
					"counter" => $campaign->sum("totalDonation"),
					"suffix" => "",
					"separator" => ","
				]],
			],
            [
                "id" => 2,
                "feaIcon" => "users",
                "feaIconClass" => "primary",
                "label" => "Total Member",
                "badgeClass" => "success",
                "icon" => "ri-arrow-up-s-line",
                "percentage" => number_format((($member->count() - $memberOrganization->count()) / $member->count()) * 100,0)." %",
                "caption" => "Organization member is " . $memberOrganization->count(),
                "subCounter" => [[
                    "id" => 1,
                    "counter" => $member->count(),
                    "suffix" => "",
                    "separator" => ","
                ]],
            ],
			[
				"id" => 3,
				"feaIcon" => "dollar-sign",
				"feaIconClass" => "primary",
				"label" => "Fund Raised",
				"caption" => "Total fund raised at each campaign",
				"subCounter" => [
					["id" => 1, "counter" => $campaign->sum("totalRaised"), "suffix" => " USD", "separator" => ","],
				],
			],
//             [
// 				"id" => 4,
// 				"feaIcon" => "dollar-sign",
// 				"feaIconClass" => "primary",
// 				"label" => "Total Tips",
// 				"caption" => "Total fund raised at each campaign",
// 				"subCounter" => [
// 					["id" => 1, "counter" => $campaign->sum("totalTip"), "suffix" => " USD", "separator" => ","],
// 				],
// 			],
//             [
//                 "id" => 5,
//                 "feaIcon" => "dollar-sign",
//                 "feaIconClass" => "primary",
//                 "label" => "Request Withdraw",
//                 "caption" => "Total fund raised at each campaign",
//                 "subCounter" => [
//                     ["id" => 1, "counter" => $campaign->sum("totalWithdraw"), "suffix" => " USD", "separator" => ","],
//                 ],
//             ]
		]);
	}
}
