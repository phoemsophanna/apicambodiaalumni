<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
    protected function redirectTo(Request $request)
    {
        if($request->is('api/*'))
        {
            throw new HttpResponseException(response()->json(['message'=>'Unauthorized', 'code' => 401], 401));
        }

        if (!$request->expectsJson()) {
            session()->flash('message', 'Exceeded an inactivity period of over 15 mins. Kindly re-login to continue');
            return route('login');
        }
    }
}
