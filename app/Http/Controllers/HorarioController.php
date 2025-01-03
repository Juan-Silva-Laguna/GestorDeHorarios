<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Horario;
use App\Aprendiz;
use App\Persona;
use App\Instructor;

class HorarioController extends Controller
{
    public function index(Request $request)
    {

        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;        
        switch ($request->opcion) {
            case 'fk_id_ficha':                
                if ($buscar==''){
                    $tbl_horario = Horario::join('tbl_ficha','tbl_horario.fk_id_ficha','=','tbl_ficha.id_ficha')
                    ->join('tbl_programa','tbl_ficha.fk_id_programa','=','tbl_programa.id_programa')
                    ->distinct('tbl_horario.fk_id_ficha')
                    ->select('tbl_horario.fk_id_ficha','tbl_programa.pro_nombre')
                    ->orderBy('tbl_horario.id_horario', 'desc')->paginate(8);
                }
                else{
                    $tbl_horario = Horario::join('tbl_ficha','tbl_horario.fk_id_ficha','=','tbl_ficha.id_ficha')
                    ->join('tbl_programa','tbl_ficha.fk_id_programa','=','tbl_programa.id_programa')
                    ->distinct('tbl_horario.fk_id_ficha')
                    ->select('tbl_horario.fk_id_ficha','tbl_programa.pro_nombre')
                    ->orderBy('tbl_horario.id_horario', 'desc')
                    ->where($criterio, 'like', '%'. $buscar . '%')->paginate(8);
                } 
                break;
            case 'fk_id_instructor':
                if ($buscar==''){
                    $tbl_horario = Horario::join('tbl_instructor','tbl_horario.fk_id_instructor','=','tbl_instructor.id_instructor')
                    ->join('tbl_persona','tbl_instructor.fk_id_persona','=','tbl_persona.id_persona')
                    ->distinct('tbl_horario.fk_id_instructor')
                    ->select('tbl_horario.fk_id_instructor','tbl_persona.per_nombre','tbl_persona.per_apellidos','tbl_persona.per_identificacion','tbl_instructor.ins_profesion')
                    ->orderBy('tbl_horario.id_horario', 'desc')->paginate(8);
                }
                else{
                    $tbl_horario = Horario::join('tbl_instructor','tbl_horario.fk_id_instructor','=','tbl_instructor.id_instructor')
                    ->join('tbl_persona','tbl_instructor.fk_id_persona','=','tbl_persona.id_persona')
                    ->distinct('tbl_horario.fk_id_instructor')
                    ->select('tbl_horario.fk_id_instructor','tbl_persona.per_nombre','tbl_persona.per_apellidos','tbl_persona.per_identificacion','tbl_instructor.ins_profesion')
                    ->orderBy('tbl_horario.id_horario', 'desc')
                    ->where($criterio, 'like', '%'. $buscar . '%')->paginate(8);
                } 
                break;
            case 'fk_id_ambiente':
                if ($buscar==''){
                    $tbl_horario = Horario::join('tbl_ambiente','tbl_horario.fk_id_ambiente','=','tbl_ambiente.id_ambiente')
                    ->distinct('tbl_horario.fk_id_ambiente')
                    ->select('tbl_horario.fk_id_ambiente','tbl_ambiente.amb_codigo_ambiente','tbl_ambiente.amb_nombre')
                    ->orderBy('tbl_horario.id_horario', 'desc')->paginate(8);
                }
                else{
                    $tbl_horario = Horario::join('tbl_ambiente','tbl_horario.fk_id_ambiente','=','tbl_ambiente.id_ambiente')
                    ->distinct('tbl_horario.fk_id_ambiente')
                    ->select('tbl_ambiente.amb_codigo_ambiente','tbl_ambiente.amb_nombre')
                    ->orderBy('tbl_horario.id_horario', 'desc')
                    ->where($criterio, 'like', '%'. $buscar . '%')->paginate(8);
                }
                break;
        }
        
        return [
            'pagination' => [
                'total'        => $tbl_horario->total(),
                'current_page' => $tbl_horario->currentPage(),
                'per_page'     => $tbl_horario->perPage(),
                'last_page'    => $tbl_horario->lastPage(),
                'from'         => $tbl_horario->firstItem(),
                'to'           => $tbl_horario->lastItem(),
            ],
            'tbl_horario' => $tbl_horario
        ];
    }

