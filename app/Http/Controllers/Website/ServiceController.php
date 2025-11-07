<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Service;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    public function index(Request $request)
    {
        $lang = $request->header('Accept-Language');
        $service = Service::orderBy("id", "asc")->paginate(request("limit", 10));
        $service->each(function($q) use ($lang){
            $service['title'] = $lang == "KHM" ? (!empty($q->titleKh) ? $q->titleKh : $q->title) : $q->title;
        });
        return response()->json($service->items());
    }

    public function detail(Request $request, $id) {
        $lang = $request->header('Accept-Language');
        $service = Service::findOrFail($id);
        $service['title'] = $lang == "KHM" ? (!empty($service->titleKh) ? $service->titleKh : $service->title) : $service->title;
        $service['des'] = $lang == "KHM" ? (!empty($service->contentKh) ? $service->contentKh : $service->content) : $service->content;
        return response()->json($service);
    }
}
