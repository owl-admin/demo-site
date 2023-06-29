<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => '/docs'], function () {
    Route::get('/load_md', [\App\Http\Controllers\IndexController::class, 'loadMD']);
    Route::any('/search', [\App\Http\Controllers\IndexController::class, 'search']);
    Route::get('/changelog', [\App\Http\Controllers\ChangelogController::class, 'index']);
});
