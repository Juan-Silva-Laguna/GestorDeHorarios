<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ambiente;
use App\Notificacion;

class AmbienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function dataListAmbiente(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $tbl_ambiente = Ambiente::where('amb_estado', 1)->get();
        
        return ['tbl_ambiente' => $tbl_ambiente];
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
            $tbl_ambiente = Ambiente::orderBy('id_ambiente', 'desc')->paginate(8);
        }
        else{
            $tbl_ambiente = Ambiente::orderBy('id_ambiente', 'desc')
            ->where('tbl_ambiente.'.$criterio, 'like', '%'. $buscar . '%')->paginate(8);
        }        

        return [
            'pagination' => [
                'total'        => $tbl_ambiente->total(),
                'current_page' => $tbl_ambiente->currentPage(),
                'per_page'     => $tbl_ambiente->perPage(),
                'last_page'    => $tbl_ambiente->lastPage(),
                'from'         => $tbl_ambiente->firstItem(),
                'to'           => $tbl_ambiente->lastItem(),
            ],
            'tbl_ambiente' => $tbl_ambiente
        ];
    }

    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function agregar(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $ambiente = new Ambiente();
        $ambiente->amb_codigo_ambiente = $request->codigo;
        $ambiente->amb_nombre = $request->nombre;
        $ambiente->amb_capacidad = $request->capacidad;
        $ambiente->amb_estado = '1';
        $ambiente->save();
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
        $ambiente = Ambiente::findOrFail($request->id_ambiente);
        $ambiente->amb_codigo_ambiente = $request->codigo;
        $ambiente->amb_nombre = $request->nombre;
        $ambiente->amb_capacidad = $request->capacidad;
        $ambiente->save();
    }

    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $ambiente = Ambiente::findOrFail($request->id_ambiente);
        $ambiente->amb_estado = '0';
        $ambiente->save();
    }

    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $ambiente = Ambiente::findOrFail($request->id_ambiente);
        $ambiente->amb_estado = '1';
        $ambiente->save();

        $notificacion = new Notificacion();
        $notificacion->not_texto = "Infraestructura ha activado el ambiente ".$ambiente->amb_codigo_ambiente;
        $notificacion->not_clave = "A".$ambiente->id_ambiente; 
        $notificacion->not_indice = 'ambiente';
        $notificacion->not_visto = 0; 
        $notificacion->save();
    }
}
