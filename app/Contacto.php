<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contacto extends Model
{
    protected $table = 'tbl_contacto';
    protected $primaryKey = 'id_contacto';

    protected $fillable = [
        'id_contacto', 'con_nombre', 'con_correo', 'con_celular', 'con_asunto', 'con_mensaje'];

    public $timestamps = false;
}
