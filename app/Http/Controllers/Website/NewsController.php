<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\News;
use Carbon\Carbon;
use Illuminate\Http\Request;

class NewsController extends Controller
{
    public function newsEvents(Request $request)
    {
        $lang = $request->header("Accept-Language");
        $type = $request->type;
        $data = News::select(
            "id",
            "title",
            "titleKh",
            "titleCh",
            "image",
            "summary",
            "summaryKh",
            "summaryCh",
            "type",
            "date"
        )->when($type, function ($query) use ($type) {
            $query->where("type", $type);
        })->where("isActive", true)->orderBy("created_at", "desc")->get();
        $data->each(function ($query) use ($lang) {
            $query['createdAt'] = Carbon::parse($query->date)->format('jS F, Y');
            $query->title = $lang == "KHM" ? ($query->titleKh ? $query->titleKh : $query->title) : ($lang == "CH" ? ($query->titleCh ? $query->titleCh : $query->title) : $query->title);
            $query->summary = $lang == "KHM" ? ($query->summaryKh ? $query->summaryKh : $query->summary) : ($lang == "CH" ? ($query->summaryCh ? $query->summaryCh : $query->summary) : $query->summary);
        });

        return response()->json($data);
    }

    public function listRelated(Request $request)
    {
        $lang = $request->header("Accept-Language");
        $type = $request->type;
        $id = $request->id;
        $data = News::select(
            "id",
            "title",
            "titleKh",
            "titleCh",
            "image",
            "summary",
            "summaryKh",
            "summaryCh",
            "type",
            "date"
        )
            ->when($type, function ($query) use ($type) {
                $query->where("type", $type);
            })
            ->where("id", "!=", $id)
            ->where("isActive", true)
            ->orderBy("date", "desc")
            ->limit(6)
            ->get();
        $data->each(function ($query) use ($lang) {
            $query['createdAt'] = Carbon::parse($query->date)->format('jS F, Y');
            $query->title = $lang == "KHM" ? ($query->titleKh ? $query->titleKh : $query->title) : ($lang == "CH" ? ($query->titleCh ? $query->titleCh : $query->title) : $query->title);
            $query->summary = $lang == "KHM" ? ($query->summaryKh ? $query->summaryKh : $query->summary) : ($lang == "CH" ? ($query->summaryCh ? $query->summaryCh : $query->summary) : $query->summary);
        });

        return response()->json($data);
    }

    public function detail(Request $request,$id)
    {
        $lang = $request->header("Accept-Language");
        $data = News::where("id", $id)->first();
        $data->title = $lang == "KHM" ? ($data->titleKh ? $data->titleKh : $data->title) : ($lang == "CH" ? ($data->titleCh ? $data->titleCh : $data->title) : $data->title);
        $data->content = $lang == "KHM" ? ($data->contentKh ? $data->contentKh : $data->content) : ($lang == "CH" ? ($data->contentCh ? $data->contentCh : $data->content) : $data->content);
        return response()->json($data);
    }
}
