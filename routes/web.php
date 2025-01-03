<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('tablero');
})->middleware('auth');

Route::get('/', function () {
    return view('inicio');
})->middleware('guest');

Route::get('/contacto', function () {
    return view('contacto');
})->middleware('guest');

Route::get('/ingresar', 'Auth\LoginController@mostrarFormulario')->name('ingresar')->middleware('guest');


Route::post('/validar', 'Auth\LoginController@validarDatos')->name('validar')->middleware('guest');



//_________________________________________________________________________________________

Route::get('/tablero', function () {
    return view('tablero');
})->name('tablero')->middleware('auth');


    
Route::post('/logout', 'Auth\LoginController@logout')->name('logout')->middleware('auth');


Route::get('/dataListPrograma', 'ProgramaController@search')->middleware('auth');
Route::get('/programa', 'ProgramaController@index')->middleware('auth');
Route::post('/programa/registrar', 'ProgramaController@store')->middleware('auth');
Route::put('/programa/actualizar', 'ProgramaController@update')->middleware('auth');
Route::put('/programa/desactivar', 'ProgramaController@desactivar')->middleware('auth');
Route::put('/programa/activar', 'ProgramaController@activar')->middleware('auth');

Route::get('/ficha', 'FichaController@index')->middleware('auth');
Route::post('/ficha/registrar', 'FichaController@store')->middleware('auth');
Route::put('/ficha/actualizar', 'FichaController@update')->middleware('auth');
Route::get('/ficha/mostrarAprendices', 'FichaController@mostrarAprendices')->middleware('auth');
Route::get('/ficha/dataListFicha', 'FichaController@dataListFicha')->middleware('auth');
Route::put('/ficha/eliminar', 'FichaController@eliminar')->middleware('auth');

Route::get('/ambiente', 'AmbienteController@index')->middleware('auth');
Route::post('/ambiente/registrar', 'AmbienteController@agregar')->middleware('auth');
Route::put('/ambiente/actualizar', 'AmbienteController@update')->middleware('auth');
Route::put('/ambiente/desactivar', 'AmbienteController@desactivar')->middleware('auth');
Route::put('/ambiente/activar', 'AmbienteController@activar')->middleware('auth');
Route::get('/ambiente/dataListAmbiente', 'AmbienteController@dataListAmbiente')->middleware('auth');

Route::post('/mantenimiento/registrar', 'MantenimientoController@registrar')->middleware('auth');
Route::get('/ambientesInactivos', 'MantenimientoController@ambientesInactivos')->middleware('auth');
Route::put('/mantenimiento/editar', 'MantenimientoController@editar')->middleware('auth');
Route::get('/mantenimiento', 'MantenimientoController@index')->middleware('auth');

Route::get('/instructor', 'InstructorController@index')->middleware('auth');
Route::post('/instructor/registrar', 'InstructorController@store')->middleware('auth');
Route::put('/instructor/actualizar', 'InstructorController@update')->middleware('auth');
Route::put('/instructor/desactivar', 'InstructorController@desactivar')->middleware('auth');
Route::get('/instructor/dataListInstructor', 'InstructorController@dataListInstructor')->middleware('auth');

Route::get('/horario', 'HorarioController@index')->middleware('auth');
Route::get('/verHorario', 'HorarioController@verHorario')->middleware('auth');
Route::get('/horario/validarAmbiente', 'HorarioController@validarAmbiente')->middleware('auth');
Route::post('/horario/validarDisponibilidadAmb', 'HorarioController@validarDisponibilidadAmb')->middleware('auth');
Route::post('/horario/validarItem', 'HorarioController@validarItem')->middleware('auth');
Route::post('/horario/registrar', 'HorarioController@store')->middleware('auth');
Route::put('/horario/actualizar', 'HorarioController@update')->middleware('auth');
Route::put('/horario/desactivar', 'HorarioController@desactivar')->middleware('auth');
Route::put('/horario/activar', 'HorarioController@activar')->middleware('auth');
Route::delete('/horario/eliminar/', 'HorarioController@eliminar')->middleware('auth');
Route::delete('/horario/vaciar/', 'HorarioController@vaciar')->middleware('auth');

Route::get('/reporteAmbiente', 'FichaController@reporteAmbiente')->middleware('auth');

Route::get('/perfil', 'PersonaController@mostrarPerfil')->middleware('auth');
Route::put('/perfil/actualizar', 'PersonaController@update')->middleware('auth');
Route::post('/perfil/cambiarFoto', 'PersonaController@cambiarFoto')->middleware('auth');
Route::put('/perfil/cambiarClave', 'PersonaController@cambiarClave')->middleware('auth');

Route::get('/persona/misFichas', 'PersonaController@mostrarMisFichas')->middleware('auth');
Route::get('/persona/misAmbientes', 'PersonaController@mostrarMisAmbientes')->middleware('auth');
Route::get('/persona/miHorario', 'PersonaController@mostrarMiHorario')->middleware('auth');
Route::get('/persona/misInstrucores', 'PersonaController@mostrarMisInstructores')->middleware('auth');
Route::get('/ficha/verAprendices', 'FichaController@mostrarMisAprendices')->middleware('auth');

Route::get('/infraestructura', 'InfraestructuraController@index')->middleware('auth');
Route::post('/infraestructura/registrar', 'InfraestructuraController@store')->middleware('auth');
Route::put('/infraestructura/actualizar', 'InfraestructuraController@update')->middleware('auth');
Route::put('/infraestructura/desactivar', 'InfraestructuraController@desactivar')->middleware('auth');
Route::put('/infraestructura/activar', 'InfraestructuraController@activar')->middleware('auth');

Route::post('/contact', 'ContactoController@enviarMensaje')->name('contacta');
Route::get('/contacto/index', 'ContactoController@index')->middleware('auth');
Route::put('/contacto/visto', 'ContactoController@visto')->middleware('auth');

Route::get('/notificacion', 'NotificacionController@index')->middleware('auth');
Route::put('/notificacion/visto', 'NotificacionController@visto')->middleware('auth');
