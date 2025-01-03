<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ambiente;
use App\Mantenimiento;
use App\Horario;

class MantenimientoController extends Controller
{
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
            $tbl_mantenimiento = Mantenimiento::join('tbl_ambiente','tbl_mantenimiento.fk_id_ambiente','=','tbl_ambiente.id_ambiente')
            ->where('tbl_mantenimiento.man_estado', '=','1')->orderBy('tbl_mantenimiento.id_mantenimiento', 'desc')->paginate(15);
        }
        else{
            $tbl_mantenimiento = Mantenimiento::join('tbl_ambiente','tbl_mantenimiento.fk_id_ambiente','=','tbl_ambiente.id_ambiente')
            ->where('tbl_mantenimiento.man_estado', '=','1')->where($criterio, 'like', '%'. $buscar . '%')->orderBy('tbl_mantenimiento.id_mantenimiento', 'desc')->paginate(15);
        } 
        
        return [
            'pagination' => [
                'total'        => $tbl_mantenimiento->total(),
                'current_page' => $tbl_mantenimiento->currentPage(),
                'per_page'     => $tbl_mantenimiento->perPage(),
                'last_page'    => $tbl_mantenimiento->lastPage(),
                'from'         => $tbl_mantenimiento->firstItem(),
                'to'           => $tbl_mantenimiento->lastItem(),
            ],
            'tbl_mantenimiento' => $tbl_mantenimiento
        ];
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function registrar(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $ides='';
        foreach ($request->fich_amb as $key => $value) {
            $ides .= $value[1].';';
            $ambiente = Horario::findOrFail($value[1]);
            $ambiente->fk_id_ambiente = $value[0];
            $ambiente->save();
        }

        $mantenimiento = new Mantenimiento();
        $mantenimiento->man_problema = $request->problema;
        $mantenimiento->man_ides_amb = $ides;
        $mantenimiento->man_estado = '0';
        $mantenimiento->fk_id_ambiente = $request->id_ambiente;
        $mantenimiento->save();

        $ambiente = Ambiente::findOrFail($request->id_ambiente);
        $ambiente->amb_estado = 0;
        $ambiente->save();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function ambientesInactivos(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $tbl_ambiente = Mantenimiento::join('tbl_ambiente','tbl_mantenimiento.fk_id_ambiente','=','tbl_ambiente.id_ambiente')
        ->where('tbl_ambiente.amb_estado', '=','0')->where('tbl_mantenimiento.man_estado', '=','0')->paginate(8);
         

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
    public function editar(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        
        $mantenimiento = Mantenimiento::findOrFail($request->id_mantenimiento);
        $mantenimiento->man_reparacion = $request->arreglo;
        $mantenimiento->man_estado = '1';
        $mantenimiento->fk_id_persona = $request->id_responsable;
        $mantenimiento->save();


        $ambiente = Ambiente::findOrFail($request->id_ambiente);
        $ambiente->amb_estado = 1;
        $ambiente->save();

        for ($i=0; $i < count($request->arrayIdes)-1; $i++) { 
            $horAmbiente = Horario::findOrFail($request->arrayIdes[$i]);
            $horAmbiente->fk_id_ambiente = $request->id_ambiente;
            $horAmbiente->save();
        }
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

}
