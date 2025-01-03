<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ambiente extends Model
{
    protected $table = 'tbl_ambiente';
    protected $primaryKey = 'id_ambiente';

    protected $fillable = [
        'id_ambiente', 'amb_nombre', 'amb_codigo_ambiente', 'amb_capacidad', 'amb_estado'
    ];
    public $timestamps = false;
}
