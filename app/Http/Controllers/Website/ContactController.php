<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Mail\ContactEmail;
use App\Models\SiteSetting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use mysql_xdevapi\Exception;

class ContactController extends Controller
{
    public function contactPage(Request $request)
    {
        $lang = $request->header("Accept-Language");
        $page = SiteSetting::where("type", "CONTACT")->first();
        $content = json_decode($page->content);
        return response()->json([
            'pageTitle' => $lang == "KHM" ? ($content->pageTitleKh? $content->pageTitleKh : $content->pageTitle) : ($lang == "CH" ? ($content->pageTitleCh ? $content->pageTitleCh : $content->pageTitle) : $content->pageTitle),
            'pageDescription' => $lang == "KHM" ? ($content->pageDescriptionKh?$content->pageDescriptionKh:$content->pageDescription)  : ($lang == "CH" ? ($content->pageDescriptionCh ? $content->pageDescriptionCh : $content->pageDescription) : $content->pageDescription),
            'thumbnail' => $content->thumbnail ?: "",
            'email1' => $content->email1 ?: "",
            'email2' => $content->email2 ?: "",
            'phoneNumber1' => $content->phoneNumber1 ?: "",
            'phoneNumber2' => $content->phoneNumber2 ?: "",
            'address' => $lang == "KHM" ? ($content->addressKh ? $content->addressKh : $content->address) : ($lang == "CH" ? ($content->addressCh ? $content->addressCh : $content->address) : $content->address),
            'embedMap' => $content->embedMap ?: "",
            'facebookLink' => $content->facebookLink ?: "",
            'instagramLink' => $content->instagramLink ?: "",
            'telegramLink' => $content->telegramLink ?: "",
            'linkedinLink' => $content->linkedinLink ?: ""
        ]);
    }

    public function sendingEmail(Request $request)
    {
        try {
            Mail::to('katomkh1826@gmail.com')->send(new ContactEmail([
                'name' => request('name', ''),
                'email' => request('email', ''),
                'number' => request('number', ''),
                'subject' => request('subject', ''),
                'text' => request('text', ''),
            ]));

            return response()->json([
                "status" => "success",
                "message" => "Send email successfully"
            ]);
        } catch (Exception $ex) {
            Log::info($ex);
            return response()->json([
                "status" => "fail",
                "message" => "Send email unsuccessfully"
            ]);
        }
    }
}