    public function validarAmbiente(Request $request)
    {

        if (!$request->ajax()) return redirect('/');

            $distincAmb = Horario::distinct('fk_id_ficha')
            ->select('fk_id_ficha')->where('fk_id_ambiente', '=', $request->idAmbiente)->get();;
        
            $allInfoAmb = Horario::where('fk_id_ambiente', '=', $request->idAmbiente)->get();
        
        return ['distincAmb' => $distincAmb, 'allInfoAmb' => $allInfoAmb];
    }

    public function verHorario(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $clave = $request->clave;
        $valor = $request->valor;    

        if ('fk_id_ficha' == $clave) {
            $tbl_horario = Horario::join('tbl_instructor','tbl_horario.fk_id_instructor','=','tbl_instructor.id_instructor')
            ->join('tbl_persona','tbl_instructor.fk_id_persona','=','tbl_persona.id_persona')
            ->join('tbl_ambiente','tbl_horario.fk_id_ambiente','=','tbl_ambiente.id_ambiente')
            ->where('tbl_horario.fk_id_ficha',$valor)
            ->select('tbl_horario.*', 'tbl_persona.per_nombre AS nombre1', 'tbl_instructor.ins_color AS color', 'tbl_ambiente.amb_codigo_ambiente AS nombre2')->get();
        }
        else if ('fk_id_instructor' == $clave) {
            $tbl_horario = Horario::join('tbl_ficha','tbl_horario.fk_id_ficha','=','tbl_ficha.id_ficha')
            ->join('tbl_ambiente','tbl_horario.fk_id_ambiente','=','tbl_ambiente.id_ambiente')
            ->where('tbl_horario.fk_id_instructor',$valor)
            ->select('tbl_horario.*', 'tbl_ficha.id_ficha AS nombre1', 'tbl_ficha.fic_color AS color', 'tbl_ambiente.amb_codigo_ambiente AS nombre2')->get();
        }
        else if ('fk_id_ambiente' == $clave) {
            $tbl_horario = Horario::join('tbl_ficha','tbl_horario.fk_id_ficha','=','tbl_ficha.id_ficha')
            ->join('tbl_instructor','tbl_horario.fk_id_instructor','=','tbl_instructor.id_instructor')
            ->join('tbl_persona','tbl_instructor.fk_id_persona','=','tbl_persona.id_persona')
            ->where('tbl_horario.fk_id_ambiente',$valor)
            ->select('tbl_horario.*', 'tbl_ficha.id_ficha AS nombre2', 'tbl_instructor.ins_color AS color', 'tbl_persona.per_nombre AS nombre1')->get();
        }

        return ['tbl_horario' => $tbl_horario];
    }

