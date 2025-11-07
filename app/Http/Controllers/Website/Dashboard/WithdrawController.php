<?php

namespace App\Http\Controllers\Website\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\Withdraw;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use PhpParser\Node\Stmt\TryCatch;

class WithdrawController extends Controller
{
    public function index(Request $request)
    {
        $id = request("id", 0);
        $withdraw = Withdraw::where("campaignId", $id)->orderBy("requestDate", "DESC")->get();
        $withdraw->each(function ($query) {
           $query->requestDate = Carbon::parse($query->requestDate)->format('d-M-Y H:i:s');
        });
        $campaign = Campaign::where("id", $id)->first();
        return response()->json(["withdraw" => $withdraw, "campaign" => $campaign]);
    }
    public function requestWithdraw(Request $request)
    {
        $campaign = Campaign::where([
            ["id", $request->campaignId],
            ["creatorId", auth()->id()]
        ])->first();

        if (!$campaign) {
            return response()->json([
                'message' => 'Cannot withdraw amount!',
                'status' => 'failed'
            ], 200);
        }

        if ($campaign->balance == 0) {
            return response()->json([
                'message' => 'Current balance is empty!',
                'status' => 'failed'
            ], 200);
        }

        if ($campaign->balance < $request->requestAmount) {
            return response()->json([
                'message' => 'Cannot withdraw amount greater than current balance!',
                'status' => 'failed'
            ], 200);
        }

        $item = [
            "campaignId" => request("campaignId", 0),
            "requestBy" => auth()->id(),
            "approveBy" => request("approveBy", null),
            "requestAmount" => request("requestAmount", 0.0),
            "accountName" => request("accountName", ""),
            "accountNumber" => request("accountNumber", ""),
            "withdrawStatus" => request("withdrawStatus", "PENDING"),
            "requestDate" => Carbon::now()
        ];

        try {
            Withdraw::create($item);
            Campaign::where("id", $request->campaignId)->update([
                "balance" => $campaign->balance - request("requestAmount", 0),
                "totalWithdraw" => $campaign->totalWithdraw + request("requestAmount", 0)
            ]);
            $user = User::where("id", auth()->id())->first();
            $this->sendMessage(
                $campaign->campaignTile,
                $item["withdrawStatus"],
                $item["requestAmount"],
                Carbon::parse($item["requestDate"])->format('d-M-Y H:i:s'),
                $item["accountName"],
                $item["accountNumber"],
                $user->name, 
                $user->phoneNumber,
                $user->email
            );
            return response()->json([
                'message' => 'Save record is successfully.',
                'status' => 'success'
            ], 200);
        } catch(Exception $err) {
            Log::info("Error: $err");
            return response()->json([
                'message' => 'Save record is failed.',
                'status' => 'failed'
            ], 200);
        }
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
