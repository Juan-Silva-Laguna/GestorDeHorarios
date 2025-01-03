<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Horario extends Model
{
    protected $table = 'tbl_horario';
    protected $primaryKey = 'id_horario';

    protected $fillable = [
        'id_horario', 'fic_fecha_inicio', 'fic_fecha:fin', 'fk_id_programa'
    ];

    public $timestamps = false;
}
