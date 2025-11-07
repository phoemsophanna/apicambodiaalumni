<?php

namespace App\Http\Controllers\AdminController;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\CampaignCategory;
use App\Models\Donation;
use App\Models\Feed;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class CampaignController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $data = Campaign::where("status", "!=", "DRAFT")->orderBy('id', 'desc')->get();
        $data->each(function($query)  {
            $query->campaignGallery = json_decode($query->campaignGallery);
            $query->campaignCategory = CampaignCategory::where("id", $query->campaignCategoryId)->first();
            $query->startDate = Carbon::parse($query->StartDate)->format('F jS, Y');
            $query->endDate = Carbon::parse($query->endDate)->format('F jS, Y');
        });

        return response()->json([
            'message' => 'Get list success.',
            'status' => 'success',
            'data' => $data
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    // public function store(Request $request)
    // {
    //     $dataForm = [
    //         "isInNeed" => request("isInNeed", false),
    //         "isTrending" => request("isTrending", false),
    //         "isLatest" => request("isLatest", false),
    //         "allowEdit" => request("allowEdit", false),
    //         "status" => request("status", "PENDING"),
    //         "ordering" => request("ordering", 0)
    //     ];
    //     $campaign = Campaign::where("id", $request->id)->first();

    //     $result = $this->_onSave($request->id, $dataForm);

    //     if (!$result) {
    //         return response()->json([
    //             'message' => 'Save record is failed.',
    //             'status' => 'failed'
    //         ], 200);
    //     }

    //     if($dataForm["status"] == "COMPLETE") {
    //         Feed::create([
    //             "creatorId" => $campaign->creatorId,
    //             "feedType" => "APPROVE",
    //             "campaignId" => $request->id,
    //             "donationId" => null,
    //             "publishedAt" => Carbon::now()
    //         ]);

    //     }

    //     if( $dataForm["status"] != $campaign->status) {
    //         $campaignCategory = CampaignCategory::select("name")->where("id", $campaign->campaignCategoryId)->first();
    //         $creator = User::where("id", $campaign->creatorId)->first();
    //         $this->sendMessage(
    //             $campaign->campaignTile,
    //             $dataForm["status"],
    //             $campaignCategory->name,
    //             $campaign->goal,
    //             $creator->name,
    //             $creator->phoneNumber ?: $creator->email,
    //             json_decode($campaign->campaignGallery)[0]
    //         );
    //     }

    //     return response()->json([
    //         'message' => 'Save record is successfully.',
    //         'status' => 'success'
    //     ], 200);
    // }
    
    public function store(Request $request)
    {
        $dataForm = [
            "creatorId" => auth()->id(),
            "campaignCategoryId" => request("campaignCategoryId", null),
            "location" => request("location", null),
            "city" => request("city", null),
            "campaignTile" => request("campaignTile", null),
            "campaignTileKm" => request("campaignTileKm", null),
            "campaignTileCh" => request("campaignTileCh", null),
            "fullStory" => request("fullStory", null),
            "fullStoryKm" => request("fullStoryKm", null),
            "fullStoryCh" => request("fullStoryCh", null),
            "additionalInformation" => request("additionalInformation", null),
            "additionalInformationKm" => request("additionalInformationKm", null),
            "additionalInformationCh" => request("additionalInformationCh", null),
            "involvement" => request("involvement", null),
            "involvementKm" => request("involvementKm", null),
            "involvementCh" => request("involvementCh", null),
            "referenceLink" => request("referenceLink", null),
            "goal" => request("goal", 0.0),
            "startDate" => request("startDate", null),
            "endDate" => request("endDate", null),
            "gratitude" => request("gratitude", null),
            "gratitudeKm" => request("gratitudeKm", null),
            "gratitudeCh" => request("gratitudeCh", null),
            "campaignFor" => request("campaignFor", null),
            "phoneNumber" => request("phoneNumber", null),
            "fullName" => request("fullName", null),
            "documentType" => $request->documentType ?  $request->documentType["value"] : null,
            "identityNumber" => request("identityNumber", null),
            "creatorLocation" => request("creatorLocation", null),
            "creatorCity" => request("creatorCity", null),
            "receiveByBank" => request("receiveByBank", null),
            "accountName" => request("accountName", null),
            "accountNumber" => request("accountNumber", null),
            "videoLink" => request("videoLink", null),
            "campaignGallery" => json_encode(request("campaignGallery", [])),
            "videoFile" => request("videoFile", null),
            "idCardBack" => request("idCardBack", null),
            "idCardFront" => request("idCardFront", null),
            "passport" => request("passport", null),
            "profile" => request("profile", null),
            "ordering" => request("ordering", 0),
            'isActive' => request("isActive", true),
            "status" => request("status", null),
            "isInNeed" => request("isInNeed",0),
            "isLatest" => request("isLatest",0)
        ];

        $result = $this->_onSave($request->id, $dataForm);

        if (!$result) {
            return response()->json([
                'message' => 'Save record is failed.',
                'status' => 'failed'
            ], 200);
        }

        return response()->json([
            'message' => 'Save record is successfully.',
            'status' => 'success'
        ], 200);
    }

    private function sendMessage($title, $status, $category, $goal, $userName, $phoneNumber, $image)
    {
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.telegram.org/bot7345727717:AAESLDh_Fu4KmfXVGkcHTXOJXqEFF8kdSPQ/sendphoto',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_POSTFIELDS => array('chat_id' => '-1002461421075','photo' => "https://api.cdafund.org/uploads$image",'caption' => "<b>New Campaign</b>
<b>Status:</b> <u>$status</u>
<b><u>Campaign Information:</u></b>
- Title:
  <code>$title</code>
- Category:
  <code>$category</code>
- Goal:
  <code>$goal USD</code>
<b><u>Create By:</u></b>
  <code>$userName</code>
  <code>$phoneNumber</code>",'parse_mode' => 'HTML'),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        Log::info($response);
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request)
    {
        $model = Campaign::findOrFail($request->id);
        $model->campaignCategory = CampaignCategory::where("id", $model->campaignCategoryId)->first();
        $model->campaignGallery = json_decode($model->campaignGallery);
        // $model->startDate = Carbon::parse($model->StartDate)->format('F jS, Y');
        // $model->endDate = Carbon::parse($model->endDate)->format('F jS, Y');
        $model->creator = User::select("id", "name", "email", "phoneNumber")->where("id", $model->creatorId)->first();
        $donations = Donation::where("campaignId", $model->id)->orderBy("id", "DESC")->get();
        $donations->each(function($query) {
            $query->donor = User::select("id", "name", "image", "email", "phoneNumber")->where("id", $query->donorId)->first();
        });
        $model->donations = $donations;
        return response()->json([
            'message' => 'Get detail success.',
            'status' => 'success',
            'model' => $model
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $model = Campaign::findOrFail($id);
        $model->delete();
        return response()->json([
            'message' => 'Delete successfully.',
            'status' => 'success'
        ], 200);
    }

    private function _onSave($id, $data)
    {
        try {
            if ($id) {
                Campaign::where('id', $id)->update($data);
            } else {
                Campaign::create($data);
            }
        } catch (Exception $error) {
            Log::info('Error: ' . $error->getMessage());
            return false;
        }
        return true;
    }
}
