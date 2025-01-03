<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Mantenimiento extends Model
{
    protected $table = 'tbl_mantenimiento';
    protected $primaryKey = 'id_mantenimiento';

    protected $fillable = [
        'id_mantenimiento', 'man_daños', 'man_reparacion', 'man_ides_amb', 'man_estado', 'fk_id_ambiente', 'fk_id_persona'
    ];
    

    public function ambiente()
    {
        return $this->belongsTo('App\Ambiente');
    }
}
