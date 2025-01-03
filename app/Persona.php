<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    protected $table = 'tbl_persona';
    protected $primaryKey = 'id_persona';

    protected $fillable = [
        'id_persona', 'per_nombre', 'per_apellidos', 'per_tipo_identificacion', 'per_email', 'per_contrasena', 'per_direccion', 'per_foto', 'per_rol'
    ];

    public function aprendiz()
    {
        return $this->belongsTo('App\Aprendiz');
    }

    public $timestamps = false;
}
