<?php

namespace App\Http\Controllers\AdminController;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserInformation;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class MemberInformationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = User::select("id", "name", "email", "phoneNumber", "image", "isActive", "memberType", "loginWith")
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
        $dataForm = [
            "fullname" => request("fullname", null),
            "age" => request("age", null),
            "city" => json_encode($request->city),
            "date" => request("date", null),
            "documentType" => request("documentType", null),
            "gender" => request("gender", null),
            "idCardBack" => request("idCardBack", null),
            "idCardFront" => request("idCardFront", null),
            "identityNumber" => request("identityNumber", null),
            "location" => request("location", null),
            "passport" => request("passport", null),
            "phone" => request("phone", null),
            "profile" => request("profile", null),
            "latinName" => request("latinName", null),
            "education" => request("education", null),
            "facebook" => request("facebook", null),
            "birth" => request("birth", null),
            "marital" => request("marital", null),
            "againstHumanity" => request("againstHumanity", null),
            "politicalUse" => request("politicalUse", null),
            "identityDate" => request("identityDate", null),
            "job" => request("job", null),
            "languages" => request("languages", null),
            "father" => json_encode($request->father),
            "mother" => json_encode($request->mother),
            "placeBirth" => json_encode($request->placeBirth),
            "dayDo" => json_encode($request->dayDo)
        ];
        
        $user = [
            "firstName" => request("firstname", null),
            "lastName" => request("lastname", null),
            "idType" => request("documentType", null),
            "memberType" => request("memberType", null),
            "idCardBack" => request("idCardBack", null),
            "idCardFront" => request("idCardFront", null),
            "idNumber" => request("identityNumber", null),
            "passport" => request("passport", null),
            "email" => request("email", null),
            "image" => request("profile", null)
        ];
        
        

        $result = $this->_onSave($request->id, $dataForm, $user);

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
        $member_information = UserInformation::where('user_id',$request->id)->first();
        $member_information->father = json_decode($member_information->father);
        $member_information->mother = json_decode($member_information->mother);
       $member_information['datebirth'] = 'ថ្ងៃទី <span style="padding: 0 20px">'.Carbon::parse($member_information->birth)->format('d'). '</span>' .'ខែ <span style="padding: 0 20px">'.Carbon::parse($member_information->birth)->format('m').'</span>'.'ឆ្នាំ <span style="padding: 0 20px">'.Carbon::parse($member_information->birth)->format('Y').'</span>';
       $member_information['dateIndenity'] = 'ចុះថ្ងៃទី <span style="padding: 0 10px">'.Carbon::parse($member_information->identityDate)->format('d').'</span>ខែ <span style="padding: 0 10px">'.Carbon::parse($member_information->identityDate)->format('m').'</span>ឆ្នាំ <span style="padding:0 10px">'.Carbon::parse($member_information->identityDate)->format('Y').'</span>';
        $model['member_information'] = $member_information;
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

    private function _onSave($id, $data, $user)
    {
        try {
            if ($id) {
                UserInformation::where('user_id', $id)->update($data);
                User::where('id',$id)->update($user);
            } else {
                UserInformation::create($data);
                User::create($user);
            }
        } catch (Exception $error) {
            Log::info('Error: ' . $error->getMessage());
            return false;
        }
        return true;
    }
}
