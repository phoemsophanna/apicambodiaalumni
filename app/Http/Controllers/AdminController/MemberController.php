<?php

namespace App\Http\Controllers\AdminController;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\User;
use App\Models\UserInformation;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class MemberController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = User::select("id", "name", "email", "phoneNumber", "image", "isActive", "memberType", "loginWith", "isMember")
            ->where("isAdmin", false)
            ->orderBy('id', 'desc')->get();

        return response()->json([
            'message' => 'Get user list success.',
            'status' => 'success',
            'data' => $data
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if (!$request->id && $request->loginWith == 1) {
            $exitedUser = User::where("phoneNumber", $request->phoneNumber)->where("loginWith", 1)->first();
            if($exitedUser) {
                return response()->json([
                    'message' => 'User with phone number ['.$request->phoneNumber.'] already register!',
                    'status' => 'user-exited'
                ], 200);
            }
        }
        if (!$request->id && $request->loginWith == 2) {
            $exitedUser = User::where("email", $request->email)->where("loginWith", "!=", 1)->first();
            if($exitedUser) {
                return response()->json([
                    'message' => 'User with email ['.$request->email.'] already register!',
                    'status' => 'user-exited'
                ], 200);
            }
        }
        $dataForm = [
            "name" => request("name", null),
            "firstName" => request("firstName", null),
            "lastName" => request("lastName", null),
            "email" => request("email", null),
            "phoneNumber" => request("phoneNumber", null),
            "image" => request("image", null),
            "isActive" => request("isActive", true),
            "joinAt" => Carbon::now(),
            "loginWith" => request("loginWith", null),
            "memberType" => request("memberType", "MEMBER")
        ];

        if ($request->password) {
            $dataForm['password'] = bcrypt($request->password);
        }

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

    /**
     * Display the specified resource.
     */
    public function show(Request $request)
    {
        $model = User::findOrFail($request->id);
        $campaignList = Campaign::where("creatorId", $request->id)->get();
        $model['info'] = UserInformation::where('user_id',$request->id)->first();
        $model["campaignCount"] = $campaignList->count();
        $model["totalRaised"] = $campaignList->sum("totalRaised");
        $model["totalDonors"] = $campaignList->sum("totalDonation");
        $model["totalWithdraw"] = $campaignList->sum("totalWithdraw");
        $model["totalBalance"] = $campaignList->sum("balance");
        return response()->json([
            'message' => 'Get user detail success.',
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
        $model = User::findOrFail($id);
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
                User::where('id', $id)->update($data);
            } else {
                User::create($data);
            }
        } catch (Exception $error) {
            Log::info('Error: ' . $error->getMessage());
            return false;
        }
        return true;
    }
}
