<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    protected $table = 'tbl_persona';
    protected $primaryKey = 'id_persona';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'per_tipo_identificacion', 'per_identificacion', 'per_contrasena', 'per_rol'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'per_contrasena', 'remember_token',
    ];

    public function getAuthPassword()
    {
        return $this->per_contrasena;
    }
}
