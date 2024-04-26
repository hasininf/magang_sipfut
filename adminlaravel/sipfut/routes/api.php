<?php

use App\Http\Controllers\Api\JadwalController;
use App\Http\Controllers\Api\LapanganController;
use App\Http\Controllers\Api\LoginController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//di Api tidak perlu name
Route::post('/login', [LoginController::class,'login']);
Route::post('/register', [LoginController::class,'store']);

Route::get('/lapangan', [LapanganController::class, 'index']);

Route::get('/jadwal/{id}', [JadwalController::class, 'index']);
