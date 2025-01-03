<template>
    <main class="main" v-bind:style="this.espacio">
        <div class="container-fluid_horario">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Horarios
                    <button type="button" @click="abrirModal()" class="btn btn-secondary">
                        <i class="icon-plus"></i>&nbsp;Nuevo
                    </button>
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-md-4">
                            <div class="input-group">
                                <input type="radio" @click="listarhorario(1,'fk_id_ficha',0,'','')" name="mostrar" checked>
                                Horarios Por Fichas
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <input type="radio"  @click="listarhorario(1,'fk_id_instructor',1,'','')" name="mostrar">
                                Horarios Por Instructores
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <input type="radio"  @click="listarhorario(1,'fk_id_ambiente',2,'','')" name="mostrar">
                                Horarios Por Ambientes
                            </div>
                        </div>
                    </div>
                    
                    <div class="table-responsive-sm" v-if="radio==0">    
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                        <option value="tbl_ficha.id_ficha">Código de Programa</option>
                                        <option value="tbl_programa.pro_nombre">Nombre del programa</option>
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarhorario(1,'fk_id_ficha',0,buscar,criterio)" class="form-control" placeholder="Ingrese dato a buscar">
                                    <button type="submit" @click="listarhorario(1,'fk_id_ficha',0,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div>                    
                        <table class="table table-bordered table-striped table-sm" >
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Ficha</th>
                                    <th>Programa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="horario in arrayhorario" :key="horario.id_horario">
                                    <td>
                                        <!--<button type="button" @click="abrirModal('horario', 'actualizar', horario)" class="btn btn-warning btn-sm">
                                            <i class="icon-pencil"></i>
                                        </button> &nbsp;-->
                                        <button type="button" @click="verHorario(horario.fk_id_ficha+' - '+horario.pro_nombre,'edit','fk_id_ficha', horario.fk_id_ficha)" class="btn btn-warning btn-sm">
                                            <i class="icon-pencil"></i>
                                        </button> &nbsp;     
                                        <button type="button" @click="verHorario(horario.fk_id_ficha+' - '+horario.pro_nombre,'','fk_id_ficha', horario.fk_id_ficha)" class="btn btn-info btn-sm">
                                            <i class="icon-eye"></i>
                                        </button> &nbsp;                                  
                                    </td>
                                    <td v-text="horario.fk_id_ficha"></td>
                                    <td v-text="horario.pro_nombre"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table-responsive-sm" v-if="radio==1">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                        <option value="tbl_persona.per_identificacion">Numero de Identidad</option>
                                        <option value="tbl_persona.per_nombre">Nombre</option>
                                        <option value="tbl_instructor.ins_profesion">Profesión</option>
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarhorario(1,'fk_id_instructor',1,buscar,criterio)" class="form-control" placeholder="Ingrese dato a buscar">
                                    <button type="submit" @click="listarhorario(1,'fk_id_instructor',1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div> 
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Numero Identidad</th>
                                    <th>Nombre</th>
                                    <th>Profesión</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="horario in arrayhorario" :key="horario.id_horario">
                                    <td>   
                                        <button type="button" @click="verHorario(horario.per_nombre+' '+horario.per_apellidos,'','fk_id_instructor', horario.fk_id_instructor)" class="btn btn-info btn-sm">
                                            <i class="icon-eye"></i>
                                        </button> &nbsp;                              
                                    </td>
                                    <td v-text="horario.per_identificacion"></td>
                                    <td v-text="horario.per_nombre+' '+horario.per_apellidos"></td>
                                    <td v-text="horario.ins_profesion"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="table-responsive-sm" v-if="radio==2">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                        <option value="tbl_ambiente.amb_codigo_ambiente">Codigo Ambiente</option>
                                        <option value="tbl_ambiente.amb_nombre">Nombre Ambiente</option>
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarhorario(1,'fk_id_ambiente',2,buscar,criterio)" class="form-control" placeholder="Ingrese dato a buscar">
                                    <button type="submit" @click="listarhorario(1,'fk_id_ambiente',2,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div> 
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Codigo Ambiente</th>
                                    <th>Nombre Ambiente</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="horario in arrayhorario" :key="horario.id_horario">
                                    <td>
                                        <!--<button type="button" @click="abrirModal('horario', 'actualizar', horario)" class="btn btn-warning btn-sm">
                                            <i class="icon-pencil"></i>
                                        </button> &nbsp;-->
                                        <button type="button" @click="verHorario(horario.amb_nombre,'','fk_id_ambiente', horario.fk_id_ambiente)" class="btn btn-info btn-sm">
                                            <i class="icon-eye"></i>
                                        </button> &nbsp;                                
                                    </td>
                                    <td v-text="horario.amb_codigo_ambiente"></td>
                                    <td v-text="horario.amb_nombre"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <nav>
                        <ul class="pagination">
                            <li class="page-item" v-if="pagination.current_page > 1">
                                <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page - 1,buscar,criterio)">Ant</a>
                            </li>
                            <li class="page-item" v-for="page in pagesNumber" :key="page" :class="[page == isActived ? 'active' : '']">
                                <a class="page-link" href="#" @click.prevent="cambiarPagina(page,buscar,criterio)" v-text="page"></a>
                            </li>
                            <li class="page-item" v-if="pagination.current_page < pagination.last_page">
                                <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page + 1,buscar,criterio)">Sig</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- Fin ejemplo de tabla Listado -->
        </div>
        <!--Inicio del modal agregar/actualizar-->
        <div  class="modal fade overflow-auto" tabindex="-1" :class="{'mostrar' : modal}" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-primary modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" v-text="tituloModal"></h4>
                        <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                            <span aaria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div id="formulario">
                            <div class="form-group row">
                                <b class="col-md-3 form-control-label" for="text-input">Ficha</b>
                                <div class="col-md-9">
                                    <input type="text" v-model="ficha" list="fichas" id="ficha" class="form-control" placeholder="--Busca y Selecciona--">
                                    <datalist id="fichas">
                                        <option v-for="ficha in arrayficha" :key="ficha.id_ficha" v-bind:value="ficha.id_ficha" v-bind:data-index-number="ficha.id_ficha"></option>
                                    </datalist>   
                                </div>
                            </div>
                            <hr>
                            <div class="form-group row">                                                
                                <div class="col-md-8 mx-auto">                                    
                                    <b>Instructor</b>
                                    <input type="text" list="instructores" id="instructor" class="form-control" placeholder="--Busca y Selecciona--">
                                    <datalist id="instructores">
                                        <option v-for="instructor in arrayinstructor" :key="instructor.id_instructor" v-bind:value="instructor.per_nombre" v-bind:data-index-number="instructor.id_instructor" v-bind:data-parent="instructor.ins_color" v-bind:data-value="instructor.ins_horas"  v-bind:data-name="instructor.ins_tipo_contrato"></option>
                                    </datalist>   
                                    <b>Ambiente</b>
                                    <input type="text" list="ambientes" id="ambiente" class="form-control" placeholder="--Busca y Selecciona--">
                                    <datalist id="ambientes">
                                        <option v-for="ambiente in arrayambiente" :key="ambiente.id_ambiente" v-bind:value="ambiente.amb_nombre" v-bind:data-index-number="ambiente.id_ambiente"></option>
                                    </datalist> 
                                    <b>Hora Inicio</b>
                                    <input type="text" list="horasini" id="horaIni" class="form-control" placeholder="--Busca y Selecciona--">
                                    <datalist id="horasini">
                                        <option value="06:00 AM" data-index-number="6"></option>
                                        <option value="07:00 AM" data-index-number="7"></option>
                                        <option value="08:00 AM" data-index-number="8"></option>
                                        <option value="09:00 AM" data-index-number="9"></option>
                                        <option value="10:00 AM" data-index-number="10"></option>
                                        <option value="11:00 AM" data-index-number="11"></option>
                                        <option value="12:00 PM" data-index-number="12"></option>
                                        <option value="01:00 PM" data-index-number="13"></option>
                                        <option value="02:00 PM" data-index-number="14"></option>
                                        <option value="03:00 PM" data-index-number="15"></option>
                                        <option value="04:00 PM" data-index-number="16"></option>
                                        <option value="05:00 PM" data-index-number="17"></option>
                                        <option value="06:00 PM" data-index-number="18"></option>
                                        <option value="07:00 PM" data-index-number="19"></option>
                                        <option value="08:00 PM" data-index-number="20"></option>
                                        <option value="09:00 PM" data-index-number="21"></option>
                                        <option value="10:00 PM" data-index-number="22"></option>
                                        <option value="11:00 PM" data-index-number="23"></option>
                                    </datalist> 
                                    <b>Hora Fin</b>
                                    <input type="text" list="horasfin" id="horaFin" class="form-control" placeholder="--Busca y Selecciona--">
                                    <datalist id="horasfin">                                        
                                        <option value="07:00 AM" data-index-number="7"></option>
                                        <option value="08:00 AM" data-index-number="8"></option>
                                        <option value="09:00 AM" data-index-number="9"></option>
                                        <option value="10:00 AM" data-index-number="10"></option>
                                        <option value="11:00 AM" data-index-number="11"></option>
                                        <option value="12:00 PM" data-index-number="12"></option>
                                        <option value="01:00 PM" data-index-number="13"></option>
                                        <option value="02:00 PM" data-index-number="14"></option>
                                        <option value="03:00 PM" data-index-number="15"></option>
                                        <option value="04:00 PM" data-index-number="16"></option>
                                        <option value="05:00 PM" data-index-number="17"></option>
                                        <option value="06:00 PM" data-index-number="18"></option>
                                        <option value="07:00 PM" data-index-number="19"></option>
                                        <option value="08:00 PM" data-index-number="20"></option>
                                        <option value="09:00 PM" data-index-number="21"></option>
                                        <option value="10:00 PM" data-index-number="22"></option>
                                        <option value="11:00 PM" data-index-number="23"></option>
                                        <option value="12:00 AM" data-index-number="24"></option>
                                    </datalist> 
                                    <b>Dia</b>
                                    <br>   
                                    <div id="checks">
                                        Lunes <input type="checkbox" value="1" v-model="dias" style="margin-right: 20px;">
                                        Martes <input type="checkbox" value="2" v-model="dias"  style="margin-right: 20px;">
                                        Miércoles  <input type="checkbox" value="3" v-model="dias"  style="margin-right: 20px;">
                                        Jueves <input type="checkbox" value="4" v-model="dias"  style="margin-right: 20px;">
                                        Viernes <input type="checkbox" value="5" v-model="dias"  style="margin-right: 20px;">
                                        Sábado  <input type="checkbox" value="6" v-model="dias">
                                    </div>
                                    <br>
                                    <div class="form-group row div-error">
                                        <div class="text-center text-error">
                                            <div v-for="error in errorMostrarMsjhorario" :key="error" v-text="error"></div>
                                        </div>
                                    </div>
                                    <br>
                                    <button class="form-control mx-auto btn btn-success" @click="validarDatos()"><i class="fa fa-plus"></i></button>
                                </div>
                            </div>
                        </div>
                        <div id="doc" class="table-responsive">
                            <table class="table table-bordered table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th style="width: 80">Hora</th>
                                        <th style="width: 80">Lunes</th>
                                        <th style="width: 80">Martes</th>
                                        <th style="width: 80">Miércoles </th>
                                        <th style="width: 80">Jueves</th>
                                        <th style="width: 80">Viernes</th>
                                        <th style="width: 80">Sábado </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr><!--Tocaria hacer un arreglo que capte por dia-->
                                        <td>06:00 AM - 07:00 AM</td>
                                        <td id="l6_7"></td>
                                        <td id="m6_7"></td>
                                        <td id="mi6_7"></td>
                                        <td id="j6_7"></td>
                                        <td id="v6_7"></td>
                                        <td id="s6_7"></td>
                                    </tr>
                                    <tr>
                                        <td>07:00 AM - 08:00 AM</td>
                                        <td id="l7_8"></td>
                                        <td id="m7_8"></td>
                                        <td id="mi7_8"></td>
                                        <td id="j7_8"></td>
                                        <td id="v7_8"></td>
                                        <td id="s7_8"></td>
                                    </tr>
                                    <tr>
                                        <td>08:00 AM - 09:00 AM</td>
                                        <td id="l8_9"></td>
                                        <td id="m8_9"></td>
                                        <td id="mi8_9"></td>
                                        <td id="j8_9"></td>
                                        <td id="v8_9"></td>
                                        <td id="s8_9"></td>
                                    </tr>
                                    <tr>
                                        <td>09:00 AM - 10:00 AM</td>
                                        <td id="l9_10"></td>
                                        <td id="m9_10"></td>
                                        <td id="mi9_10"></td>
                                        <td id="j9_10"></td>
                                        <td id="v9_10"></td>
                                        <td id="s9_10"></td>
                                    </tr>
                                    <tr>
                                        <td>10:00 AM - 11:00 AM</td>
                                        <td id="l10_11"></td>
                                        <td id="m10_11"></td>
                                        <td id="mi10_11"></td>
                                        <td id="j10_11"></td>
                                        <td id="v10_11"></td>
                                        <td id="s10_11"></td>
                                    </tr>
                                    <tr>
                                        <td>11:00 AM - 12:00 AM</td>
                                        <td id="l11_12"></td>
                                        <td id="m11_12"></td>
                                        <td id="mi11_12"></td>
                                        <td id="j11_12"></td>
                                        <td id="v11_12"></td>
                                        <td id="s11_12"></td>
                                    </tr>
                                    <tr>
                                        <td>12:00 AM - 01:00 PM</td>
                                        <td id="l12_13"></td>
                                        <td id="m12_13"></td>
                                        <td id="mi12_13"></td>
                                        <td id="j12_13"></td>
                                        <td id="v12_13"></td>
                                        <td id="s12_13"></td>
                                    </tr>
                                    <tr>
                                        <td>01:00 PM - 02:00 PM</td>
                                        <td id="l13_14"></td>
                                        <td id="m13_14"></td>
                                        <td id="mi13_14"></td>
                                        <td id="j13_14"></td>
                                        <td id="v13_14"></td>
                                        <td id="s13_14"></td>
                                    </tr>
                                    <tr>
                                        <td>02:00 PM - 03:00 PM</td>
                                        <td id="l14_15"></td>
                                        <td id="m14_15"></td>
                                        <td id="mi14_15"></td>
                                        <td id="j14_15"></td>
                                        <td id="v14_15"></td>
                                        <td id="s14_15"></td>
                                    </tr>
                                    <tr>
                                        <td>03:00 PM - 04:00 PM</td>
                                        <td id="l15_16"></td>
                                        <td id="m15_16"></td>
                                        <td id="mi15_16"></td>
                                        <td id="j15_16"></td>
                                        <td id="v15_16"></td>
                                        <td id="s15_16"></td>
                                    </tr>
                                    <tr>
                                        <td>04:00 PM - 05:00 PM</td>
                                        <td id="l16_17"></td>
                                        <td id="m16_17"></td>
                                        <td id="mi16_17"></td>
                                        <td id="j16_17"></td>
                                        <td id="v16_17"></td>
                                        <td id="s16_17"></td>
                                    </tr>
                                    <tr>
                                        <td>05:00 PM - 06:00 PM</td>
                                        <td id="l17_18"></td>
                                        <td id="m17_18"></td>
                                        <td id="mi17_18"></td>
                                        <td id="j17_18"></td>
                                        <td id="v17_18"></td>
                                        <td id="s17_18"></td>
                                    </tr>
                                    <tr>
                                        <td>06:00 PM - 07:00 PM</td>
                                        <td id="l18_19"></td>
                                        <td id="m18_19"></td>
                                        <td id="mi18_19"></td>
                                        <td id="j18_19"></td>
                                        <td id="v18_19"></td>
                                        <td id="s18_19"></td>
                                    </tr>
                                    <tr>
                                        <td>07:00 PM - 08:00 PM</td>
                                        <td id="l19_20"></td>
                                        <td id="m19_20"></td>
                                        <td id="mi19_20"></td>
                                        <td id="j19_20"></td>
                                        <td id="v19_20"></td>
                                        <td id="s19_20"></td>
                                    </tr>
                                    <tr>
                                        <td>08:00 PM - 09:00 PM</td>
                                        <td id="l20_21"></td>
                                        <td id="m20_21"></td>
                                        <td id="mi20_21"></td>
                                        <td id="j20_21"></td>
                                        <td id="v20_21"></td>
                                        <td id="s20_21"></td>
                                    </tr>
                                    <tr>
                                        <td>09:00 PM - 10:00 PM</td>
                                        <td id="l21_22"></td>
                                        <td id="m21_22"></td>
                                        <td id="mi21_22"></td>
                                        <td id="j21_22"></td>
                                        <td id="v21_22"></td>
                                        <td id="s21_22"></td>
                                    </tr>
                                    <tr>
                                        <td>10:00 PM - 11:00 PM</td>
                                        <td id="l22_23"></td>
                                        <td id="m22_23"></td>
                                        <td id="mi22_23"></td>
                                        <td id="j22_23"></td>
                                        <td id="v22_23"></td>
                                        <td id="s22_23"></td>
                                    </tr>
                                    <tr>
                                        <td>11:00 PM - 12:00 PM</td>
                                        <td id="l23_24"></td>
                                        <td id="m23_24"></td>
                                        <td id="mi23_24"></td>
                                        <td id="j23_24"></td>
                                        <td id="v23_24"></td>
                                        <td id="s23_24"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>                   
                    </div>
                    <div class="modal-footer">                        
                        <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                        <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarhorario('create')">Guardar</button>
                        <button type="button" v-if="btnVaciar==1" class="btn btn-danger" @click="vaciarhorario()">VACIAR HORARIO</button>
                        <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="registrarhorario('edit')">Actualizar</button>
                        <button type="button" v-if="tipoAccion==3" class="btn btn-primary" @click="exportar()">Exportar</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!--Fin del modal-->
    </main>
