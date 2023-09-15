<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', fn() => redirect('/admin'));

Route::get('/doc', [\App\Http\Controllers\IndexController::class, 'index']);
Route::name('doc.')->get('/', [\App\Http\Controllers\IndexController::class, 'index']);
