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

    public static function checkTransaction($req_time, $tran_id)
    {
        $merchant_id = config('services.payway.api_merchant_id');
        $b4hash = $req_time . $merchant_id . $tran_id;
        $key = config('services.payway.api_key');
        $hash = base64_encode(hash_hmac('sha512', $b4hash, $key, true));
        $api = config('services.payway.api_url');
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => $api.'/api/payment-gateway/v1/payments/check-transaction-2',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => '{
            "req_time": "' . $req_time . '",
            "merchant_id": "' . $merchant_id . '",
            "tran_id": "' . $tran_id . '",
            "hash": "' . $hash . '"
        }',
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        return json_decode($response);
    }
}
