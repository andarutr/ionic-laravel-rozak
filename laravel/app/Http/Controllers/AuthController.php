<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Response;

class AuthController extends Controller
{
    public function register(Request $req)
    {
        $this->validate($req, [
            'nama_lengkap' => 'required',
            'username' => 'required',
            'password' => 'required'
        ]);

        User::create([
            'nama_lengkap' => $req->nama_lengkap,
            'username' => $req->username,
            'password' => \Hash::make($req->password),
        ]);
        
        return response()->json(['msg' => 'Berhasil Register!'])
            ->header('Access-Control-Allow-Origin', 'http://localhost:8100');
    }

    public function login(Request $req)
    {
        $this->validate($req, [
            'username' => 'required',
            'password' => 'required'
        ]);

        $username = $req->username;
        $password = $req->password;

        if(Auth::attempt(['username' => $username, 'password' => $password])){
            return response()->json(['msg' => 'Berhasil Login!'])
            ->header('Access-Control-Allow-Origin', 'http://localhost:8100');
        }else{
            return response()->json(['msg' => 'Gagal Login!'], 400)
            ->header('Access-Control-Allow-Origin', 'http://localhost:8100');
        }
    }
}
