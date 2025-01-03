<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Programa;

class ProgramaController extends Controller
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
            $tbl_programa = Programa::orderBy('id_programa', 'desc')->paginate(8);
        }
        else{
            $tbl_programa = Programa::orderBy('id_programa', 'desc')
            ->where('tbl_programa.'.$criterio, 'like', '%'. $buscar . '%')->paginate(8);
        }        

        return [
            'pagination' => [
                'total'        => $tbl_programa->total(),
                'current_page' => $tbl_programa->currentPage(),
                'per_page'     => $tbl_programa->perPage(),
                'last_page'    => $tbl_programa->lastPage(),
                'from'         => $tbl_programa->firstItem(),
                'to'           => $tbl_programa->lastItem(),
            ],
            'tbl_programa' => $tbl_programa
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function search(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $letras = $request->letras;
        $tbl_programa = Programa::all();
        
        return ['tbl_programa' => $tbl_programa];
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
        $programa = new Programa();
        $programa->pro_nombre = $request->nombre;
        $programa->pro_tipo = $request->tipo;
        $programa->pro_estado = '1';
        $programa->save();
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
        $programa = Programa::findOrFail($request->id_programa);
        $programa->pro_nombre = $request->nombre;
        $programa->pro_tipo = $request->tipo;
        $programa->pro_estado = '1';
        $programa->save();
    }

    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $programa = Programa::findOrFail($request->id_programa);
        $programa->pro_estado = '0';
        $programa->save();
    }

    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $programa = Programa::findOrFail($request->id_programa);
        $programa->pro_estado = '1';
        $programa->save();
    }
}
