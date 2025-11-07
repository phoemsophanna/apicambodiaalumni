<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\CampaignCategory;
use App\Models\Donation;
use App\Models\Feed;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class FeedController extends Controller
{
    public function index(Request $request)
    {
        $feeList = Feed::orderBy("id", "DESC")->paginate(request("limit", 10));
        $feeList->each(function($feed) {
            $campaign = Campaign::where("id", $feed->campaignId)->first();
            $campaign->startAt = Carbon::parse($campaign->startDate)->format('jS F,  Y');
            $campaign->endAt = Carbon::parse($campaign->endDate)->format('jS F, Y');
            $campaign->campaignCategory = CampaignCategory::where("id", $campaign->campaignCategoryId)->first();
            $campaign->campaignGallery = json_decode($campaign->campaignGallery);
            $feed->campaign = $campaign;
            $feed->creator = User::select("id", "name", "image")->where("id", $feed->creatorId)->first();
            $feed->donation = Donation::where("id", $feed->donationId)->first();
            $feed->publishedAt = Carbon::parse($feed->publishedAt)->format('jS F, Y | H:i A');
        });
        return response()->json($feeList->items());
    }
}
