<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Notificacion;
use App\Instructor;
use App\Persona;
use App\Ficha;
use App\Mensaje;
use App\Horario;

class NotificacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $tbl_noti = Notificacion::select('not_clave')->get();

        $hoy = new \DateTime();
        $hoy->format('d-m-Y');

        $tbl_etapa_lectiva = Ficha::where('fic_fecha_fin_lectiva','<=',$hoy)->whereNotIn('id_ficha', $tbl_noti)->get();
        if (count($tbl_etapa_lectiva)!=0) {
            
            foreach ($tbl_etapa_lectiva as $key => $lectiva) {
                $notificacion = new Notificacion();
                $notificacion->not_texto = "La ficha ".$lectiva->id_ficha." ya termino la etapa lectiva";
                $notificacion->not_clave = $lectiva->id_ficha; 
                $notificacion->not_indice = 'ficha';
                $notificacion->not_visto = 0; 
                $notificacion->save();

                $ficha = Ficha::findOrFail($lectiva->id_ficha);
                $ficha->fic_estado = 1; 
                $ficha->save();

                $tbl_hor = Horario::where('fk_id_ficha', $lectiva->id_ficha)->get();                
                
                foreach ($tbl_hor as $key => $hor) {
                    $horas = $hor->hor_hora_fin - $hor->hor_hora_inicio;
                    $instructor = Instructor::findOrFail($hor->fk_id_instructor);
                    $instructor->ins_horas = $instructor->ins_horas-$horas; 
                    $instructor->save();
                }
                
                Horario::where('fk_id_ficha', $lectiva->id_ficha)->delete();
            }
            
        }  

        $tbl_etapa_practica = Ficha::where('fic_fecha_fin_practica','<=',$hoy)->whereIn('id_ficha', Notificacion::select('not_clave')->where('not_visto',1)->get())->get();
        if (count($tbl_etapa_practica)!=0) {
            foreach ($tbl_etapa_practica as $key => $practica) {
                $notificacion = Notificacion::findOrFail($practica->id_ficha);
                $notificacion->not_texto = "La ficha ".$practica->id_ficha." ya termino la etapa practica";
                $notificacion->not_visto = 0; 
                $notificacion->save();

                $ficha = Ficha::findOrFail($practica->id_ficha);
                $ficha->fic_estado = 2; 
                $ficha->save();
            }
        }
        
        $tbl_trimestre = Ficha::where('fic_estado',0)->select('fic_trimestre','id_ficha', 'fic_fecha_inicio')->get();

        try {
            foreach ($tbl_trimestre as $key => $trimestre) {
                $fecha = date("Y-m-d",strtotime($trimestre->fic_fecha_inicio."+ ".(91*($trimestre->fic_trimestre+1))." days"));                
                if ($fecha <= date("Y-m-d")) {
                    if (count(Notificacion::where('not_clave','h'.$trimestre->id_ficha)->get())!=0) {
                        $notificacion = Notificacion::findOrFail('h'.$trimestre->id_ficha);
                        $notificacion->not_texto = "La ficha ".$trimestre->id_ficha." a cumplido su ".($trimestre->fic_trimestre+1)." trimestre, puedes editar el horario";
                        $notificacion->not_visto = 0; 
                        $notificacion->save();
                    }else{
                        $notificacion = new Notificacion();
                        $notificacion->not_texto = "La ficha ".$trimestre->id_ficha." a cumplido su ".($trimestre->fic_trimestre+1)." trimestre, puedes editar el horario";
                        $notificacion->not_clave = 'h'.$trimestre->id_ficha; 
                        $notificacion->not_indice = 'horario';
                        $notificacion->not_visto = 0; 
                        $notificacion->save();
                    }
                    $ficha = Ficha::findOrFail($trimestre->id_ficha);
                    $ficha->fic_trimestre = $ficha->fic_trimestre+1; 
                    $ficha->save();
                }
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
        
        
            
          
        
        $tbl_fin_instructor = Instructor::join('tbl_persona', 'tbl_instructor.fk_id_persona', '=', 'tbl_persona.id_persona')
        ->select('ins_fechaFin','id_instructor','per_nombre','per_apellidos','fk_id_persona')->where('ins_fechaFin','<=',$hoy)->whereNotIn('id_instructor', $tbl_noti)->get();
        if (count($tbl_fin_instructor)!=0) {
            foreach ($tbl_fin_instructor as $key => $instructor) {
                $notificacion = new Notificacion();
                $notificacion->not_texto = "El instructor ".$instructor->per_nombre." ".$instructor->per_apellidos." ya termino su contrato temporal";
                $notificacion->not_clave = $instructor->id_instructor; 
                $notificacion->not_indice = 'instructor';
                $notificacion->not_visto = 0; 
                $notificacion->save();

                Horario::where('fk_id_instructor', $instructor->id_instructor)->delete();

                $instructor = Instructor::findOrFail($instructor->id_instructor);
                $instructor->ins_horas = 0; 
                $instructor->save();

                $persona = Persona::findOrFail($instructor->fk_id_persona);
                $persona->per_estado = 0;  //0 en este caso desactiva
                $persona->save();
            }
        }  
                
        $tbl_notificacion = Notificacion::orderBy('not_visto', 'ASC')->paginate(8);

        return [
            'pagination' => [
                'total'        => $tbl_notificacion->total(),
                'current_page' => $tbl_notificacion->currentPage(),
                'per_page'     => $tbl_notificacion->perPage(),
                'last_page'    => $tbl_notificacion->lastPage(),
                'from'         => $tbl_notificacion->firstItem(),
                'to'           => $tbl_notificacion->lastItem(),
            ],
            'tbl_notificacion' => $tbl_notificacion
        ];
    }

    public function visto(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $notificacion = Notificacion::findOrFail($request->id);
        $notificacion->not_visto = 1; 
        $notificacion->save();
    }
}
