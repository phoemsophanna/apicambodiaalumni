<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\CampaignCategory;
use App\Models\Comment;
use App\Models\Donation;
use App\Models\User;
use App\Models\UserLike;
use App\Models\UserShare;
use App\Models\UserInformation;
use Carbon\Carbon;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Http\Request;
use Exception;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Schema;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class CampaignController extends Controller
{

    public function campaignDetail($id, Request $request)
    {
        $lang = $request->header('Accept-Language');
        $campaign = Campaign::where("id", $id)->first();
        $campaign->campaignTile = $lang == "KHM" ? ($campaign->campaignTileKm ?: $campaign->campaignTile) : ($lang == "CH" ? ($campaign->campaignTileCh ? $campaign->campaignTileCh : $campaign->campaignTile) : $campaign->campaignTile);
        $campaign->fullStory = $lang == "KHM" ? ($campaign->fullStoryKm ?: $campaign->fullStory) : ($lang == "CH" ? ($campaign->fullStoryCh ? $campaign->fullStoryCh : $campaign->fullStory) : $campaign->fullStory);

        $campaign->campaignGallery = json_decode($campaign->campaignGallery);

        $category = CampaignCategory::select("id", "name", "nameKh", "nameCh")->where("id", $campaign->campaignCategoryId)->first();
        if ($category) {
            $category->name = $lang == "KHM" ? ($category->nameKh ?: $category->name) : ($lang == "CH" ? ($category->nameCh ? $category->nameCh : $category->name) : $category->name);
        }
        $campaign->campaignCategory = $category;

        $campaign->createdAt = Carbon::parse($campaign->created_at)->format('F jS, Y');
        $startDate = Carbon::parse($campaign->startDate);
        $endDate = Carbon::parse($campaign->endDate);
        $countDay = $startDate->diffInDays(Carbon::now());
        $totalDay = $startDate->diffInDays($endDate);
        $campaign->daysLeft = $totalDay - $countDay;

        $user = User::select("id", "name", "image", "joinAt")->where("id", $campaign->creatorId)->first();
        $user->joinAt = Carbon::parse($user->joinAt)->format('F jS, Y');
        $campaign->creator = $user;
        $campaign->shareCount = UserShare::where("campaignId", $id)->count();
        $campaign->likeCount = UserLike::where("campaignId", $id)->count();
        $campaign->makeHidden(["campaignTileKm", "fullStoryKm"]);
        return response()->json($campaign);
    }

    public function campaignDetailMeta($id)
    {
        $campaign = Cache::remember('campaigns', 120, function () use ($id) {
            return Campaign::select("campaignTile", "campaignGallery", "created_at", "involvement", "id", "qrCode")->where("id", $id)->first();
        });
        $campaign->campaignGallery = json_decode($campaign->campaignGallery);
        return response()->json($campaign);
    }

    public function getAllDonorByCampaign($campaignId)
    {
        $donations = Donation::where("campaignId", $campaignId)->orderBy("created_at", "DESC")->get();
        $donations->each(function ($donation) {
            $donation->donor =  User::select("id", "name", "image")->where("id", $donation->donorId)->first();
            $donation->dayPass = Carbon::parse($donation->donationDate)->diffForHumans();
        });

        return response()->json($donations);
    }

    public function getMainCampaign(){
        $inNeedCampaign = Campaign::select("id")->where("isInNeed", true)->where("status", "COMPLETE")->orderBy("id", "ASC")->first();
        return response()->json([
            'item' => $inNeedCampaign
        ]);
    }

    public function homeCampaign(Request $request)
    {
        $lang = $request->header("Accept-Language");
        $inNeedCampaign = Campaign::select("id", "campaignTile", "campaignTileKm", "campaignTileCh", "involvement", "involvementKm", "involvementCh", "goal", "totalRaised", "campaignGallery")->where("isInNeed", true)->where("status", "COMPLETE")->orderBy("id", "ASC")->first();
        $inNeedCampaign->campaignGallery = json_decode($inNeedCampaign->campaignGallery);
        $inNeedCampaign->campaignTile = $lang == "KHM" ? ($inNeedCampaign->campaignTileKm ?: $inNeedCampaign->campaignTile) : ($lang == "CH" ? ($inNeedCampaign->campaignTileCh ? $inNeedCampaign->campaignTileCh : $inNeedCampaign->campaignTile) : $inNeedCampaign->campaignTile);
        $inNeedCampaign->involvement = $lang == "KHM" ? ($inNeedCampaign->involvementKm ?: $inNeedCampaign->involvement) : ($lang == "CH" ? ($inNeedCampaign->involvementCh ? $inNeedCampaign->involvementCh : $inNeedCampaign->involvement) : $inNeedCampaign->involvement);
        $inNeedCampaign->makeHidden(["campaignTileKm", "involvementKm"]);

        $isLatest = Campaign::where("isLatest", true)->where("status", "COMPLETE")->orderBy("created_at", "DESC")->limit(9)->get();
        $isLatest->each(function ($query) use ($lang) {
            $query->campaignTile = $lang == "KHM" ? ($query->campaignTileKm ?: $query->campaignTile) : ($lang == "CH" ? ($query->campaignTileCh ? $query->campaignTileCh : $query->campaignTile) : $query->campaignTile);
            $query->involvement = $lang == "KHM" ? ($query->involvementKm ?: $query->involvement) : ($lang == "CH" ? ($query->involvementCh ? $query->involvementCh : $query->involvement) : $query->involvement);
            $query->makeHidden(["campaignTileKm", "involvementKm"]);

            $query->campaignGallery = json_decode($query->campaignGallery);
            $category = CampaignCategory::select("id", "name", "nameKh", "nameCh")->where("id", $query->campaignCategoryId)->first();
            if ($category) {
                $category->name = $lang == "KHM" ? ($category->nameKh ?: $category->name) : ($lang == "CH" ? ($category->nameCh ? $category->nameCh : $category->name) : $category->name);
            }
            $query->campaignCategory = $category;
            $query->createdAt = Carbon::parse($query->created_at)->format('F jS, Y');
            $startDate = Carbon::parse($query->startDate);
            $endDate = Carbon::parse($query->endDate);

            $countDay = $startDate->diffInDays(Carbon::now());
            $totalDay = $startDate->diffInDays($endDate);
            $query->daysLeft = $totalDay - $countDay;
        });

        return response()->json([
            "inNeedCampaign" => $inNeedCampaign,
            "latestCampaign" => $isLatest
        ]);
    }

    public function projectCampaign(Request $request)
    {
        $lang = $request->header("Accept-Language");
        $location = $request->location;
        $organization = $request->organization;
        $category = $request->category;
        $orderBy = request("sortBy", "");

        $campaignList = Campaign::select("id", "campaignTile", "campaignTileKm", "campaignTileCh", "involvement", "involvementKm", "involvementCh", "campaignGallery", "goal", "totalRaised")->where("status", "COMPLETE")->when($location, function ($query) use ($location) {
            $query->where("city", "like", "%" . $location . "%");
        })->when($organization, function ($query) use ($organization) {
            $query->where("creatorId", $organization);
        })->when($category, function ($query) use ($category) {
            $query->whereIn("campaignCategoryId", explode(",", $category));
        })->inRandomOrder()->get();

        if ($orderBy == "ending") {
            $campaignList = Campaign::select("id", "campaignTile", "campaignTileKm", "campaignTileCh", "involvement", "involvementKm", "involvementCh", "campaignGallery", "goal", "totalRaised")->where("status", "COMPLETE")->when($location, function ($query) use ($location) {
                $query->where("city", "like", "%" . $location . "%");
            })->when($organization, function ($query) use ($organization) {
                $query->where("creatorId", $organization);
            })->when($category, function ($query) use ($category) {
                $query->whereIn("campaignCategoryId", explode(",", $category));
            })->orderBy("created_at", "ASC")->get();
        }

        if ($orderBy == "trending") {
            $campaignList = Campaign::select("id", "campaignTile", "campaignTileKm",  "campaignTileCh", "involvement", "involvementKm", "involvementCh", "campaignGallery", "goal", "totalRaised")->where("status", "COMPLETE")->when($location, function ($query) use ($location) {
                $query->where("city", "like", "%" . $location . "%");
            })->when($organization, function ($query) use ($organization) {
                $query->where("creatorId", $organization);
            })->when($category, function ($query) use ($category) {
                $query->whereIn("campaignCategoryId", explode(",", $category));
            })->orderBy("isTrending", "DESC")->orderBy("created_at", "DESC")->get();
        }

        $campaignList->each(function ($query) use ($lang) {
            $query->campaignTile = $lang == "KHM" ? ($query->campaignTileKm ?: $query->campaignTile) : ($lang == "CH" ? ($query->campaignTileCh ? $query->campaignTileCh : $query->campaignTile) : $query->campaignTile);
            $query->involvement = $lang == "KHM" ? ($query->involvementKm ?: $query->involvement) : ($lang == "CH" ? ($query->involvementCh ? $query->involvementCh : $query->involvement) : $query->involvement);
            $query->makeHidden(["campaignTileKm", "involvementKm"]);

            $query->campaignGallery = json_decode($query->campaignGallery);
            $category = CampaignCategory::select("id", "name", "nameKh", "nameCh")->where("id", $query->campaignCategoryId)->first();
            if ($category) {
                $category->name = $lang == "KHM" ? ($category->nameKh ?: $category->name) : ($lang == "CH" ? ($category->nameCh ? $category->nameCh : $category->name) : $category->name);
            }
            $query->campaignCategory = $category;

            $query->createdAt = Carbon::parse($query->created_at)->format('F jS, Y');
            $startDate = Carbon::parse($query->startDate);
            $endDate = Carbon::parse($query->endDate);

            $countDay = $startDate->diffInDays(Carbon::now());
            $totalDay = $startDate->diffInDays($endDate);
            $query->daysLeft = $totalDay - $countDay;
        });

        return response()->json([
            "campaignList" => $campaignList
        ]);
    }

    public function projectCampaignIdPaths(Request $request)
    {
        $campaignList = Cache::remember('campaigns.id', 120, function () {
            return Campaign::where("status", "COMPLETE")->select("id")->get();
        });

        return response()->json([
            "campaignList" => $campaignList
        ]);
    }

    public function dropdown()
    {
        $organizations = User::select("id", "name", "image")->where("memberType", "ORGANIZATION")->orderBy("created_at", "DESC")->get();
        $location = Campaign::select("city")->distinct()->get();
        return response()->json([
            "organizations" => $organizations,
            "location" => $location
        ]);
    }

    public function userShareCampaign(Request $request)
    {
        $item = [
            "userId" => auth()->id(),
            "campaignId" => $request->campaignId,
            "shareWith" => $request->shareWith
        ];

        try {
            UserShare::create($item);
        } catch (Exception $err) {
            Log::info("[Save User Share]: " . $err);
            return response()->json([
                "message" => "Share Successfully!",
                "status" => "fail"
            ], 200);
        }

        return response()->json([
            "message" => "Share Successfully!",
            "status" => "success"
        ], 200);
    }

    public function userLikeCampaign(Request $request)
    {
        $item = [
            "userId" => auth()->id(),
            "campaignId" => $request->campaignId,
        ];

        try {
            if ($request->isLike == true) {
                UserLike::create($item);
            } else {
                $userLike = UserLike::where([["userId", auth()->id()], ["campaignId", $request->campaignId]])->first();
                $userLike->delete();
            }
        } catch (Exception $err) {
            Log::info("[Save User Share]: " . $err);
            return response()->json([
                "message" => "Share Failed!",
                "status" => "fail"
            ], 200);
        }

        return response()->json([
            "message" => "Share Successfully!",
            "status" => "success"
        ], 200);
    }

    public function userIsLikeCampaign(Request $request)
    {
        $userLike = UserLike::where([["userId", $request->userId], ["campaignId", $request->campaignId]])->first();
        if ($userLike) {
            return response()->json(1);
        }

        return response()->json(2);
    }

    public function generateQRCode($campaignId, Request $req)
    {
        $campaign = Campaign::find($campaignId);

        if (!$campaign->qrCode) {
            $campaign->qrCode = "/qrcode/" . time() . "_qr_code.svg";

            QrCode::format('svg')->generate(
                $req->url,
                public_path('uploads/' . "/qrcode/" . time() . "_qr_code.svg")
            );

            $campaign->save();
        }

        return response()->json([
            "message" => "Generate Successfully!",
            "qrCode" => $campaign->qrCode,
            "status" => "success"
        ], 200);
    }

    public function viewSvgFile(Request $request)
    {
        $qrcode = $request->qrcode;
        return response()->file(public_path("uploads$qrcode"));
    }

    public function userComment(Request $request)
    {
        $item = [
            "userId" => auth()->id(),
            "campaignId" => $request->campaignId,
            "comment" => $request->comment
        ];

        try {
            Comment::create($item);
        } catch (Exception $err) {
            Log::info("[Save User Comment]: " . $err);
            return response()->json([
                "message" => "Comment Successfully!",
                "status" => "fail"
            ], 200);
        }

        return response()->json([
            "message" => "Comment Successfully!",
            "status" => "success"
        ], 200);
    }
    
    public function userApplicationForm(Request $req){
        $users = [
            "user_id" => auth()->id(),
            "documentType" => $req->documentType['value'],
            "fullname" => $req->fullName,
            "age" => $req->age,
            "city" => json_encode($req->city),
            "date" => $req->date,
            "idCardBack" => $req->idCardBack,
            "idCardFront" => $req->idCardFront,
            "identityNumber" => $req->identityNumber,
            "location" => $req->location,
            "passport" => $req->passport,
            "phone" => $req->phoneNumber,
            "profile" => $req->profile,
            "politicalUse" => $req->politicalUse,
            "againstHumanity" => $req->againstHumanity,
            "gender" => $req->genderType['value']
        ];
        try {
            UserInformation::create($users);
        } catch (Exception $err) {
            Log::info("[Save User Information]: " . $err);
            return response()->json([
                "message" => $err,
                "status" => "fail"
            ], 200);
        }
        
        $user = [
            "image" => $req->profile,
            'isMember' => 1,
            "idType" => $req->identityNumber == "identity" ? "ID_CARD" : "PASSPORT",
            "idCardBack" => $req->idCardBack,
            "idCardFront" => $req->idCardFront,
            "passport" => $req->passport,
        ];
        
        User::where('id',auth()->id())->update($user);
        return response()->json(["status" => "success"]);
    }

    public function getCampaignComment($campaignId, Request $request)
    {
        $comments = Comment::select("id", "userId", "comment", "created_at")->where("campaignId", $campaignId)->orderBy("created_at", "DESC")->paginate(request("limit", 10));
        $comments->each(function ($comment) {
            $user = User::select("id", "name", "image")->where("id", $comment->userId)->first();
            $comment->sender = $user->name;
            $comment->image = $user->image;
            $comment->message = $comment->comment;
            $comment->time = Carbon::parse($comment->created_at)->diffForHumans();
        });
        return response()->json($comments->items());
    }
}
