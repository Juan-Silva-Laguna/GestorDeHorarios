<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Ficha;
use App\Aprendiz;
use App\Persona;
use App\Notificacion;


class FichaController extends Controller
{


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function dataListFicha(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $tbl_ficha = Ficha::where('fic_estado',0)->whereRaw("not exists (select tbl_horario.fk_id_ficha from tbl_horario where tbl_ficha.id_ficha = tbl_horario.fk_id_ficha)")
        ->get();
        return ['tbl_ficha' => $tbl_ficha];
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
            $tbl_ficha = Ficha::join('tbl_programa','tbl_ficha.fk_id_programa','=','tbl_programa.id_programa')
            ->select('tbl_ficha.*','tbl_programa.*')
            ->orderBy('tbl_ficha.id_ficha', 'desc')->paginate(8);
        }
        else{
            $tbl_ficha = Ficha::join('tbl_programa','tbl_ficha.fk_id_programa','=','tbl_programa.id_programa')
            ->select('tbl_ficha.*','tbl_programa.*')
            ->orderBy('tbl_ficha.id_ficha', 'desc')
            ->where($criterio,  'like', '%'. $buscar . '%')->paginate(8);
        }        

        return [
            'pagination' => [
                'total'        => $tbl_ficha->total(),
                'current_page' => $tbl_ficha->currentPage(),
                'per_page'     => $tbl_ficha->perPage(),
                'last_page'    => $tbl_ficha->lastPage(),
                'from'         => $tbl_ficha->firstItem(),
                'to'           => $tbl_ficha->lastItem(),
            ],
            'tbl_ficha' => $tbl_ficha
        ];
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function mostrarAprendices(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $ficha = $request->ficha;
        $tbl_ficha = Ficha::join('tbl_aprendiz','tbl_ficha.id_ficha','=','tbl_aprendiz.fk_id_ficha')
        ->join('tbl_persona','tbl_aprendiz.fk_id_persona','=','tbl_persona.id_persona')
        ->where('tbl_ficha.id_ficha',$ficha)
        ->select('tbl_persona.*')->get();
              
        return ['aprendices' => $tbl_ficha];
    }

    public function reporteAmbiente(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;

        $tbl_ambiente = Ficha::join('tbl_ambiente','tbl_ficha.fic_ambiente','=','tbl_ambiente.id_ambiente')
        ->where('fic_ambiente', $buscar)      
        ->select('amb_nombre', 'amb_codigo_ambiente', 'fic_fecha_inicio', 'fic_hora_ini', 'fic_color', 'fic_hora_fin','fic_fecha_fin_lectiva', 'fic_fecha_fin_practica', 'id_ficha')->get();
        
        return ['tbl_ambiente' => $tbl_ambiente];
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
        $ficha = new Ficha();
        $ficha->id_ficha = $request->id_ficha;
        $ficha->fic_fecha_inicio = $request->fecha_ini;
        $ficha->fic_fecha_fin_lectiva = $request->fecha_fin_lec;
        $ficha->fic_fecha_fin_practica = $request->fecha_fin_prac;
        $ficha->fk_id_programa = $request->programa;
        $ficha->fic_hora_ini = $request->hora_inicio;
        $ficha->fic_hora_fin = $request->hora_final;
        $ficha->fic_ambiente = $request->ambiente;
        $ficha->fic_color = $request->color;
        $ficha->fic_trimestre = 0;
        $ficha->fic_estado = 0;
        $ficha->save();

        $aprendices = $request->arrayAprendices;//Array de aprendices
        //Recorro todos los elementos

        foreach($aprendices as $ep=>$det)
        {
            $persona = new Persona();
            $persona->per_nombre = $det['Nombres'];
            $persona->per_apellidos = $det['Apellidos'];
            $persona->per_tipo_identificacion = $det['Tipo Identificación'];  
            $persona->per_identificacion = $det['Numero Identidad'];  
            $persona->per_email = $det['Correo'];
            $persona->per_contrasena = bcrypt($det['Numero Identidad']);
            $persona->per_direccion = $det['Dirección'];
            $persona->per_foto = 'Images/sinFoto.jpg';
            $persona->per_rol = 2;
            $persona->per_estado = '1';
            $persona->save();

            $aprendiz = new Aprendiz();
            $aprendiz->fk_id_ficha = $ficha->id_ficha;
            $aprendiz->fk_id_persona = $persona->id_persona;
            $aprendiz->save();
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
        $ficha = Ficha::findOrFail($request->id_ficha);
        $ficha->fic_fecha_inicio = $request->fecha_ini;
        $ficha->fic_fecha_fin_lectiva = $request->fecha_fin_lec;
        $ficha->fic_fecha_fin_practica = $request->fecha_fin_prac;
        $ficha->save();
    }

    public function eliminar(Request $request)
    {
        
        $tbl_aprendices = Aprendiz::select('fk_id_persona')
        ->where('fk_id_ficha', $request->id)->get(); 

        $aprendiz = Aprendiz::where('fk_id_ficha', $request->id)->delete();


        $ficha = Ficha::where('id_ficha', $request->id)->delete();

        $notificacion = Notificacion::where('not_clave', $request->id)->delete();

        $triemestre = Notificacion::where('not_clave', 'h'.$request->id)->delete();

        $cont=0;
        foreach ($tbl_aprendices as $key => $aprendiz) {
            if (Persona::where('id_persona', $aprendiz['fk_id_persona'])->delete()) {
                $cont++;
            }
        }

        if ($aprendiz && $ficha && $notificacion && $triemestre && $cont == count($tbl_aprendices)) {
            return [1, 'Has eliminado los datos de la ficha '.$request->id.' con exito'];
        }

        return [0, 'Hay ciertos inconvenientes'];

    }
    

    public function mostrarMisAprendices(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $ficha = $request->ficha;
    
        $tbl_ficha = Ficha::join('tbl_aprendiz','tbl_ficha.id_ficha','=','tbl_aprendiz.fk_id_ficha')
        ->join('tbl_persona', 'tbl_persona.id_persona','=','tbl_aprendiz.fk_id_persona')
        ->select('tbl_persona.per_nombre','tbl_persona.per_email','tbl_persona.per_foto')
        ->where('tbl_ficha.id_ficha', $ficha)->get();                
                
        return ['tbl_ficha' => $tbl_ficha];
    }
}
