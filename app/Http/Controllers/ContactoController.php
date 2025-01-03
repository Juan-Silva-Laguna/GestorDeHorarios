<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Contacto;
use App\Notificacion;

class ContactoController extends Controller
{
    public function enviarMensaje(Request $request)
    {
        $contacto = new Contacto();
        $contacto->con_nombre = $request->nombre;
        $contacto->con_correo = $request->correo;
        $contacto->con_celular = $request->celular;
        $contacto->con_asunto = $request->asunto;
        $contacto->con_mensaje = $request->mensaje;  
        $contacto->con_visto = '0'; 
        $con = $contacto->save();

        $notificacion = new Notificacion();
        $notificacion->not_texto = "Tienes un mensaje de  ".$request->nombre." con el siguiente asunto: ".$request->asunto;
        $notificacion->not_clave = "C".$contacto->id_contacto; 
        $notificacion->not_indice = 'mensaje';
        $notificacion->not_visto = 0; 
        $not = $notificacion->save();
        

        if ($con && $not) {
            $success = true;
            $message = "El mensaje se a eviado con exito";
        }else{
            $success = false;
            $message = "Por favor vuelva a intentarlo mas tarde";
        }

        return response()->json([
            'success' => $success,
            'message' => $message,
        ]);
        
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
            $tbl_contacto = Contacto::orderBy('id_contacto', 'desc')->paginate(8);
        }
        else{
            $tbl_contacto = Contacto::orderBy('id_contacto', 'desc')
            ->where('tbl_contacto.'.$criterio, 'like', '%'. $buscar . '%')->paginate(8);
        }        

        return [
            'pagination' => [
                'total'        => $tbl_contacto->total(),
                'current_page' => $tbl_contacto->currentPage(),
                'per_page'     => $tbl_contacto->perPage(),
                'last_page'    => $tbl_contacto->lastPage(),
                'from'         => $tbl_contacto->firstItem(),
                'to'           => $tbl_contacto->lastItem(),
            ],
            'tbl_contacto' => $tbl_contacto
        ];
    }

    public function visto(Request $request)
    {
        if (!$request->ajax()) return redirect('/'); 
        $contacto = Contacto::findOrFail($request->id_contacto);
        $contacto->con_visto = '1';
        $contacto->save();
    }
}
