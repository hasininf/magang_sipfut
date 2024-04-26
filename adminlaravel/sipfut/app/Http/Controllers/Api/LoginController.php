<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Exception;
use Illuminate\Auth\Events\Login;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $request->validate([
                'nama' => 'required',
                'email' => 'required|unique:users,email',
                'password' => 'required',
            ]);
            User::create([
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'role' => 'pengguna',
            ]);
            return response()->json(['status' => 1, 'message' => 'Pendaftaran Akun Berhasil']);
        } catch (Exception $e) {
            return response()->json(['status' => 0, 'message' => 'Email Sudah Terdaftar']);

        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ]);

        if (auth()->attempt(['email' => $request->email, 'password' => $request->password])) {
            return response()->json(['status' => '1', 'message' => 'Berhasil Login','user'=>auth()->user()]);
        } else {
            return response()->json(['status' => '0', 'message' => 'Gagal Login']);
        }
    }
}
