<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Banner;
use App\Models\Campaign;
use App\Models\CampaignCategory;
use App\Models\News;
use App\Models\Partner;
use App\Models\SiteSetting;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class HomepageController extends Controller
{
    public function slider(Request $request)
    {
        $lang = $request->header('Accept-Language');
        $sliders = Banner::where("isActive", true)->orderBy("ordering", "asc")->get();

        $sliders->each(function ($slider) use ($lang) {
            $slider->title = $lang == "KHM" ? ($slider->titleKh ? $slider->titleKh : $slider->title) : ($lang == "CH" ? ($slider->titleCh ? $slider->titleCh : $slider->title) : $slider->title);
            $slider->subtitle = $lang == "KHM" ? ($slider->subtitleKh ? $slider->subtitleKh : $slider->subtitle) : ($lang == "CH" ? ($slider->subtitleCh ? $slider->subtitleCh : $slider->subtitle) : $slider->subtitle);
            $slider->description = $lang == "KHM" ? ($slider->descriptionKh ? $slider->descriptionKh : $slider->description) : ($lang == "CH" ? ($slider->descriptionCh ? $slider->descriptionCh : $slider->description) : $slider->description);
            $slider->linkLabel = $lang == "KHM" ? ($slider->linkLabelKh ? $slider->linkLabelKh : $slider->linkLabel) : ($lang == "CH" ? ($slider->linkLabelCh ? $slider->linkLabelCh : $slider->linkLabel) : $slider->linkLabel);
        });
        $sliders = $sliders->makeHidden(['titleKh', 'subtitleKh', 'descriptionKh', 'linkLabelKh']);

        return response()->json($sliders);
    }

    public function getCategories(Request $request)
    {
        $lang = $request->header("Accept-Language");
        $categories = Cache::remember('campaign_categories', 120, function () {
            return CampaignCategory::select("id", "name", "nameKh", "nameCh", "desc", "descKh", "descCh", "image", "thumbnail")->orderBy("ordering", "ASC")->where("isDisplayHomePage", true)->where("isActive", true)->get();
        });
        $categories->each(function($query) use ($lang) {
            $query->countProject = Campaign::where("status", "COMPLETE")->where("campaignCategoryId", $query->id)->count();
            $query->name = $lang == "KHM" ? ($query->nameKh ?: $query->name) : ($lang == "CH" ? ($query->nameCh ? $query->nameCh : $query->name) : $query->name);
            $query->desc = $lang == "KHM" ? ($query->descKh ?: $query->desc) : ($lang == "CH" ? ($query->descCh ? $query->descCh : $query->desc) : $query->desc);
        });
        $categories->makeHidden(["nameKh", "descKh"]);
        return response()->json($categories);
    }

    public function homepage(Request $request)
    {
        $lang = $request->header('Accept-Language');
        $page = SiteSetting::where("type", "HOME_PAGE")->first();
        $content = json_decode($page->content);
        return response()->json([
            "subtitle" => $lang == "KHM" ? ($content->subtitleKh ? $content->subtitleKh : $content->subtitle) : ($lang == "CH" ? ($content->subtitleCh ? $content->subtitleCh : $content->subtitle) : $content->subtitle),
            "title" => $lang == "KHM" ? ($content->titleKh ? $content->titleKh : $content->title) : ($lang == "CH" ? ($content->titleCh ? $content->titleCh : $content->title) : $content->title),
            "des" => $lang == "KHM" ? ($content->desKh ? $content->desKh : $content->des) : ($lang == "CH" ? ($content->desCh ? $content->desCh : $content->des) : $content->des),
            "latestProject" => $lang == "KHM" ? ($content->latestProjectKh ? $content->latestProjectKh : $content->latestProject) : ($lang == "CH" ? ($content->latestProjectCh ? $content->latestProjectCh : $content->latestProject) : $content->latestProject),
            "bannerDesc" => $lang == "KHM" ? ($content->bannerDescKh ? $content->bannerDescKh : $content->bannerDesc) : ($lang == "CH" ? ($content->bannerDescCh ? $content->bannerDescCh : $content->bannerDesc) : $content->bannerDesc),
            "bannerLabel" => $lang == "KHM" ? ($content->bannerLabelKh ? $content->bannerLabelKh : $content->bannerLabel) : ($lang == "CH" ? ($content->bannerLabelCh ? $content->bannerLabelCh : $content->bannerLabel) : $content->bannerLabel),
            "bannerLinkTo" => $content->bannerLinkTo ?: "",
            "thumbnail" => $content->thumbnail ?: "",
            "cardTitle1" => $lang == "KHM" ? ($content->cardTitleKh1 ? $content->cardTitleKh1 : $content->cardTitle1) : ($lang == "CH" ? ($content->cardTitleCh1 ? $content->cardTitleCh1 : $content->cardTitle1) : $content->cardTitle1),
            "cardDesc1" => $lang == "KHM" ? ($content->cardDescKh1 ? $content->cardDescKh1 : $content->cardDesc1) : ($lang == "CH" ? ($content->cardDescCh1 ? $content->cardDescCh1 : $content->cardDesc1) : $content->cardDesc1),
            "cardLabel1" => $lang == "KHM" ? ($content->cardLabelKh1 ? $content->cardLabelKh1 : $content->cardLabel1) : ($lang == "CH" ? ($content->cardLabelCh1 ? $content->cardLabelCh1 : $content->cardLabel1) : $content->cardLabel1),
            "cardIcon1" => $content->cardIcon1 ?: "",
            "cardLinkTo1" => $content->cardLinkTo1 ?: "",
            "cardIsShow1" => $content->cardIsShow1 ?: "",
            "thumbnailTwo" => $content->thumbnailTwo ?: "",
            "cardTitle2" => $lang == "KHM" ? ($content->cardTitleKh2 ? $content->cardTitleKh2 : $content->cardTitle2) : ($lang == "CH" ? ($content->cardTitleCh2 ? $content->cardTitleCh2 : $content->cardTitle2) : $content->cardTitle2),
            "cardDesc2" => $lang == "KHM" ? ($content->cardDescKh2 ? $content->cardDescKh2 : $content->cardDesc2) : ($lang == "CH" ? ($content->cardDescCh2 ? $content->cardDescCh2 : $content->cardDesc2) : $content->cardDesc2),
            "cardLabel2" => $lang == "KHM" ? ($content->cardLabelKh2 ? $content->cardLabelKh2 : $content->cardLabel2) : ($lang == "CH" ? ($content->cardLabelCh2 ? $content->cardDescCh2 : $content->cardDesc2) : $content->cardLabel2),
            "cardIcon2" => $content->cardIcon2 ?: "",
            "cardLinkTo2" => $content->cardLinkTo2 ?: "",
            "cardIsShow2" => $content->cardIsShow2 ?: "",
            "thumbnailThree" => $content->thumbnailThree ?: "",
            "cardTitle3" => $lang == "KHM" ? ($content->cardTitleKh3 ? $content->cardTitleKh3 : $content->cardTitle3) : ($lang == "CH" ? ($content->cardTitleCh3 ? $content->cardTitleCh3 : $content->cardTitle3) : $content->cardTitle3),
            "cardDesc3" => $lang == "KHM" ? ($content->cardDescKh3 ? $content->cardDescKh3 : $content->cardDesc3) : ($lang == "CH" ? ($content->cardDescCh3 ? $content->cardDescCh3 : $content->cardDesc3) : $content->cardDesc3),
            "cardLabel3" => $lang == "KHM" ? ($content->cardLabelKh3 ? $content->cardLabelKh3 : $content->cardLabel3) : ($lang == "CH" ? ($content->cardLabelCh3 ? $content->cardLabelCh3 : $content->cardLabel3) : $content->cardLabel3),
            "cardIcon3" => $content->cardIcon3 ?: "",
            "cardLinkTo3" => $content->cardLinkTo3 ?: "",
            "cardIsShow3" => $content->cardIsShow3 ?: "",
            "thumbnailFour" => $content->thumbnailFour ?: "",
            "thumbnailSix" => $content->thumbnailSix ?: "",
            "thumbnailSeven" => $content->thumbnailSeven ?: "",
            "ourDonors" => $lang == "KHM" ? ($content->ourDonorsKh ? $content->ourDonorsKh : $content->ourDonors) : ($lang == "CH" ? ($content->ourDonorsCh ? $content->ourDonorsCh : $content->ourDonors) : $content->ourDonors),
            "thumbnailFive" => $content->thumbnailFive ?: "",
            "getDailyUpdate" => $lang == "KHM" ? ($content->getDailyUpdateKh ? $content->getDailyUpdateKh : $content->getDailyUpdate) : ($lang == "CH" ? ($content->getDailyUpdateCh ? $content->getDailyUpdateCh : $content->getDailyUpdate) : $content->getDailyUpdate),
            "footerDesc" => $lang == "KHM" ? ($content->footerDescKh ? $content->footerDescKh : $content->footerDesc) : ($lang == "CH" ? ($content->footerDescCh ? $content->footerDescCh : $content->footerDesc) : $content->footerDesc)
        ]);
    }

    public function newsEvent(Request $request)
    {
        $lang = $request->header("Accept-Language");
        $news = News::where("isActive", true)
            ->where("isDisplayHomepage", true)
            ->select("id", "title", "titleKh", "titleCh", "image", "summary", "summaryKh", "summaryCh", "type", "date")
            ->orderBy("ordering", "asc")
            ->first();
        $news['createdAt'] = Carbon::parse($news->date)->format('F jS, Y');
        $news->title = $lang == "KHM" ? ($news->titleKh ? $news->titleKh : $news->title) : ($lang == "CH" ? ($news->titleCh ? $news->titleCh : $news->title) : $news->title);
        $news->summary = $lang == "KHM" ? ($news->summaryKh ? $news->summaryKh : $news->summary) : ($lang == "CH" ? ($news->summaryCh ? $news->summaryCh : $news->summary) : $news->summary);

        $newsList = News::where("isActive", true)
            ->where("isDisplayHomepage", true)
            ->where("id", "!=", $news->id)
            ->select("id", "title", "titleKh", "titleCh", "image", "summary", "summaryKh", "summaryCh", "type", "date")
            ->orderBy("ordering", "asc")
            ->get();

        $newsList->each(function ($query) use ($lang) {
            $query['createdAt'] = Carbon::parse($query->date)->format('F jS, Y');
            $query->title = $lang == "KHM" ? ($query->titleKh ? $query->titleKh : $query->title) : ($lang == "CH" ? ($query->titleCh ? $query->titleCh : $query->title) : $query->title);
            $query->summary = $lang == "KHM" ? ($query->summaryKh ? $query->summaryKh : $query->summary) : ($lang == "CH" ? ($query->summaryCh ? $query->summaryCh : $query->summary) : $query->summary);
        });

        return response()->json([
            "news" => $news,
            "newsList" => $newsList
        ]);
    }

    public function partners()
    {
        $partner = Partner::where("isActive", true)->get();
        return response()->json($partner);
    }
}
