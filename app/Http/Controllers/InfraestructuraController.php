<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Persona;

class InfraestructuraController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $tbl_persona = Persona::where('per_rol', '4')->orderBy('id_persona', 'desc')->paginate(8);
        }
        else{
            $tbl_persona = Persona::orderBy('id_persona', 'desc')
            ->where('per_rol', '4')
            ->where($criterio, 'like', '%'. $buscar . '%')->paginate(8);
        }        

        return [
            'pagination' => [
                'total'        => $tbl_persona->total(),
                'current_page' => $tbl_persona->currentPage(),
                'per_page'     => $tbl_persona->perPage(),
                'last_page'    => $tbl_persona->lastPage(),
                'from'         => $tbl_persona->firstItem(),
                'to'           => $tbl_persona->lastItem(),
            ],
            'tbl_infraestructura' => $tbl_persona
        ];
    }

    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $persona = new Persona();
        $persona->per_nombre = $request->nombre;
        $persona->per_apellidos = $request->apellido;
        $persona->per_tipo_identificacion = $request->tipoDocumento;
        $persona->per_identificacion = $request->documento;
        $persona->per_email = $request->email;
        $persona->per_contrasena = bcrypt($request->documento);
        $persona->per_direccion = $request->direccion;
        $persona->per_foto = 'Images/sinFoto.jpg';
        $persona->per_rol = '4';
        $persona->per_estado = '1';
        $persona->save();
    }

    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $persona = Persona::findOrFail($request->id_persona);
        $persona->per_nombre = $request->nombre;
        $persona->per_apellidos = $request->apellido;
        $persona->per_tipo_identificacion = $request->tipoDocumento;
        $persona->per_identificacion = $request->documento;
        $persona->per_email = $request->email;
        $persona->per_direccion = $request->direccion;
        $persona->save();
    }

    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $persona = Persona::findOrFail($request->id_persona);
        $persona->per_estado = '0';
        $persona->save();
    }

    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $persona = Persona::findOrFail($request->id_persona);
        $persona->per_estado = '1';
        $persona->save();
    }
}
