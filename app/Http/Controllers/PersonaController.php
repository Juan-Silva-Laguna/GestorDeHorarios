<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Persona;
use App\Aprendiz;
use App\Horario;

class PersonaController extends Controller
{
    public function mostrarPerfil(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $id = $request->id;
        $tbl_persona = Persona::where('id_persona', $id)->get();
                
        return ['tbl_persona' => $tbl_persona];
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

    public function cambiarClave(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $persona = Persona::findOrFail($request->id_persona);
        $persona->per_contrasena = bcrypt($request->clave);
        $persona->save();
    }

    public function mostrarMisFichas(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $id = $request->id;
        $tbl_persona = Persona::join('tbl_instructor','tbl_persona.id_persona','=','tbl_instructor.fk_id_persona')
        ->join('tbl_horario', 'tbl_instructor.id_instructor','=','tbl_horario.fk_id_instructor')
        ->join('tbl_ficha', 'tbl_ficha.id_ficha','=','tbl_horario.fk_id_ficha')
        ->join('tbl_programa', 'tbl_programa.id_programa','=','tbl_ficha.fk_id_programa')
        ->distinct('tbl_horario.fk_id_ficha')
        ->select('tbl_programa.pro_nombre', 'tbl_ficha.id_ficha')
        ->where('tbl_persona.id_persona', $id)->get();

        return ['tbl_persona' => $tbl_persona];
    }

    public function mostrarMisAmbientes(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $id = $request->id;
        $rol = $request->rol;
        switch ($rol) {
            case 3:
                $tbl_persona = Persona::join('tbl_instructor','tbl_persona.id_persona','=','tbl_instructor.fk_id_persona')
                ->join('tbl_horario', 'tbl_instructor.id_instructor','=','tbl_horario.fk_id_instructor')
                ->join('tbl_ficha', 'tbl_ficha.id_ficha','=','tbl_horario.fk_id_ficha')
                ->join('tbl_ambiente', 'tbl_ambiente.id_ambiente','=','tbl_horario.fk_id_ambiente')
                ->distinct('tbl_horario.fk_id_ambiente')
                ->select('tbl_ambiente.amb_nombre', 'tbl_ambiente.amb_codigo_ambiente')
                ->where('tbl_instructor.fk_id_persona', $id)->get();
                break;
            case 2:
                $tbl_persona = Persona::join('tbl_aprendiz','tbl_persona.id_persona','=','tbl_aprendiz.fk_id_persona')
                ->join('tbl_ficha', 'tbl_aprendiz.fk_id_ficha','=','tbl_ficha.id_ficha')
                ->join('tbl_horario', 'tbl_ficha.id_ficha','=','tbl_horario.fk_id_ficha')
                ->join('tbl_ambiente', 'tbl_ambiente.id_ambiente','=','tbl_horario.fk_id_ambiente')
                ->distinct('tbl_horario.fk_id_ambiente')
                ->select('tbl_ambiente.amb_nombre', 'tbl_ambiente.amb_codigo_ambiente')
                ->where('tbl_aprendiz.fk_id_persona', $id)->get();
                break;
        }
            

        return ['tbl_persona' => $tbl_persona];
    }

    public function mostrarMisInstructores(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $id = $request->id;
        $tbl_persona = Aprendiz::join('tbl_ficha','tbl_aprendiz.fk_id_ficha','=','tbl_ficha.id_ficha')
        ->join('tbl_horario','tbl_ficha.id_ficha','=','tbl_horario.fk_id_ficha')
        ->join('tbl_instructor', 'tbl_horario.fk_id_instructor','=','tbl_instructor.id_instructor')
        ->join('tbl_persona', 'tbl_instructor.fk_id_persona','=','tbl_persona.id_persona')
        ->distinct('tbl_horario.fk_id_instructor')
        ->select('tbl_persona.per_nombre','tbl_persona.per_email','tbl_persona.per_foto','tbl_instructor.ins_profesion')
        ->get();

        return ['tbl_persona' => $tbl_persona];
    }

    public function mostrarMiHorario(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $id = $request->id;
        $rol = $request->rol;
        switch ($rol) {
            case 3:
                $tbl_persona = Persona::join('tbl_instructor','tbl_persona.id_persona','=','tbl_instructor.fk_id_persona')
                ->join('tbl_horario', 'tbl_instructor.id_instructor','=','tbl_horario.fk_id_instructor')
                ->join('tbl_ficha', 'tbl_ficha.id_ficha','=','tbl_horario.fk_id_ficha')
                ->join('tbl_ambiente', 'tbl_ambiente.id_ambiente','=','tbl_horario.fk_id_ambiente')
                ->select('tbl_horario.*','tbl_ficha.fic_color AS color','tbl_ficha.id_ficha AS nombre1','tbl_ambiente.amb_codigo_ambiente AS nombre2')
                ->where('tbl_instructor.fk_id_persona', $id)->get();                
                break;
            case 2:
                $tbl= Persona::join('tbl_aprendiz','tbl_persona.id_persona','=','tbl_aprendiz.fk_id_persona')
                ->select('tbl_aprendiz.fk_id_ficha')
                ->where('tbl_aprendiz.fk_id_persona', $id)->get();  
                
                foreach ($tbl as $key => $t) {
                    $tbl_persona = Horario::join('tbl_instructor','tbl_horario.fk_id_instructor','=','tbl_instructor.id_instructor')
                    ->join('tbl_persona','tbl_instructor.fk_id_persona','=','tbl_persona.id_persona')
                    ->join('tbl_ambiente','tbl_horario.fk_id_ambiente','=','tbl_ambiente.id_ambiente')
                    ->where('tbl_horario.fk_id_ficha',$t->fk_id_ficha)
                    ->select('tbl_horario.*', 'tbl_persona.per_nombre AS nombre1', 'tbl_instructor.ins_color AS color', 'tbl_ambiente.amb_codigo_ambiente AS nombre2')->get();
               }
            break;
        }        
        return ['tbl_persona' => $tbl_persona];
    }

    public function cambiarFoto(Request $request)
    {
        if ('Images/sinFoto.jpg' != $request->fotoAntigua) {
            $array = explode("/", $request->fotoAntigua);
            \Storage::delete($array[count($array)-1]);
        }
        $file = $request->file('foto');
        $nombre = $file->getClientOriginalName();
        \Storage::disk('local')->put($nombre,  \File::get($file));

        $persona = Persona::findOrFail($request->id_persona);
        $persona->per_foto = 'Images/fotos/'.$nombre;
        $persona->save();

        return $persona->per_foto;
    }
}
