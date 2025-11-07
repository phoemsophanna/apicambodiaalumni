<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserInformation;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use NextApps\VerificationCode\VerificationCode;
use RuntimeException;
use Twilio\Rest\Client;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api', [
            'except' => [
                'login', 'register', 'loginWeb', 'registerWeb', 'googleAuth', 'sendEmailVerifyCode',
                'getEmailVerifyCode', 'sendPhonNumberVerifyCode',
                'verifyPhoneCode', 'findUserAccountIsExited', 'changePassword'
            ]
        ]);
    }
    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:6',
        ]);
        
        if ($validator->fails()) {
            return response()->json($validator->errors(), 202);
        }
        
        if (!$token = auth()->attempt($validator->validated())) {
            return response()->json(['status' => 'fail', 'message' => "Email or password is incorrect."], 202);
        }
        
        return $this->createNewToken($token);
    }
    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function loginWeb(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'userLogin' => 'required|string',
            'userAuth' => 'required|string|min:6',
            'loginWith' => 'required' // 1 = Email | 2 = PhoneNumber
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => 'fail', 'message' => "Username or password is incorrect!"], 202);
        }

        $credential = array(
            "email" => $request->userLogin,
            "password" => $request->userAuth
        );


        if ($request->loginWith == 1) {
            $credential = array(
                "phoneNumber" => "+855" . substr($request->userLogin, 1),
                "password" => $request->userAuth
            );
        }

        if (!$token = auth()->attempt($credential)) {
            return response()->json(['status' => 'fail', 'message' => "Email or password is incorrect."], 202);
        }

        return $this->createNewToken($token);
    }
    /**
     * Register a User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|between:2,100',
            'email' => 'required|string|email|max:100|unique:users',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors()->toJson(), 202);
        }
        $user = User::create(array_merge(
            $validator->validated(),
            ['password' => bcrypt($request->password)]
        ));
        return response()->json([
            'message' => 'User successfully registered',
            'user' => $user
        ], 201);
    }

    public function registerWeb(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstName' => 'required|string|between:2,100',
            'lastName' => 'required|string|between:2,100',
            'email' => 'nullable|string',
            'phoneNumber' => 'nullable|string',
            'password' => 'required|string|min:6',
            'loginWith' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => 'fail', 'message' => "Please enter invalid user data!"], 202);
        }
        $user = User::create(array_merge(
            $validator->validated(),
            [
                'password' => bcrypt($request->password),
                'joinAt' => Carbon::now(),
                'name' => $request->firstName . " " . $request->lastName,
                'isSuperAdmin' => false,
                'isAdmin' => false,
                'isActive' => true,
                'memberType' => 'MEMBER'
            ]
        ));
        return response()->json([
            'status' => 'success',
            'message' => 'User successfully registered',
            'user' => $user
        ], 201);
    }

    public function googleAuth(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstName' => 'required|string|between:2,100',
            'lastName' => 'required|string|between:2,100',
            'email' => 'nullable|string',
            'phoneNumber' => 'nullable|string',
            'password' => 'nullable|string|min:6',
            'loginWith' => 'required'
        ]);

        $exitUser = User::where("email", $request->email)->first();

        if (!$exitUser) {
            if(!empty($request->password)){
                User::create(array_merge(
                    $validator->validated(),
                    [
                        'joinAt' => Carbon::now(),
                        'name' => $request->firstName . " " . $request->lastName,
                        'password' => bcrypt($request->password),
                        'image' => $request->image,
                        'isSuperAdmin' => false,
                        'isAdmin' => false,
                        'isActive' => true,
                        'memberType' => 'MEMBER'
                    ]
                ));   
            } else {
                return response()->json([
                    'status' => 'fail'
                ]);
            }
        }

        $newUser = User::where("email", $request->email)->first();

        $token = JWTAuth::fromUser($exitUser ? $exitUser : $newUser);

        return response()->json([
            'status' => 'success',
            'token' => $token,
            'tokenType' => 'bearer',
            'expiresIn' => auth()->factory()->getTTL() * 60,
            'data' => $exitUser ? $exitUser : $newUser
        ]);
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth()->logout();
        return response()->json(['message' => 'User successfully signed out']);
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userProfile()
    {
        return response()->json(auth()->user());
    }
    
    public function userInformation()
    {   
        $user = auth()->user();
        $userInfo = UserInformation::where('user_id',$user->id)->first();
        return response()->json($userInfo);
    }

    public function updateUser(Request $request)
    {
        $user = auth()->user();
        $newUser = User::find($user->id);
        $newUser->update([
            'name' => request("name", $user->name),
            'email' => request("email", $user->email),
            'phoneNumber' => request('phoneNumber', $user->phoneNumber),
            'isSuperAdmin' => request('isSuperAdmin', $user->isSuperAdmin),
            'image' => request('image', $user->image),
        ]);
        return response()->json([
            "message" => 'success',
            "data" => $newUser
        ]);
    }
    public function changeUserInfo(Request $request)
    {
        $user = auth()->user();
        
        $newUser = User::find($user->id);
        $newUser->update([
            'firstName' => request("firstName", $user->firstName),
            'lastName' => request("lastName", $user->lastName),
            'email' => request("email", $user->email),
            'phoneNumber' => request('phoneNumber', $user->phoneNumber),
            'image' => request('image', $user->image),
            'idType' => request('idType', ""),
            'idNumber' => request('idNumber', ""),
            'idCardBack' => request('idCardBack', ""),
            'idCardFront' => request('idCardFront', ""),
            'passport' => request('passport', ""),
            // 'accountName' => request('accountName', ""),
            // 'accountNumber' => request('accountNumber', "")
        ]);
        
        $userInfo = UserInformation::where('user_id',$user->id)->first();
        if($userInfo){
            $userInfo->update([
                "documentType" => $request->idType,
                "fullname" => $request->fullname,
                "age" => $request->age,
                "city" => json_encode($request->city),
                "date" => $request->date,
                "idCardBack" => $request->idCardBack,
                "idCardFront" => $request->idCardFront,
                "identityNumber" => request('idNumber', ""),
                "location" => $request->location,
                "passport" => $request->passport,
                "phone" => $request->phoneNumber,
                "profile" => request('image', $user->image),
                "gender" => $request->gender,
                "againstHumanity" => $request->againstHumanity,
                "politicalUse" => $request->politicalUse,
            ]);
        }
        
        return response()->json([
            "message" => 'success',
            "data" => $newUser,
            "info" => $userInfo
        ]);
    }

    public function changeAuth(Request $request)
    {
        $user = auth()->user();
        $newUser = User::find($user->id);
        $newUser->update([
            'password' => bcrypt($request->newPassword)
        ]);
        return response()->json([
            "message" => 'success',
            "data" => $newUser
        ]);
    }

    public function sendPhonNumberVerifyCode(Request $request)
    {
        $data = $request->validate([
            'phoneNumber' => ['required', 'numeric'],
            'verifyType' => 'required'
        ]);

        if ($data['verifyType'] == "FORGET_PASSWORD") {
            $user = User::where("phoneNumber", $data["phoneNumber"])->first();

            if($user) {
                try {
                    /* Get credentials from .env */
                    $token = getenv("TWILIO_AUTH_TOKEN");
                    $twilio_sid = getenv("TWILIO_SID");
                    $twilio_verify_sid = getenv("TWILIO_VERIFY_SID");
                    $twilio = new Client($twilio_sid, $token);
                    $twilio->verify->v2->services($twilio_verify_sid)
                        ->verifications
                        ->create($data['phoneNumber'], "sms");
                } catch (RuntimeException $th) {
                    return response()->json([
                        'status' => 'fail',
                        'message' => 'Send Code is failed',
                    ]);
                }
            } else {
                return response()->json([
                    'status' => 'fail',
                    'message' => 'Send Code is failed',
                ]);
            }
            return response()->json([
                'status' => 'success',
                'message' => 'Send Code is Successfully',
            ]);
        }

        if ($data['verifyType'] == "REGISTER") {
            $user = User::where("phoneNumber", $data["phoneNumber"])->first();

            if($user) {
                return response()->json([
                    'status' => 'fail',
                    'message' => 'Phone number already exited',
                ]);
            } else {
                try {
                    /* Get credentials from .env */
                    $token = getenv("TWILIO_AUTH_TOKEN");
                    $twilio_sid = getenv("TWILIO_SID");
                    $twilio_verify_sid = getenv("TWILIO_VERIFY_SID");
                    $twilio = new Client($twilio_sid, $token);
                    $twilio->verify->v2->services($twilio_verify_sid)
                        ->verifications
                        ->create($data['phoneNumber'], "sms");
                } catch (RuntimeException $th) {
                    return response()->json([
                        'status' => 'fail',
                        'message' => 'Send Code is failed',
                    ]);
                }
            }

            return response()->json([
                'status' => 'success',
                'message' => 'Send Code is Successfully',
            ]);
        }

        return response()->json([
            'status' => 'fail',
            'message' => 'Something went wrong',
        ]);
    }

    public function verifyPhoneCode(Request $request)
    {
        $data = $request->validate([
            'verificationCode' => ['required', 'numeric'],
            'phoneNumber' => ['required', 'string'],
        ]);
        /* Get credentials from .env */
        $token = getenv("TWILIO_AUTH_TOKEN");
        $twilio_sid = getenv("TWILIO_SID");
        $twilio_verify_sid = getenv("TWILIO_VERIFY_SID");
        $twilio = new Client($twilio_sid, $token);
        $verification = $twilio->verify->v2->services($twilio_verify_sid)
            ->verificationChecks
            ->create(['code' => $data['verificationCode'], 'to' => $data['phoneNumber']]);
        if ($verification->valid) {
            return response()->json([
                'status' => 'success',
                'message' => 'Send Code is Successfully',
            ]);
        }
        return response()->json([
            'status' => 'fail',
            'message' => 'Invalid verification code entered!',
        ]);
    }

    public function sendEmailVerifyCode(Request $request)
    {
        try {
            VerificationCode::send($request->email);
        } catch (RuntimeException $th) {
            return response()->json([
                'status' => 'fail',
                'message' => 'Send Code is failed:' . $th,
            ]);
        }
        return response()->json([
            'status' => 'success',
            'message' => 'Send Code is Successfully',
        ]);
    }

    public function getEmailVerifyCode(Request $request)
    {
        try {
            if (VerificationCode::verify($request->code, $request->email) == 1) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Verify Code is Successfully',
                ]);
            } else {
                return response()->json([
                    'status' => 'fail',
                    'message' => 'Verify code is incorrect!'
                ]);
            }
        } catch (RuntimeException $th) {
            return response()->json([
                'status' => 'fail',
                'message' => $th->getMessage()
            ]);
        }
    }

    public function findUserAccountIsExited(Request $request)
    {
        $loginWith = request("loginWith", 1);
        $username = request("userLogin");

        $user = User::where("phoneNumber", "+855" . substr($username, 1))->first();

        if ($loginWith == 2) {
            $user = User::where("email", $username)->first();
        }

        if ($user) {
            return response()->json([
                'status' => 'success',
                'message' => 'User is exited',
            ]);
        } else {
            return response()->json([
                'status' => 'fail',
                'message' => "Phone number / Email is not exited." . substr($username, 1)
            ]);
        }
    }

    public function changePassword(Request $request)
    {
        $username = request("username");
        $password = request("password");
        $loginWith = request("loginWith", 1);

        $user = User::where("phoneNumber", "+855" . substr($username, 1))->first();

        if ($loginWith == 2) {
            $user = User::where("email", $username)->first();
        }

        if ($user) {
            $user->password = bcrypt($password);
            $user->save();
            return response()->json([
                'status' => 'success',
                'message' => 'User update password successfully.',
            ]);
        } else {
            return response()->json([
                'status' => 'fail',
                'message' => "Phone number / Email is not exited."
            ]);
        }
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function createNewToken($token)
    {
        return response()->json([
            'status' => 'success',
            'token' => $token,
            'tokenType' => 'bearer',
            'expiresIn' => auth()->factory()->getTTL() * 60,
            'data' => auth()->user()
        ]);
    }
}
