<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notificacion extends Model
{
    protected $table = 'tbl_notificacion';
    protected $primaryKey = 'not_clave';
    public $incrementing = false;

    protected $fillable = [
        'not_clave', 'not_texto', 'not_visto'];

    public $timestamps = false;
}
