<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function getName(Request $req)
    {
        $user = User::where('username', $req->username)->first();
        
        return response()->json([
            'nama_lengkap' => $user->nama_lengkap,
            'username' => $user->username,
        ]); 
    }

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
            'password' => Hash::make($req->password),
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
            return response()->json([
                'msg' => 'Berhasil Login!',
                'username' => $username
            ])->header('Access-Control-Allow-Origin', 'http://localhost:8100');
        }else{
            return response()->json(['msg' => 'Gagal Login!'], 400)
            ->header('Access-Control-Allow-Origin', 'http://localhost:8100');
        }
    }

    public function update_password(Request $req)
    {
        $this->validate($req, [
            'old_password' => 'required',
            'new_password' => 'required|min:8',
        ]);

        $current_password = User::where('username', $req->userId)->first();

        $old_password = $req->old_password;
        $new_password = $req->new_password;

        if (Hash::check($old_password, $current_password->password)) {
            User::where('username', $req->userId)
                    ->update([
                        'password' => Hash::make($new_password)
                    ]);
    
            return response()->json(['msg' => 'Berhasil Memperbarui Password!'])
                ->header('Access-Control-Allow-Origin', 'http://localhost:8100');
        }else{
            return response()->json(['msg' => 'Password salah!'], 400)
            ->header('Access-Control-Allow-Origin', 'http://localhost:8100');
        }
        
    }

    public function update_profile(Request $req)
    {
        $this->validate($req, [
            'nama_lengkap' => 'required',
            'username' => 'required',
        ]);

        User::where('username', $req->userId)
                ->update([
                    'nama_lengkap' => $req->nama_lengkap,
                    'username' => $req->username
                ]);

        return response()->json(['msg' => 'Berhasil memperbarui profile!']);
    }

    public function logout(Request $req)
    {
        Auth::logout();

        return response()->json(['msg' => 'Yakin ingin logout?'])
            ->header('Access-Control-Allow-Origin', 'http://localhost:8100');
    }
}
