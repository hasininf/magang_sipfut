<?php

use App\Http\Controllers\JadwalLapanganController;
use App\Http\Controllers\LapanganController;
use App\Http\Controllers\MetodePembayaranController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    // return view('login');
});
Route::get('/dashboard', function () {
    return view('welcome');
});

Route::get('/lapangan', [LapanganController::class,'index'])->name('lapangans.index');
Route::get('/lapangan/create', [LapanganController::class,'create'])->name('lapangans.create');
// Route::get('/lapangan/create', function () {
//     return view('formlapangan');
// });
Route::post('/lapangan/store', [LapanganController::class,'store'])->name('lapangans.store');
Route::get('/lapangan/{lapangan}/edit', [LapanganController::class,'edit'])->name('lapangans.edit');
Route::put('/lapangan/{lapangan}', [LapanganController::class,'update'])->name('lapangans.update');
Route::delete('/lapangan/{lapangan}', [LapanganController::class,'destroy'])->name('lapangans.destroy');



Route::get('/jadwal', [JadwalLapanganController::class,'index'])->name('jadwal_lapangans.index');
Route::get('/jadwal/create', [JadwalLapanganController::class,'create'])->name('jadwal_lapangans.create');
Route::post('/jadwal/store', [JadwalLapanganController::class, 'store'])->name('jadwal_lapangans.store');
Route::delete('/jadwal/{jadwalLapangan}', [JadwalLapanganController::class,'destroy'])->name('jadwal_lapangans.destroy');
Route::get('/jadwal/{jadwalLapangan}/edit', [JadwalLapanganController::class,'edit'])->name('jadwal_lapangans.edit');
Route::put('/jadwal/{jadwalLapangan}', [JadwalLapanganController::class,'update'])->name('jadwal_lapangans.update');


Route::get('/metodebayar', [MetodePembayaranController::class,'index'])->name('metode_pembayarans.index');
Route::get('/metodebayar/create', [MetodePembayaranController::class,'create'])->name('metode_pembayarans.create');
Route::post('/metodebayar/store', [MetodePembayaranController::class, 'store'])->name('metode_pembayarans.store');
Route::delete('/metodebayar/{metodePembayaran}', [MetodePembayaranController::class,'destroy'])->name('metode_pembayarans.destroy');
Route::get('/metodebayar/{metodePembayaran}/edit', [MetodePembayaranController::class,'edit'])->name('metode_pembayarans.edit');
Route::put('/metodebayar/{metodePembayaran}', [MetodePembayaranController::class,'update'])->name('metode_pembayarans.update');

