<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Instructor;
use App\Persona;
use App\Notificacion;

class InstructorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function dataListInstructor(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $tbl_instructor = Instructor::join('tbl_persona', 'tbl_instructor.fk_id_persona', '=', 'tbl_persona.id_persona')
        ->where('tbl_persona.per_estado', 1)->get();
        
        $tbla_ins = [];
        foreach ($tbl_instructor as $key => $tbl) {
            if ($tbl->ins_tipo_contrato == 'Indefinido' && $tbl->ins_horas < 36 ) {
                array_push($tbla_ins, $tbl);
            }
            if ($tbl->ins_tipo_contrato == 'Temporal' && $tbl->ins_horas < 32 ) {
                array_push($tbla_ins, $tbl);
            }
        }
        
        return ['tbl_instructor' => $tbla_ins];
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $tbl_instructor = Instructor::join('tbl_persona', 'tbl_instructor.fk_id_persona', '=', 'tbl_persona.id_persona')
            ->orderBy('id_instructor', 'desc')->paginate(8);
        }
        else{
            $tbl_instructor = Instructor::join('tbl_persona', 'tbl_instructor.fk_id_persona', '=', 'tbl_persona.id_persona')
            ->orderBy('id_instructor', 'desc')
            ->where($criterio, 'like', '%'. $buscar . '%')->paginate(8);
        }        

        return [
            'pagination' => [
                'total'        => $tbl_instructor->total(),
                'current_page' => $tbl_instructor->currentPage(),
                'per_page'     => $tbl_instructor->perPage(),
                'last_page'    => $tbl_instructor->lastPage(),
                'from'         => $tbl_instructor->firstItem(),
                'to'           => $tbl_instructor->lastItem(),
            ],
            'tbl_instructor' => $tbl_instructor
        ];
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
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
        $persona->per_rol = '3';
        $persona->per_estado = '1';
        $persona->save();

        $instructor = new Instructor();
        $instructor->ins_profesion = $request->profesion;
        $instructor->ins_tipo_contrato = $request->tipoContrato;
        $instructor->ins_fechaInicio = $request->fechaIni;
        $instructor->ins_fechaFin = $request->fechaFin;
        $instructor->fk_id_persona = $persona->id_persona; 
        $instructor->ins_horas = 0;
        $instructor->ins_color = $request->color;       
        $instructor->save();

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 

        $instructor = Instructor::findOrFail($request->id_instructor);
        $instructor->ins_profesion = $request->profesion;
        $instructor->ins_tipo_contrato = $request->tipoContrato;
        $instructor->ins_fechaInicio = $request->fechaIni;
        $instructor->ins_fechaFin = $request->fechaFin;       
        $instructor->save();

        $persona = Persona::findOrFail($request->id_persona);
        $persona->per_nombre = $request->nombre;
        $persona->per_apellidos = $request->apellido;
        $persona->per_tipo_identificacion = $request->tipoDocumento;
        $persona->per_identificacion = $request->documento;
        $persona->per_email = $request->email;
        $persona->per_direccion = $request->direccion;
        $persona->per_estado = '1';
        $persona->save();

        Notificacion::where('not_clave', $request->id_instructor)->delete();

    }

    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $persona = Persona::findOrFail($request->id_persona);
        $persona->per_estado = '0';
        $persona->save();
    }

    
}
