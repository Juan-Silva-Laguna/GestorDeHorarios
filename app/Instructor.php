<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Instructor extends Model
{
    protected $table = 'tbl_instructor';
    protected $primaryKey = 'id_instructor';

    protected $fillable = [
        'id_instructor', 'ins_profesion', 'ins_fechaInicio', 'ins_fechaFin', 'fk_id_persona', 'ins_tipo_contrato'
    ];
    public $timestamps = false;
}