    public function validarItem(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $instructor = $request->instructor;
        $ambiente = $request->ambiente;  
        $horaIni = $request->horaIni;
        $horaFin = $request->horaFin;  
        $ficha = $request->ficha;
        $dias = $request->dias; 
        $nombreIns = $request->nombreIns; 
        $nombreAmb = $request->nombreAmb; 
        $color = $request->color;  
        $arrayDias = explode("-", $dias);
        $errores = [];
        $objetos = [];

        array_pop($arrayDias);
        foreach ($arrayDias as $key => $dia) {
            $tbl_horario_ambiente = Horario::whereRaw("(($horaIni <= hor_hora_inicio AND $horaFin >= hor_hora_fin) OR ($horaIni >= hor_hora_inicio AND $horaFin <= hor_hora_fin) OR ($horaIni >= hor_hora_inicio AND $horaFin >= hor_hora_fin AND $horaIni< hor_hora_fin) OR ($horaIni <= hor_hora_inicio AND $horaFin <= hor_hora_fin AND $horaFin > hor_hora_inicio))")
            ->where('hor_dia','=',$dia)
            ->where('fk_id_ambiente','=',$ambiente)
            ->get();

            $tbl_horario_instructor = Horario::whereRaw("(($horaIni <= hor_hora_inicio AND $horaFin >= hor_hora_fin) OR ($horaIni >= hor_hora_inicio AND $horaFin <= hor_hora_fin) OR ($horaIni >= hor_hora_inicio AND $horaFin >= hor_hora_fin AND $horaIni< hor_hora_fin) OR ($horaIni <= hor_hora_inicio AND $horaFin <= hor_hora_fin AND $horaFin > hor_hora_inicio))")
            ->where('hor_dia','=',$dia)
            ->where('fk_id_instructor','=',$instructor)
            ->get();

            if (count($tbl_horario_ambiente)>0) {
                $day = HorarioController::dias($dia);
                $hai = HorarioController::horas($tbl_horario_ambiente[0]['hor_hora_inicio']);
                $haf = HorarioController::horas($tbl_horario_ambiente[0]['hor_hora_fin']);                
                array_push($errores,'El ambiente '.$nombreAmb.' se enceuntra ocupado entre las '.$hai.' y '.$haf.'H el dia '.$day.' con la ficha '.$tbl_horario_ambiente[0]['fk_id_ficha']);
                if (count($tbl_horario_instructor)>0) {
                    $hii = HorarioController::horas($tbl_horario_instructor[0]['hor_hora_inicio']);
                    $hif = HorarioController::horas($tbl_horario_instructor[0]['hor_hora_fin']);
                    array_push($errores,'El instructor '.$nombreIns.' se enceuntra ocupado entre las '.$hii.' y '.$hif.' el dia '.$day.' con la ficha '.$tbl_horario_instructor[0]['fk_id_ficha']);
                }
            }elseif (count($tbl_horario_instructor)>0) {
                $day = HorarioController::dias($dia);
                $hii = HorarioController::horas($tbl_horario_instructor[0]['hor_hora_inicio']);
                $hif = HorarioController::horas($tbl_horario_instructor[0]['hor_hora_fin']);
                array_push($errores,'El instructor '.$nombreIns.' se enceuntra ocupado entre las '.$hii.' y '.$hif.' el dia '.$day.' con la ficha '.$tbl_horario_instructor[0]['fk_id_ficha']);
            }
            else{
                array_push($objetos,[
                    'dia'        => $dia,
                    'horaIni'    => $horaIni,
                    'horaFin'    => $horaFin,
                    'instructor' => $instructor,
                    'nombreIns'  => $nombreIns,
                    'nombreAmb'  => $nombreAmb,
                    'ambiente'   => $ambiente,
                    'color'   => $color
                ]);
            }

        }

        return [$objetos,$errores];
    }

    public function validarDisponibilidadAmb(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $ambienteNuevo = $request->ambienteNuevo;   
        $ambienteAntiguo = $request->ambienteAntiguo;   
        $ficha = $request->ficha;
        $result=[];
        $val=0;

        $tbl_horario_ambiente = Horario::where('fk_id_ficha','=',$ficha)
        ->where('fk_id_ambiente','=',$ambienteAntiguo)
        ->get();

        foreach ($tbl_horario_ambiente as $key => $ambiente) {
            $tbl_disponibilidad = Horario::whereRaw("(($ambiente->hor_hora_inicio <= hor_hora_inicio AND $ambiente->hor_hora_fin >= hor_hora_fin) OR ($ambiente->hor_hora_inicio >= hor_hora_inicio AND $ambiente->hor_hora_fin <= hor_hora_fin) OR ($ambiente->hor_hora_inicio >= hor_hora_inicio AND $ambiente->hor_hora_fin >= hor_hora_fin AND $ambiente->hor_hora_inicio< hor_hora_fin) OR ($ambiente->hor_hora_inicio <= hor_hora_inicio AND $ambiente->hor_hora_fin <= hor_hora_fin AND $ambiente->hor_hora_fin > hor_hora_inicio))")
            ->where('hor_dia','=',$ambiente->hor_dia)
            ->where('fk_id_ambiente','=',$ambienteNuevo)
            ->get();

            if (count($tbl_disponibilidad)>0) { 
                $val++; 
            }else{
                array_push($result,$ambiente); 
            }
        }

        if ($val==0) {
            return [1,$result];
        }else{
            return [0,'El ambiente seleccionado se encuentra ocupado en ese horario'];
        }
    }

