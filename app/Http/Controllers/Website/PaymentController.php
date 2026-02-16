<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public static function generatePaymentResponse($req_time, $transactionId, $amount, $currency, $firstName, $lastName, $email, $phone, $payment_option, $return_url = "", $continue_success_url = "")
    {
        $api = config('services.payway.api_url');
        $key = config('services.payway.api_key');
        $merchant_id = config('services.payway.api_merchant_id');
        // $hash_str = $req_time . $merchant_id . $transactionId . $amount . $firstName . $lastName . $phone . $payment_option . $return_url . $continue_success_url . $currency;
        $hash_str = $req_time . $merchant_id . $transactionId . $amount . $firstName . $lastName . $payment_option . $return_url . $continue_success_url . $currency;
        $hash = base64_encode(hash_hmac('sha512', $hash_str, $key, true));
        
        return [
            'api' => $api.'/api/payment-gateway/v1/payments/purchase',
            'key' => $key,
            'hash' => $hash,
            'tran_id' => $transactionId,
            'amount' => $amount,
            'currency' => $currency,
            'firstName' => $firstName,
            'lastName' => $lastName,
            'phone' => $phone,
            'email' => $email,
            'req_time' => $req_time,
            'merchant_id' => $merchant_id,
            'payment_option' => $payment_option,
            'returnUrl' => $return_url,
            'continue_success_url' => $continue_success_url,
            'view_type' => 'popup'
        ];
    }
}
