<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Programa extends Model
{
    protected $table = 'tbl_programa';
    protected $primaryKey = 'id_programa';

    protected $fillable = [
        'id_programa', 'pro_nombre', 'pro_tipo', 'pro_estado'
    ];

    public function ficha()
    {
        return $this->belongsTo('App\Ficha');
    }

}
