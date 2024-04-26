<?php

namespace App\Http\Controllers;

use App\Models\JadwalLapangan;
use App\Models\Lapangan;
use Illuminate\Http\Request;

class JadwalLapanganController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $datas = JadwalLapangan::all();
        return view('jadwal.jadwal', compact('datas'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $lapangans = Lapangan::all();
        // dd($lapangans);
        return view('jadwal.formjadwal', compact('lapangans'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'idlapangan' => 'required',
            'waktu' => 'required',

        ]);

        // dd($request->all());
        // Simpan data ke dalam database
        JadwalLapangan::create([
            'lapangan_id' => $request->idlapangan,
            'jam' => $request->waktu,
        ]);

        return redirect()->route('jadwal_lapangans.index')->with('success', 'Post berhasil ditambahkan!');
    }

    /**
     * Display the specified resource.
     */
    public function show(JadwalLapangan $jadwalLapangan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(JadwalLapangan $jadwalLapangan)
    {
        // dd($jadwalLapangan);
        $lapangans= Lapangan::all();
        return view('jadwal.formeditjadwal', compact('jadwalLapangan', 'lapangans'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, JadwalLapangan $jadwalLapangan)
    {
        $request->validate([
            'idlapangan' => 'required',
            'waktu' => 'required',

        ]);

        // dd($request->all());
        // Simpan data ke dalam database
        $jadwalLapangan->update([
            'lapangan_id' => $request->idlapangan,
            'jam' => $request->waktu,
        ]);

        return redirect()->route('jadwal_lapangans.index')->with('success', 'Post berhasil dirubah!');

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(JadwalLapangan $jadwalLapangan)
    {
        $jadwalLapangan->delete();
        return redirect()->route('jadwal_lapangans.index')->with('success', 'Data berhasil dihapus!');
    }
}
