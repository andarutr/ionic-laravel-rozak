<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;

class AuthController extends Controller
{
    public function register(Request $req)
    {
        // $this->validate($req, [
        //     'nama_lengkap' => 'required',
        //     'username' => 'required',
        //     'password' => 'required'
        // ]);

        User::create([
            'nama_lengkap' => $req->nama_lengkap,
            'username' => $req->username,
            'password' => \Hash::make($req->password),
        ]);
        
        // $response = new Response('Success');
        // $response->header('Access-Control-Allow-Origin', 'http://localhost:8100');
        // return $response;
        return response('Success')->header('Access-Control-Allow-Origin', 'http://localhost:8100');
    }
}
