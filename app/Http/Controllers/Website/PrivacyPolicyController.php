<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\SiteSetting;
use Illuminate\Http\Request;

class PrivacyPolicyController extends Controller
{
    public function privacyPolicyPage(Request $request)
    {
        $lang = $request->header("Accept-Language");
        $page = SiteSetting::where("type", "PRIVACY_POLICY")->first();
        $content = json_decode($page->content);
        return response()->json([
            "description" => $lang == "KHM" ? ($content->descriptionKh?: $content->description) : ($lang == "CH" ? ($content->descriptionCh ? $content->descriptionCh : $content->description) : $content->description)
        ]);
    }
}