</template>

<script>
    export default {
        name: 'Horario',
        props: ['id','campo'],
        data (){
            return{
                id_horario : 0,
                id_persona : 0,
                radio : 0,
                ficha : '',
                dias: [],
                arrayficha: [],
                arrayinstructor: [],
                arrayambiente: [],
                mostrarFechaFin : 0,
                arrayhorario : [],
                arraytodo : [],
                arraytodoedit : [],
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorhorario : 0,
                errorMostrarMsjhorario : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : '',
                buscar : '',
                c: 0,
                clave: '',
                valor: '',
                arregloHorIns: [],
                btnVaciar: 0,
                espacio: ''
            }
        },
        computed:{
            isActived: function(){
                return this.pagination.current_page;
            },
            //Calcula los elementos de la paginación
            pagesNumber: function() {
                if(!this.pagination.to) {
                    return [];
                }
                
                var from = this.pagination.current_page - this.offset; 
                if(from < 1) {
                    from = 1;
                }

                var to = from + (this.offset * 2); 
                if(to >= this.pagination.last_page){
                    to = this.pagination.last_page;
                }  

                var pagesArray = [];
                while(from <= to) {
                    pagesArray.push(from);
                    from++;
                }
                return pagesArray;     
            }
        },
        methods : {
            vaciarhorario(){  
                swal({
                title: 'Esta seguro de vaciar este horario?',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar!',
                cancelButtonText: 'Cancelar',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
                }).then((result) => {
                if (result.value) {
                    let me=this;
                    axios.delete('/horario/vaciar', {params: {'clave': this.clave, 'valor': this.valor}}).then(function (response) {
                        console.log(response);
                        if(response.statusText=="OK"){
                            swal("Se vacio el horario con exito!", "", "success"); 
                        }else{
                            swal("Fallo al Eliminar", "", "error");
                        }
                        me.cerrarModal();
                        me.listarhorario(1,this.clave,0,'','');
                    })
                    .catch(function (error) {
                        console.log(error);
                    });  
                }
                else if (result.dismiss === swal.DismissReason.cancel) {}
            })    
                
            },
            dataListFicha(){     
                let me=this;
                var url= '/ficha/dataListFicha';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;   
                    me.arrayficha = respuesta.tbl_ficha;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            dataListInstructor(){     
                let me=this;
                var url= '/instructor/dataListInstructor';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;                
                    me.arrayinstructor = respuesta.tbl_instructor;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            dataListAmbiente(){     
                let me=this;
                var url= '/ambiente/dataListAmbiente';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;          
                    me.arrayambiente = respuesta.tbl_ambiente;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            listarhorario(page,opcion, radio,buscar, criterio){
                let me=this;
                me.radio = radio;
                me.arrayhorario = [];
                var url= '/horario?page=' + page + '&opcion='+ opcion+ '&buscar='+ buscar+ '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayhorario = respuesta.tbl_horario.data;
                    me.pagination= respuesta.pagination;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            cambiarPagina(page,buscar,criterio){
                let me = this;
                //Actualiza la página actual
                me.pagination.current_page = page;
                //Envia la petición para visualizar la data de esa página
                me.listarhorario(page,buscar,criterio);
            },
            validarDatos(){
                if (this.validate_horario()) {
                    return;
                }
                let nombreAmb = $('#ambiente').val();
                let nombreIns = $('#instructor').val();
                let ambiente = $('#ambientes [value="' + $('#ambiente').val() + '"]').data('indexNumber');
                let instructor = $('#instructores [value="' + $('#instructor').val() + '"]').data('indexNumber');
                let horaIni = $('#horasini [value="' + $('#horaIni').val() + '"]').data('indexNumber');
                let horaFin = $('#horasfin [value="' + $('#horaFin').val() + '"]').data('indexNumber');
                let color = $('#instructores [value="' + $('#instructor').val() + '"]').data('parent');
                let contrato = $('#instructores [value="' + $('#instructor').val() + '"]').data('name');
                let horas = $('#instructores [value="' + $('#instructor').val() + '"]').data('value');
                let union='';
                this.dias.forEach(dia => {union += dia+"-";});
                let me=this;
                var arrDia = union.split('-');
                arrDia.splice(arrDia.length-1, 1);
                me.errorMostrarMsjhorario = [];

                var x = me.arregloHorIns.indexOf('i'+instructor);
                if (x == -1) {
                    me.arregloHorIns.push('i'+instructor,horas+((Number(horaFin)-Number(horaIni))*(arrDia.length)));
                }else{
                    var l = me.arregloHorIns[x+1];
                    me.arregloHorIns.splice(x, 2);
                    me.arregloHorIns.push('i'+instructor,l+((Number(horaFin)-Number(horaIni))*(arrDia.length)));
                }

                for (let i = 0; i < arrDia.length; i++) {                    
                    me.arraytodo.forEach(a => {
                        if (a.dia == arrDia[i]) {
                            if (((Number(horaIni) <= Number(a.horaIni) && Number(horaFin) >= Number(a.horaFin)) || (Number(horaIni) >= Number(a.horaIni) && Number(horaFin) <= Number(a.horaFin)) || (Number(horaIni) >= Number(a.horaIni) && Number(horaFin) >= Number(a.horaFin) && Number(horaIni)< Number(a.horaFin)) || (Number(horaIni) <= Number(a.horaIni) && Number(horaFin) <= Number(a.horaFin) && Number(horaFin) > Number(a.horaIni)))) {
                                var p = arrDia.indexOf( a.dia );
                                arrDia.splice( p, 1 );
                                me.errorMostrarMsjhorario.push('El dia '+dias(a.dia)+' lo ocupaste de las '+hor(a.horaIni)+' a las '+hor(a.horaFin));
                                var x = me.arregloHorIns.indexOf('i'+instructor);
                                var l = me.arregloHorIns[x+1];
                                me.arregloHorIns.splice(x, 2);
                                me.arregloHorIns.push('i'+instructor,l-(Number(horaFin)-Number(horaIni)));
                            }  
                        }
                    });
                }
                if (me.arraytodo.length>0) {
                    union='';
                    if (arrDia.length>0) {
                        for (let i = 0; i < arrDia.length; i++) {
                            union += arrDia[i]+"-";
                        }
                    }              
                }
                if (contrato == 'Indefinido') {
                    var y = me.arregloHorIns.indexOf('i'+instructor);
                    if (y != -1) {
                        var j = me.arregloHorIns[y+1];
                        if (j > 36) {
                            me.errorMostrarMsjhorario.push('El instructor '+nombreIns+' excede '+(j-36)+' horas segun su contrato '+contrato);
                            var x = me.arregloHorIns.indexOf('i'+instructor);
                            var l = me.arregloHorIns[x+1];
                            me.arregloHorIns.splice(x, 2);
                            me.arregloHorIns.push('i'+instructor,l-(Number(horaFin)-Number(horaIni)));
                        }
                        else{
                            pasar();
                        }
                    }
                }else{
                    var y = me.arregloHorIns.indexOf('i'+instructor);
                    if (y != -1) {
                        var j = me.arregloHorIns[y+1];
                        if (j > 32) {
                            me.errorMostrarMsjhorario.push('El instructor '+nombreIns+' excede '+(j-32)+' horas segun su contrato '+contrato);
                            var x = me.arregloHorIns.indexOf('i'+instructor);
                            var l = me.arregloHorIns[x+1];
                            me.arregloHorIns.splice(x, 2);
                            me.arregloHorIns.push('i'+instructor,l-(Number(horaFin)-Number(horaIni)));
                        }
                        else{
                            pasar();
                        }
                    }
                }

                function pasar() {
                        //var url= '/horario/validarItem?dias='+union+'&ambiente='+ambiente+'&instructor='+ instructor+ '&horaIni='+ horaIni +'&horaFin='+ horaFin+'&color='+color+'&nombreIns='+nombreIns+'&nombreAmb='+nombreAmb;
                    axios.post('/horario/validarItem',{
                        'dias': union,
                        'ambiente':ambiente,
                        'instructor': instructor,
                        'horaIni': horaIni,
                        'horaFin': horaFin,
                        'color': color,
                        'nombreIns':nombreIns,
                        'nombreAmb':nombreAmb
                    })
                    .then(function (response) {
                        $('#ficha').attr('disabled', 'true');
                        me.dias = [];
                        $('#ambiente').val('');
                        $('#instructor').val('');
                        $('#ambiente').val('');
                        $('#ambientes').attr('index-number', '');
                        $('#instructor').val('');
                        $('#instructores').attr('index-number', '');
                        $('#horaIni').val('');
                        $('#horasIni').attr('index-number', '');
                        $('#horaFin').val('');
                        $('#horasFin').attr('index-number', '');
                        $('#instructores').attr('parent', '');
                        $('#instructores').attr('index-number', '');
                        $('#instructores').attr('value', '');
                        var respuesta= response.data;                    
                        if (respuesta[0].length>0) {
                            let arreglo = [];
                            respuesta[0].forEach(element => {
                                me.arraytodo.push(element);
                                me.arraytodoedit.push(element);
                            });
                            me.arraytodo.forEach(a => {
                                let d = '';
                                switch (a.dia) {
                                    case '1':
                                        d = 'l';
                                        break;
                                    case '2':
                                        d = 'm';
                                        break;
                                    case '3':
                                        d = 'mi';
                                        break;
                                    case '4':
                                        d = 'j';
                                        break;
                                    case '5':
                                        d = 'v';
                                        break;
                                    case '6':
                                        d = 's';
                                        break;
                                }
                                for (let i = 6; i < 24; i++) {                                    
                                    if (i >= Number(a.horaIni) && i < Number(a.horaFin)) {
                                        if (i==Number(a.horaIni)) {
                                            $('#'+d+i+'_'+(i+1)).css('background-color','#'+a.color);
                                            $('#'+d+i+'_'+(i+1)).html(
                                                `<div style="float: right; width:30%">
                                                    <button type="button" class="quitar btn btn-danger btn-sm" data-value="${d+"-"+a.horaIni+"-"+a.horaFin}" data-number="${a.instructor}" value="${me.c++}"><i class="icon-trash"></i></button>
                                                </div>
                                                Instructor: ${a.nombreIns} <br> 
                                                Ambiente: ${a.nombreAmb} 
                                            `); 
                                            arreglo.push(me.c-1);
                                        }
                                        else{
                                            $('#'+d+i+'_'+(i+1)).css('background-color','#'+a.color);
                                            $('#'+d+i+'_'+(i+1)).html(`Instructor: ${a.nombreIns} <br> Ambiente: ${a.nombreAmb}`);
                                        }
                                        
                                    }      
                                }
                            }); 

                            $('.quitar').on('click', function (event) {
                                let x =  arreglo.indexOf(Number(this.value));
                                let variables = this.dataset.value;
                                let ins = this.dataset.number;
                                
                                arreglo.splice(x,1);                             
                                var arrVar = variables.split("-");
                                quita(x,ins,arrVar[1],arrVar[2]);
                                for (let i = Nuber(arrVar[1]); i < Number(arrVar[2]); i++) {
                                    $('#'+arrVar[0]+i+'_'+(i+1)).css('background-color','');
                                    $('#'+arrVar[0]+i+'_'+(i+1)).html('');
                                }
                
                            });
                            
                            function quita(x,ins,ini,fin) {
                                me.arraytodo.splice(x,1);

                                var y = me.arregloHorIns.indexOf('i'+ins);
                                var l = me.arregloHorIns[y+1];
                                me.arregloHorIns.splice(y, 2);
                                me.arregloHorIns.push('i'+ins,l-(Number(fin)-Number(ini)));
                            }
                        }
                        //errores             
                        if (respuesta[1].length>0) {
                            respuesta[1].forEach(element => {
                                me.errorMostrarMsjhorario.push(element);
                                var x = me.arregloHorIns.indexOf('i'+instructor);
                                var l = me.arregloHorIns[x+1];
                                me.arregloHorIns.splice(x, 2);
                                me.arregloHorIns.push('i'+instructor,l-(Number(horaFin)-Number(horaIni)));
                            });
                        }             
                    })
                    .catch(function (error) {
                        console.log(error);
                    });           
                }

                function dias(dia){
                    switch (dia) {
                        case '1':
                            return "Lunes";
                            break;
                        case '2':
                            return "Martes";
                            break;
                        case '3':
                            return "Miercoles";
                            break;
                        case '4':
                            return "Jueves";
                            break;
                        case '5':
                            return "Viernes";
                            break;
                        case '6':
                            return "Sabado";
                            break;
                    }
                }

                function hor(hora){
                    switch (hora) {
                        case 6:
                            return "06:00 A.M";
                            break;
                        case 7:
                            return "07:00 A.M";
                            break;
                        case 8:
                            return "08:00 A.M";
                            break;
                        case 9:
                            return "09:00 A.M";
                            break;
                        case 10:
                            return "10:00 A.M";
                            break;
                        case 11:
                            return "11:00 A.M";
                            break;
                        case 12:
                            return "12:00 P.M";
                            break;
                        case 13:
                            return "01:00 P.M";
                            break;
                        case 14:
                            return "02:00 P.M";
                            break;
                        case 15:
                            return "03:00 P.M";
                            break;
                        case 16:
                            return "04:00 P.M";
                            break;
                        case 17:
                            return "05:00 P.M";
                            break;
                        case 18:
                            return "06:00 P.M";
                            break;
                        case 19:
                            return "07:00 P.M";
                            break;
                        case 20:
                            return "08:00 P.M";
                            break;
                        case 21:
                            return "09:00 P.M";
                            break;
                        case 22:
                            return "10:00 P.M";
                            break;
                        case 23:
                            return "11:00 P.M";
                            break;
                        case 24:
                            return "12:00 A.M";
                            break;
                    }
                }
            },
            verHorario(titulo,tipo,clave, valor){
                let me = this;
                me.clave = clave;
                me.valor = valor;
                me.ficha = valor;
                me.tituloModal = titulo;
                if (tipo == '') {
                    me.tipoAccion = 3;
                    $('#formulario').css('display','none');
                }else{
                    me.tipoAccion = 2;                    
                    $('#formulario').css('display','block');
                    $('#ficha').attr('disabled', 'true');
                }
                me.btnVaciar = 1;
                var url= '/verHorario?clave='+clave+'&valor='+valor;
                axios.get(url).then(function (response) {
                    me.arraytodo=[];
                    var respuesta= response.data;
                    me.arraytodo = respuesta.tbl_horario;
                    me.modal = 1;
                    me.arraytodo.forEach(a => {
                        let d = '';
                        switch (a.hor_dia) {
                            case 1:
                                d = 'l';
                                break;
                            case 2:
                                d = 'm';
                                break;
                            case 3:
                                d = 'mi';
                                break;
                            case 4:
                                d = 'j';
                                break;
                            case 5:
                                d = 'v';
                                break;
                            case 6:
                                d = 's';
                                break;
                        }
                        for (let i = 6; i < 24; i++) {
                            if (i >= Number(a.hor_hora_inicio) && i < Number(a.hor_hora_fin)) {
                                if (i==Number(a.hor_hora_inicio)) {
                                    $('#'+d+i+'_'+(i+1)).css('background-color','#'+a.color);
                                    $('#'+d+i+'_'+(i+1)).html(
                                        `<div style="float: right; width:30%">
                                            <button type="button" class="eliminar btn btn-danger btn-sm" data-value="${a.id_horario}" value="${a.id_horario}"><i class="icon-trash"></i></button>
                                        </div>
                                        ${clave=='fk_id_ficha'? 'Instructor: '+a.nombre1+'<br> Ambiente: '+a.nombre2:(clave=='fk_id_instructor'?'Ficha: '+a.nombre1+'<br> Ambiente: '+a.nombre2:'Instructor: '+a.nombre1+'<br> Ficha: '+a.nombre2)} 
                                        
                                    `); 
                                }
                                else{
                                    $('#'+d+i+'_'+(i+1)).css('background-color','#'+a.color);
                                    $('#'+d+i+'_'+(i+1)).html(` ${clave=='fk_id_ficha'? 'Instructor: '+a.nombre1+'<br> Ambiente: '+a.nombre2:(clave=='fk_id_instructor'?'Ficha: '+a.nombre1+'<br> Ambiente: '+a.nombre2:'Instructor: '+a.nombre1+'<br> Ficha: '+a.nombre2)}`);
                                }
                            }
                        }
                    }); 
                    $('.eliminar').on('click', function (event) {
                        axios.delete('/horario/eliminar', {params: {'id_hor': this.value}}).then(function (response) {
                            console.log(response);
                            if(response.statusText=="OK"){
                                swal("Eliminación Exitosa!", "", "success");                                                           
                                for (let j = 1; j <= 6; j++) {
                                    let d = '';     
                                    switch (j) {
                                        case 1:
                                            d = 'l';
                                            break;
                                        case 2:
                                            d = 'm';
                                            break;
                                        case 3:
                                            d = 'mi';
                                            break;
                                        case 4:
                                            d = 'j';
                                            break;
                                        case 5:
                                            d = 'v';
                                            break;
                                        case 6:
                                            d = 's';
                                            break;
                                    }
                                    for (let i = 6; i < 24; i++) {
                                        $('#'+d+i+'_'+(i+1)).css('background-color','');
                                        $('#'+d+i+'_'+(i+1)).html('');
                                    }
                                }
                                
                                me.verHorario(me.titulo,'',me.clave, me.valor);
                            }else{
                                swal("Fallo al Eliminar", "", "error");
                            }
                            
                        })
                        .catch(function (error) {
                            console.log(error);
                        });              
                    });
                })
                .catch(function (error) {
                    console.log(error);
                });
                
                
            },
            exportar (){
                window.print();
            },
            registrarhorario (tipo){
                let me=this;
                axios.post('/horario/registrar', {
                    'ficha': me.ficha,
                    'todo': tipo=='create'?me.arraytodo:me.arraytodoedit
                }).then(function (response) {
                    if(response.statusText=="OK"){
                        swal("Muy Bien!", "Has registrado el horario con exito!!", "success");
                    }else{
                        swal("Que mal!", "Hubo un erro al registrar el horario", "error");
                    }
                    me.cerrarModal();
                    me.listarhorario(1,'fk_id_ficha',0,'','');
                    me.arraytodo = [];
                    me.arraytodoedit = [];
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            validate_horario (){
                this.errorhorario = 0;
                this.errorMostrarMsjhorario = [];

                if (!this.ficha) this.errorMostrarMsjhorario.push('La ficha es obligatoria');
                if ($('#ambiente').val()=='') this.errorMostrarMsjhorario.push('Busque y seleccione el ambiente');
                if ($('#instructor').val()=='') this.errorMostrarMsjhorario.push('Busque y seleccione el instructor');
                if ($('#horaIni').val()=='') this.errorMostrarMsjhorario.push('Busque y seleccione la hora inicial');
                if ($('#horaFin').val()=='') this.errorMostrarMsjhorario.push('Busque y seleccione la hora final');
                if (this.dias.length == 0) this.errorMostrarMsjhorario.push('Seleccione alguno de los dias');
                if (this.errorMostrarMsjhorario.length) this.errorhorario = 1;
                return this.errorhorario;
            },
            abrirModal(){
                this.modal = 1;
                this.tituloModal = 'Registrar horario';
                this.tipoAccion = 1;                              
            },
            cerrarModal (){
                $('#formulario').css('display','block');
                this.arraytodo=[];
                this.arraytodoedit=[];
                this.arregloHorIns=[];
                this.tipoAccion = 3;
                this.btnVaciar = 0;
                let arrDay = ['l','m','mi','j','v','s'];
                for (let i = 0; i < arrDay.length; i++) {
                    for (let j = 6; j < 24; j++) {
                        $('#'+arrDay[i]+j+'_'+(j+1)).css('background-color',''); 
                        $('#'+arrDay[i]+j+'_'+(j+1)).html(''); 
                    }
                }
                this.modal=0;
                this.tituloModal = '';
                this.tipoAccion = 0;
                this.ficha = '';
                $('#ficha').removeAttr("disabled");
                
            }
        },
        mounted() {
            if (this.id == undefined) {
                this.listarhorario(1,'fk_id_ficha',0,'','');
            }
            else{
                this.espacio = 'margin-left: 0px';
                this.listarhorario(1,'fk_id_ficha',0,this.id,this.campo);                
            }
            this.dataListFicha();
            this.dataListAmbiente();
            this.dataListInstructor();
        }
    }
    
</script>
<style>
    .modal-content{
        width: 100% !important;
        position: absolute !important;
    }
    .mostrar{
     display: list-item !important;
     opacity: 1 !important;
     position: absolute !important;
     background-color: #3c29297a !important;
    }
    .div-error{
        display: flex;
        justify-content: center;
    }
    .text-error{
        color: red !important;
        font-weight: bold;
    }

    table{
        table-layout: fixed;
        width: 250px;
    }

    th, td {
        border: 1px solid blue;
        width: 100px;
        word-wrap: break-word;
    }
</style>
