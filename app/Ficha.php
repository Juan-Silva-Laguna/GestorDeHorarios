<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ficha extends Model
{
    protected $table = 'tbl_ficha';
    protected $primaryKey = 'id_ficha';

    protected $fillable = [
        'id_ficha', 'fic_fecha_inicio', 'fic_fecha_fin','fic_hora_ini','fic_hora_fin','fic_ambiente', 'fk_id_programa', 'fic_color', 'fic_trimestre','fic_estado'
    ];

    public function aprendices()
    {
        return $this->hasMany('App\Aprendiz');
    }

    public function programa()
    {
        return $this->belongsTo('App\Programa');
    }

    public $timestamps = false;
}
