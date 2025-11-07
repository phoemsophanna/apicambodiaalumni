<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\PageBanner;
use App\Models\Performance;
use App\Models\SiteSetting;
use App\Models\Campaign;
use App\Models\News;
use App\Models\User;
use App\Models\UserInformation;
use Illuminate\Http\Request;

class WebPageController extends Controller
{
    public function howItWork(Request $request)
    {
        $lang = $request->header('Accept-Language');
        $howItWork = Performance::where("isActive", true)->orderBy("ordering", "asc")->get();
        $howItWork->each(function($query) use ($lang) {
            $query->title = $lang == "KHM" ? ($query->titleKh ?: $query->title) : ($lang == "CH" ? ($query->titleCh ? $query->titleCh : $query->title) : $query->title);
            $query->description = $lang == "KHM" ? ($query->descriptionKh ?: $query->description) : ($lang == "CH" ? ($query->descriptionCh ? $query->descriptionCh : $query->description) : $query->description);
        });
        return response()->json($howItWork);
    }

    public function pageBanner(Request $request)
    {
        $pageBanner = PageBanner::where("pageTitle", $request->type)->first();
        return response()->json($pageBanner ? $pageBanner->image : null);
    }

    public function sendingEmail(Request $request)
    {
        $email = $request->email;
        $subject = $request->subject;
        \Mail::send(
            'email',
            array(
                'name' => $request->name,
                'email' => $email,
                'number' => $request->number,
                'subject' => $subject,
                'text' => $request->text,
            ),
            function ($message) use ($email, $subject) {
                $message->from($email);
                $message->subject($subject);
                $message->to('info@camgotech.acitytech.com');
            }
        );

        return response(['status' => true, 'message' => "Send Email Successfully"]);
    }
    
    public function memberFetch()
    {
        $member = User::where('isMember',1)->select("id", "name", "image", "totalDonation", "loginWith")->orderBy("totalDonation", "DESC")->get();
        $member->each(function($member) {
            $member->loginBy = $member->loginWith;
            $location = UserInformation::where('user_id',$member->id)->first();
            $member['location'] = $location->location;
        });
        return response()->json($member);
    }
    
    public function search(Request $request) {
        $query = request("query");
        $responseArr = [];
        if($query != null || $query != "") {
            $campaign = Campaign::where(function($cam) use ($query) {
                $cam->where("campaignTile", "like", "%$query%");
            })->where("status", "COMPLETE")->get();
            foreach($campaign as $cam) {
                $campaignGallery = json_decode($cam->campaignGallery);
                array_push($responseArr, ["id" => $cam->id, "title" => $cam->campaignTile, "image" => count($campaignGallery) > 0 ? $campaignGallery[0] : null, "type" => "campaign"]); 
            }
            $dataNews = News::select("id","title","image","type")->where(function($news) use ($query) {
                $news->where("title", "like", "%$query%");
            })->where("isActive", true)->get();
            foreach($dataNews as $n) {
                array_push($responseArr, ["id" => $n->id, "title" => $n->title, "image" => $n->image , "type" => $n->type]); 
            }
        }
        
        return response()->json($responseArr);
    }
}