    public function dias($dia)
    {
        switch ($dia) {
            case '1':
                return "Lunes";
                break;
            case '2':
                return "Martes";
                break;
            case '3':
                return "Miercoles";
                break;
            case '4':
                return "Jueves";
                break;
            case '5':
                return "Viernes";
                break;
            case '6':
                return "Sabado";
                break;
        }
    }

    public function horas($hora)
    {
        switch ($hora) {
            case '6':
                return "06:00 A.M";
                break;
            case '7':
                return "07:00 A.M";
                break;
            case '8':
                return "08:00 A.M";
                break;
            case '9':
                return "09:00 A.M";
                break;
            case '10':
                return "10:00 A.M";
                break;
            case '11':
                return "11:00 A.M";
                break;
            case '12':
                return "12:00 P.M";
                break;
            case '13':
                return "01:00 P.M";
                break;
            case '14':
                return "02:00 P.M";
                break;
            case '15':
                return "03:00 P.M";
                break;
            case '16':
                return "04:00 P.M";
                break;
            case '17':
                return "05:00 P.M";
                break;
            case '18':
                return "06:00 P.M";
                break;
            case '19':
                return "07:00 P.M";
                break;
            case '20':
                return "08:00 P.M";
                break;
            case '21':
                return "09:00 P.M";
                break;
            case '22':
                return "10:00 P.M";
                break;
            case '23':
                return "11:00 P.M";
                break;
            case '24':
                return "12:00 A.M";
                break;
        }
    }

    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $todo = $request->todo;

        foreach($todo as $ep=>$det)
        {
            $horario = new Horario();
            $horario->fk_id_ficha = $request->ficha;
            $horario->hor_dia = $det['dia'];
            $horario->hor_hora_inicio = $det['horaIni'];
            $horario->hor_hora_fin = $det['horaFin'];  
            $horario->fk_id_instructor = $det['instructor'];
            $horario->fk_id_ambiente = $det['ambiente'];
            $horario->save();

            $instructor = Instructor::findOrFail($det['instructor']);
            $instructor->ins_horas = $instructor->ins_horas+($det['horaFin']-$det['horaIni']);
            $instructor->save();
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
        $horario = Horario::findOrFail($request->id_horario);
        $horario->pro_nombre = $request->nombre;
        $horario->pro_tipo = $request->tipo;
        $horario->pro_estado = '1';
        $horario->save();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function eliminar(Request $request)
    {
      
        $horario = Horario::find($request->id_hor);
        $ini = $horario->hor_hora_inicio;
        $fin = $horario->hor_hora_fin;
        $ins = $horario->fk_id_instructor;
        $horario->delete();
                
        $instructor = Instructor::findOrFail($ins);
        $instructor->ins_horas = $instructor->ins_horas-($fin-$ini);
        $instructor->save();
        
    }

    public function vaciar(Request $request)
    {
        foreach (Horario::where($request->clave,$request->valor)->get() as $key => $value) {
            $instructor = Instructor::findOrFail($value->fk_id_instructor);
            $instructor->ins_horas = $instructor->ins_horas-($value->hor_hora_fin-$value->hor_hora_inicio);
            $instructor->save();
        }
        Horario::where($request->clave,$request->valor)->delete();
        
    }

}
