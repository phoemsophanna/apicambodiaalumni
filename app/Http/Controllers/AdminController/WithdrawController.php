<?php

namespace App\Http\Controllers\AdminController;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\Withdraw;
use App\Models\CampaignCategory;
use App\Models\Donation;
use App\Models\Feed;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class WithdrawController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Withdraw::orderBy('id', 'desc')->get();
        $data->each(function($query)  {
            $campaign = Campaign::where("id", $query->campaignId)->first();
            $campaign->campaignGallery = json_decode($campaign->campaignGallery);
            $query->campaign = $campaign;
            $query->requestFrom = User::where("id", $query->requestBy)->first();
            $query->requestDate = Carbon::parse($query->requestDate)->format('F jS, Y');
            $query->approveDate = Carbon::parse($query->approveDate)->format('F jS, Y');
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
    public function store(Request $request)
    {
        $dataForm = [
            "approveBy" => auth()->id(),
            "withdrawStatus" => request("withdrawStatus", "PENDING"),
            "approveDate" => Carbon::now()
        ];
        $withdraw = Withdraw::where("id", $request->id)->where("withdrawStatus", "PENDING")->first();
        $campaign = Campaign::where("id", $withdraw->campaignId)->first();

        if (!$withdraw) {
            return response()->json([
                'message' => 'Request has been rejected!',
                'status' => 'failed'
            ], 200);
        }

        $result = $this->_onSave($request->id, $dataForm);

        if (!$result) {
            return response()->json([
                'message' => 'Save record is failed.',
                'status' => 'failed'
            ], 200);
        }

        if ($dataForm["withdrawStatus"] == "REJECT") {
            Campaign::where("id", $withdraw->campaignId)->update([
                "balance" => $campaign->balance + $withdraw->requestAmount,
                "totalWithdraw" => $campaign->totalWithdraw - $withdraw->requestAmount
            ]);
        }
        $user = User::where("id", $withdraw->requestBy)->first();
        $this->sendMessage(
            $campaign->campaignTile,
            $dataForm["withdrawStatus"] == "REJECT" ? "REJECTED" : "APPROVED",
            $withdraw->requestAmount,
            Carbon::parse($withdraw->requestDate)->format('d-M-Y H:i:s'),
            $withdraw->accountName,
            $withdraw->accountNumber,
            $user->name,
            $user->phoneNumber,
            $user->email
        );

        return response()->json([
            'message' => 'Save record is successfully.',
            'status' => 'success'
        ], 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request)
    {
        $model = Withdraw::findOrFail($request->id);
        $model->requestDate = Carbon::parse($model->requestDate)->format('jS, F Y H:i:s');
        $model->approveDate = Carbon::parse($model->approveDate)->format('jS, F Y H:i:s');
        $model->requestFrom = User::where("id", $model->requestBy)->first();
        $model->approveFrom = User::where("id", $model->approveBy)->first();
        $campaign = Campaign::where("id", $model->campaignId)->first();
        $campaign->campaignCategory = CampaignCategory::where("id", $campaign->campaignCategoryId)->first();
        $campaign->campaignGallery = json_decode($campaign->campaignGallery);
        $campaign->startDate = Carbon::parse($campaign->StartDate)->format('F jS, Y');
        $campaign->endDate = Carbon::parse($campaign->endDate)->format('F jS, Y');
        $campaign->creator = User::select("id", "name", "email", "phoneNumber")->where("id", $campaign->creatorId)->first();
        $donations = Donation::where("campaignId", $campaign->id)->orderBy("id", "DESC")->get();
        $donations->each(function($query) {
            $query->donor = User::select("id", "name", "image", "email", "phoneNumber")->where("id", $query->donorId)->first();
        });
        $campaign->donations = $donations;
        $model->campaign = $campaign;
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
        $model = Withdraw::findOrFail($id);
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
                Withdraw::where('id', $id)->update($data);
            } else {
                Withdraw::create($data);
            }
        } catch (Exception $error) {
            Log::info('Error: ' . $error->getMessage());
            return false;
        }
        return true;
    }

    private function sendMessage($title, $status, $requestAmount, $requestDate, $accountName, $accountNumber, $requestBy, $requestPhone, $requestEmail)
    {
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.telegram.org/bot6817608789:AAFNmII5C42-dokwwA1GQN3qU2iJzL5JQhE/sendmessage',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_POSTFIELDS => array(
                'chat_id' => '-1002311900068',
                'text' => "<b>Campaign:</b>
<code>$title</code>
<b>Status:</b> <u>$status</u>
<b><u>Withdraw Information:</u></b>
- Request Amount:
  <code>$requestAmount USD</code>
- Request Date:
  <code>$requestDate</code>
- Request By:
  <code>$requestBy</code>
  <code>$requestPhone</code>
  <code>$requestEmail</code>
<b><u>Payment Detail:</u></b>
- Account Name:
  <code>$accountName</code>
- Account Number:
  <code>$accountNumber</code>",
                'parse_mode' => 'HTML'),
        ));
        $response = curl_exec($curl);
        curl_close($curl);
        Log::info($response);
    }
}
