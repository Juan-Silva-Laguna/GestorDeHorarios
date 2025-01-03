<template>
    <main class="main" v-bind:style="this.espacio">
        <div class="container-fluid_ambiente">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Ambientes
                    <button type="button" @click="abrirModal('ambiente', 'registrar')" class="btn btn-secondary">
                        <i class="icon-plus"></i>&nbsp;Nuevo
                    </button>
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <select class="form-control col-md-3" v-model="criterio">
                                    <option value="amb_codigo_ambiente">Código de ambiente</option>
                                    <option value="amb_nombre">Nombre de ambiente</option>
                                </select>
                                <input type="text" v-model="buscar" @keyup.enter="listarAmbiente(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                <button type="submit" @click="listarAmbiente(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Código de Ambiente</th>
                                    <th>Nombre de ambiente</th>
                                    <th>Capacidad</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="ambiente in arrayAmbiente" :key="ambiente.id_ambiente">
                                    <td>
                                        <button type="button" @click="abrirModal('ambiente', 'actualizar', ambiente)" class="btn btn-warning btn-sm">
                                            <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                        <template v-if="ambiente.amb_estado">
                                            <button type="button" class="btn btn-danger btn-sm" @click="abrirModal('ambiente', 'desactivar', ambiente)">
                                                <i class="fa fa-toggle-off"></i>
                                            </button>
                                        </template>                                 
                                    </td>
                                    <td v-text="ambiente.amb_codigo_ambiente"></td>
                                    <td v-text="ambiente.amb_nombre"></td>
                                    <td v-text="ambiente.amb_capacidad"></td>
                                    <td>
                                        <div v-if="ambiente.amb_estado">
                                            <span class="badge badge-success">Activo</span>
                                        </div>
                                        <div v-else>
                                            <span class="badge badge-danger">Inactivo</span>
                                        </div>
                                    </td>
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
        <div class="modal fade" tabindex="-1" :class="{'mostrar' : modal}" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-primary modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" v-text="tituloModal"></h4>
                        <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                            <span aaria-hidden="true">×</span>
                        </button>
                    </div>  
                    <input type="hidden" id="var"> 
                    <div class="modal-body" v-if="tipoAccion==3">
                        <div class="text-center">
                            <h5>El Ambiente se encuentra ocupado con las siguites fichas:</h5>                            
                           <button type="button" class="btn btn-secondary" style="margin-left:20px" v-for="(amb, index) in validacionAmb" :key="amb.fk_id_ficha" v-text="amb.fk_id_ficha" v-bind:id="index" @click="mostrarOpciones(amb.fk_id_ficha,index)"></button>
                           <div class="text-justify" v-if="mostrarOpc==0">
                               <p>Da cick a cada una de las fichas para reasignar un ambiente temporalmente, el ambiente a el cual reasignes cada ficha
                                debe estar libre en el horario que se le fue asignado a la ficha, en caso de que no encuentres un ambiente disponible 
                                tendra la posibilidad de suspender la ficha o de ir a la seccion de horarios editar el horario y regresar a inactivar el ambiente.
                                </p>
                           </div>
                           <div class="text-center" v-if="mostrarOpc==1">
                               <br>
                                <div class="form-group row">
                                    <label class="col-md-4 form-control-label" for="input">Ambiente Para Reasiganar Temporalmente</label><br>
                                    <div class="col-md-8">
                                        <input type="text" list="ambientes" id="ambiente" class="form-control" placeholder="--Busca y Selecciona Ambiente Temporal --">
                                        <datalist id="ambientes">
                                            <option v-for="ambiente in arraydatalist" :key="ambiente.id_ambiente" v-bind:value="ambiente.amb_nombre" v-bind:data-index-number="ambiente.id_ambiente"></option>
                                        </datalist>                                   
                                    </div>
                                    <br><br>
                                    <div class="col-md-12">
                                        <button type="button" class="btn btn-success" id="reasignar" @click="validarDisponibilidad()">Reasignar</button>  
                                    </div>
                                </div>
                           </div>
                           <div class="text-center row" v-if="mostrarOpc==2">
                               <br><br>
                               <label class="col-md-4 form-control-label" for="input">Que inconveniente tiene el ambiente?</label>
                                <div class="col-md-8">
                                    <textarea class="form-control" v-model="problema" placeholder=" Describa el daño que presenta el ambiente... "></textarea>                                 
                                </div>
                                <div class="col-md-12">
                                    <br>
                                    <button type="button" class="btn btn-primary" id="reasignar" @click="finalizar()">Deshabilitar Ambiente</button> 
                                </div>
                           </div>
                        </div>                       
                    </div>     
                    <div class="modal-body" v-if="tipoAccion==4">
                        <div class="text-center">                          
                           <div class="text-center row">
                               <br><br>
                               <label class="col-md-4 form-control-label" for="input">Que inconveniente tiene el ambiente?</label>
                                <div class="col-md-8">
                                    <textarea class="form-control" v-model="problema" placeholder=" Describa el daño que presenta el ambiente... "></textarea>                                 
                                </div>
                                <div class="col-md-12">
                                    <br>
                                    <button type="button" class="btn btn-primary" id="reasignar" @click="finalizar()">Deshabilitar Ambiente</button> 
                                </div>
                           </div>
                        </div>                       
                    </div>                 
                    <div class="modal-body" v-if="tipoAccion==1 || tipoAccion==2">
                        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Código de ambiente</label>
                                <div class="col-md-9">
                                    <input type="text" v-model="codigo" :disabled="tipoAccion==2" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Nombre del ambiente</label>
                                <div class="col-md-9">
                                    <input type="text" v-model="nombre" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Capacidad del ambiente</label>
                                <div class="col-md-9">
                                    <input type="number" v-model="capacidad" class="form-control">
                                </div>
                            </div>
                            <div v-show="errorAmbiente" class="form-group row div-error">
                                <div class="text-center text-error">
                                    <div v-for="error in errorMostrarMsjAmbiente" :key="error" v-text="error"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                        <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarAmbiente()">Guardar</button>
                        <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarAmbiente()">Actualizar</button>
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
        name: 'Ambiente',
        props: ['id'],
        data (){
            return{
                id_ambiente : 0,
                nombre : '',
                codigo : '',
                capacidad : '',
                arrayAmbiente : [],
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorAmbiente : 0,
                errorMostrarMsjAmbiente : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'amb_codigo_ambiente',
                buscar : '',
                espacio: '',
                validacionAmb: [],
                validacionCambio: [],
                mostrarOpc:0,
                arraydatalist:[],
                ficha:0,
                problema:'',
                arrFichAmb:[]
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
            listarAmbiente (page,buscar,criterio){
                let me=this;
                var url= '/ambiente?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayAmbiente = respuesta.tbl_ambiente.data;
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
                me.listarAmbiente(page,buscar,criterio);
            },
            registrarAmbiente (){
                if (this.validate_ambiente()) {
                    return;
                }

                let me=this;
                axios.post('/ambiente/registrar', {
                    'nombre': this.nombre,
                    'codigo': this.codigo,
                    'capacidad': this.capacidad
                }).then(function (response) {
                    if(response.statusText=="OK"){
                        swal("Muy Bien!", "Has registrado el ambiente con exito!!", "success");
                    }else{
                        swal("Que mal!", "Hubo un erro al registrar el ambiente", "error");
                    }
                    me.cerrarModal();
                    me.listarAmbiente(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            dataListAmbiente(){     
                let me=this;
                var url= '/ambiente/dataListAmbiente';
                axios.get(url).then(function (response) {
                    console.log(response);
                    var respuesta= response.data;          
                    me.arraydatalist = respuesta.tbl_ambiente;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            mostrarOpciones (ficha, id){
                this.ficha=ficha;
                $('#ambiente').val('');
                $('#'+id).attr('class','btn btn-warning');
                this.mostrarOpc=1;
                $('#var').val(id);
            },
            validarDisponibilidad(){
                let me  = this;
                axios.post('/horario/validarDisponibilidadAmb',{
                    'ficha': me.ficha,
                    'ambienteAntiguo':me.id_ambiente,
                    'ambienteNuevo': $('#ambientes [value="' + $('#ambiente').val() + '"]').data('indexNumber')
                })
                .then(function (response) {
                    if(response.data[0]==1){
                        swal("Correcto!", "Si se logro reasignar la ficha a el ambiente "+$('#ambiente').val()+" temporalmente", "success");
                        let i = $('#var').val();
                        $('#'+i).attr('class','btn btn-success');
                        $('#'+i).attr('disabled','true');
                        
                        response.data[1].forEach(data => {
                            me.arrFichAmb.push([$('#ambientes [value="' + $('#ambiente').val() + '"]').data('indexNumber'), data.id_horario]);
                        });
                    }else{
                        swal("Que mal!", "Lastimosamente el ambiente "+$('#ambiente').val()+" se encuentra ocupado en el horario de la ficha", "error");
                    }
                    let cont = 0;
                    me.validacionAmb.forEach((val, i) => {
                        if ($('#'+i).attr('class')=="btn btn-success") {
                            cont++;
                        }
                    }); 
                    if (cont == me.validacionAmb.length) {
                        me.mostrarOpc = 2;
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });   
            },
            finalizar(){
                let me  = this;
                console.log(me.problema);
                axios.post('/mantenimiento/registrar',{
                    'id_ambiente': me.id_ambiente,
                    'fich_amb': me.arrFichAmb,
                    'problema':me.problema
                })
                .then(function (response) {
                    me.cerrarModal();
                    me.listarAmbiente(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            validate_ambiente (){
                this.errorAmbiente = 0;
                this.errorMostrarMsjAmbiente = [];

                if (!this.nombre) this.errorMostrarMsjAmbiente.push('El nombre del ambiente no puede estar vacio');
                if (!this.codigo) this.errorMostrarMsjAmbiente.push('El codigo del ambiente no puede estar vacio');
                if (!this.capacidad) this.errorMostrarMsjAmbiente.push('La capacidad del ambiente no puede estar vacio');
                if (this.errorMostrarMsjAmbiente.length) this.errorAmbiente = 1;

                return this.errorAmbiente;
            },
            desactivarAmbiente (id){

                this.tipoAccion=3;



                /*
                swal({
                    title: 'Esta seguro de desactivar este ambiente?',
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
                        let me = this;

                        axios.put('/ambiente/desactivar',{
                            'id_ambiente': id
                        }).then(function (response) {

                            me.listarAmbiente(1,'','nombre');
                            swal(
                            'Desactivado!',
                            'El registro ha sid_ambienteo desactivado con éxito.',
                            'success'
                            )
                        }).catch(function (error) {
                            console.log(error);
                        });
                    } else if (
                        // Read more about handling dismissals
                        result.dismiss === swal.DismissReason.cancel
                    ) {
                    }
                }) */
            },
            actualizarAmbiente (){
                if (this.validate_ambiente()) {
                    return;
                }

                let me=this;
                console.log(this.id_ambiente);
                axios.put('/ambiente/actualizar', {
                    'nombre': this.nombre,
                    'codigo': this.codigo,
                    'capacidad': this.capacidad,
                    'id_ambiente' : this.id_ambiente
                }).then(function (response) { 
                    if(response.statusText=="OK"){
                        swal("Muy Bien!", "Has actualizado el ambiente con exito!!", "success");
                    }else{
                        swal("Que mal!", "Hubo un erro al actualizar el ambiente", "error");
                    }
                    me.cerrarModal();
                    me.listarAmbiente(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            abrirModal(modelo, accion, data = []){
                switch (modelo) {
                    case 'ambiente':
                    {
                        switch (accion) {
                            case 'registrar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Registar ambiente';
                                this.nombre = '';
                                this.codigo = '';
                                this.capacidad = '';
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Actualizar ambiente';
                                this.id_ambiente = data.id_ambiente;
                                this.nombre = data.amb_nombre;
                                this.codigo = data.amb_codigo_ambiente;
                                this.capacidad = data.amb_capacidad;
                                this.tipoAccion = 2;
                                break;
                            }
                            case 'desactivar':
                            {
                                this.modal = 1;
                                this.id_ambiente=data.id_ambiente;
                                this.tituloModal = 'Desactivar ambiente '+data.amb_nombre;
                                let me=this;
                                var url= '/horario/validarAmbiente?idAmbiente=' + data.id_ambiente;
                                axios.get(url).then(function (response) {
                                    console.log(response);
                                    var respuesta= response.data;
                                    console.log(respuesta.distincAmb);
                                    if (respuesta.distincAmb.length > 0) {
                                        me.validacionAmb = respuesta.distincAmb;
                                        me.validacionCambio= respuesta.allInfoAmb;
                                        me.tipoAccion = 3;
                                    }else{
                                        me.tipoAccion = 4;
                                    }
                                })
                                .catch(function (error) {
                                    console.log(error);
                                });

                                //this.tipoAccion = 3;
                            }
                        }
                    }
                }
            },
            cerrarModal (){
                this.modal=0;
                this.mostrarOpc=0;
                this.tituloModal = '';
                this.nombre = '';
                this.tipo = '';
                this.validacionAmb= [];
                this.validacionCambio= [];
                this.mostrarOpc=0;
                this.ficha=0;
                this.problema='';
                this.arrFichAmb=[];
            }
        },
        mounted() {
            this.dataListAmbiente();
            if (this.id == undefined) {
                this.listarAmbiente(1,this.buscar,this.criterio);
            }
            else{
                this.listarAmbiente(1,this.id,this.criterio);
                this.espacio = 'margin-left: 0px';
            }
            
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
</style>
