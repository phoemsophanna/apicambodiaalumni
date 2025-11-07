<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Portfolio;
use Carbon\Carbon;
use Illuminate\Http\Request;

class PortfolioController extends Controller
{
    public function index(Request $request)
    {
        $lang = $request->header('Accept-Language');
        $items = Portfolio::orderBy("id", "asc")->get();
        $items->each(function($q) use ($lang){
            $q['title_content'] = $lang == "KHM" ? (!empty($q->titleKh) ? $q->titleKh : $q->title) : $q->title;
            $q['datetime'] = Carbon::parse($q->fromDate)->format('d M');
        });
        return response()->json($items);
    }

    public function detail(Request $request, $id) {
        $lang = $request->header('Accept-Language');
        $item = Portfolio::findOrFail($id);
        $item['title_content'] = $lang == "KHM" ? (!empty($item->titleKh) ? $item->titleKh : $item->title) : $item->title;
        $item['datetime'] = Carbon::parse($item->fromDate)->format('d M');
        $item['des'] = $lang == "KHM" ? (!empty($item->contentKh) ? $item->contentKh : $item->content) : $item->content;
        return response()->json($item);
    }
}
