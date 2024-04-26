<?php

namespace App\Http\Controllers;

use App\Models\MetodePembayaran;
use Illuminate\Http\Request;

class MetodePembayaranController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $metodebayars = MetodePembayaran::all(); // Mengambil semua post dari tabel posts
        return view('metodebayar.index', compact('metodebayars'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('metodebayar.formmetode');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nama' => 'required',
            'nomor' => 'required',
            'gambar' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // validasi gambar

        ]);

        // dd($request->all());
        // untuk memindahkan gambar ke direktori images di public
        // selanjutnya di terminal ketikan php artisan storage:link
        $gambar = $request->file('gambar')->store('images', 'public');

        // Simpan data ke dalam database
        MetodePembayaran::create([
            'nama' => $request->nama,
            'nomor' => $request->nomor,
            'gambar' => $gambar,
        ]);

        return redirect()->route('metode_pembayarans.index')->with('success', 'Post berhasil ditambahkan!');

    }

    /**
     * Display the specified resource.
     */
    public function show(MetodePembayaran $metodePembayaran)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(MetodePembayaran $metodePembayaran)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, MetodePembayaran $metodePembayaran)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(MetodePembayaran $metodePembayaran)
    {
        //
    }
}
