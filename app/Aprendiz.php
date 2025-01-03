<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Aprendiz extends Model
{
    protected $table = 'tbl_aprendiz';
    protected $primaryKey = 'id_aprendiz';

    protected $fillable = [
        'id_aprendiz', 'fk_id_ficha', 'fk_id_persona'
    ];

    public function ficha()
    {
        return $this->belongsTo('App\Ficha');
    }

    public function persona()
    {
        return $this->belongsTo('App\Persona');
    }

    public $timestamps = false;
}
