<?php

namespace App\Http\Controllers;

use App\Models\Lapangan;
use Illuminate\Http\Request;

class LapanganController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $lapangans = Lapangan::all(); // Mengambil semua post dari tabel posts
        return view('lapangan', compact('lapangans'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('formlapangan');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'lokasi' => 'required|max:255',
            'nama' => 'required',
            // 'gambar' => 'required',
            'harga' => 'required',
            'gambar' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // validasi gambar

        ]);
        // untuk memindahkan gambar ke direktori images di public
        // selanjutnya di terminal ketikan php artisan storage:link
        $gambar = $request->file('gambar')->store('images', 'public');

        // Simpan data ke dalam database
        Lapangan::create([
            'lokasi' => $request->lokasi,
            'nama' => $request->nama,
            'gambar' => $gambar,
            'harga' => $request->harga,
        ]);

        return redirect()->route('lapangans.index')->with('success', 'Post berhasil ditambahkan!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Lapangan $lapangan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Lapangan $lapangan)
    {
        return view('formeditlapangan', compact('lapangan'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Lapangan $lapangan)
    {
        $request->validate([
            'lokasi' => 'required|max:255',
            'nama' => 'required',
            // 'gambar' => 'required',
            'harga' => 'required',
            'gambar' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // validasi gambar

        ]);
        if($request->hasFile('gambar')){

        $gambar = $request->file('gambar')->store('images', 'public');
        }
        else{
            //mengambil nama file yg lama
            $gambar = $lapangan->gambar;
        }
        // Simpan data ke dalam database
        $lapangan->update([
            'lokasi' => $request->lokasi,
            'nama' => $request->nama,
            'gambar' => $gambar,
            'harga' => $request->harga,
        ]);

        return redirect()->route('lapangans.index')->with('success', 'Data berhasil ditambahkan!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Lapangan $lapangan)
    {
        $lapangan->delete();
        return redirect()->route('lapangans.index')->with('success', 'Data berhasil dihapus!');
    }
}
