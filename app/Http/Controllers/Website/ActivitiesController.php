<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Gallery;
use App\Models\Video;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class ActivitiesController extends Controller
{
    public function gallery()
    {
        $data = Gallery::where('isActive',1)->orderby('ordering','desc')->get();

        return response()->json($data);
    }
    
    public function video()
    {
        $data = Video::where('isActive',1)->orderby('ordering','desc')->get();

        return response()->json($data);
    }
}
