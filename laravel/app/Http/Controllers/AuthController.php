<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function getUser()
    {
        if (Auth::check()) {
            $nama_lengkap = Auth::user()->nama_lengkap;
            
            return response()->json([
                'nama_lengkap' => $nama_lengkap
            ]);
        } else {
            return response()->json([
                'error' => 'Tidak ada pengguna yang diotentikasi'
            ], 401); // Atau kode status yang sesuai
        }
        
        // return response()->json([
        //     'nama_lengkap' => $nama_lengkap
        // ])->header('Access-Control-Allow-Origin', 'http://localhost:8100');
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
            return response()->json(['msg' => 'Berhasil Login!'])
            ->header('Access-Control-Allow-Origin', 'http://localhost:8100');
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

        if (!Auth::check()) {
            return response()->json(['msg' => 'Pengguna belum login.'], 400)
                ->header('Access-Control-Allow-Origin', 'http://localhost:8100');
        }

        $old_password = $req->old_password;
        $new_password = $req->new_password;

        if (Hash::check(Auth::user()->password, $old_password)) {
            User::where('id', Auth::user()->id)
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

    public function logout(Request $req)
    {
        $logout = Auth::logout();

        if($logout){
            return response()->json(['msg' => 'Berhasil Logout!'])
            ->header('Access-Control-Allow-Origin', 'http://localhost:8100');
        }else{
            return response()->json(['msg' => 'Gagal Logout!'])
            ->header('Access-Control-Allow-Origin', 'http://localhost:8100');
        }
    }
}
