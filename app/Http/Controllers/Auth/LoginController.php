<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function mostrarFormulario()
    {
        return view('login');
    }

    public function username()
    {
        return 'per_identificacion';
    }

    public function validarDatos(Request $request)
    {
        $this->validateLogin($request);   

        if (Auth::attempt(['per_tipo_identificacion' => $request->tipoDoc,'per_identificacion' => $request->numDoc,'per_contrasena' => $request->clave,'per_rol' => $request->tipoUser ,'per_estado' => '1'])) {
            return redirect()->route('tablero');
        }
        
        return back()
        ->withErrors(['numDoc' => trans('auth.failed')])
        ->withInput(request(['numDoc']));
    }

    protected function validateLogin(Request $request){
        $this->validate($request,[
            'tipoDoc' => 'required|string',
            'numDoc' => 'required|int',
            'clave' => 'required|string',
            'tipoUser' => 'required|int'
        ]);
    }


    public function logout(Request $request){
        Auth::logout();
        $request->session()->invalidate();
        return redirect('/');
    }
}
