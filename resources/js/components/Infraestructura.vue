<template>
    <main class="main">
        <div class="container-fluid_infraestructura">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Tecnicos de Infraestructura
                    <button type="button" @click="abrirModal('infraestructura', 'registrar')" class="btn btn-secondary">
                        <i class="icon-plus"></i>&nbsp;Nuevo
                    </button>
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <select class="form-control col-md-3" v-model="criterio">
                                    <option value="tbl_persona.per_nombre">Nombre</option>
                                    <option value="tbl_persona.per_identificacion">Numero de identidad</option>
                                    <option value="tbl_persona.per_email">Correo</option>
                                </select>
                                <input type="text" v-model="buscar" @keyup.enter="listarinfraestructura(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                <button type="submit" @click="listarinfraestructura(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Tipo Documento</th>
                                    <th>Numero Documento</th>
                                    <th>Nombre</th>
                                    <th>Correo</th>
                                    <th>Dirección</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="infraestructura in arrayinfraestructura" :key="infraestructura.id_infraestructura">
                                    <td>
                                        <button type="button" @click="abrirModal('infraestructura', 'actualizar', infraestructura)" class="btn btn-warning btn-sm">
                                            <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                        <template v-if="infraestructura.per_estado">
                                            <button type="button" class="btn btn-danger btn-sm" @click="desactivarinfraestructura(infraestructura.id_persona)">
                                                <i class="fa fa-toggle-off"></i>
                                            </button>
                                        </template>
                                        <template v-else>
                                            <button type="button" class="btn btn-success btn-sm" @click="activarinfraestructura(infraestructura.id_persona)">
                                                <i class="fa fa-toggle-on"></i>
                                            </button>
                                        </template>                                    
                                    </td>
                                    <td v-text="infraestructura.per_tipo_identificacion"></td>
                                    <td v-text="infraestructura.per_identificacion"></td>
                                    <td v-text="infraestructura.per_nombre+' '+infraestructura.per_apellidos"></td>
                                    <td v-text="infraestructura.per_email"></td>
                                    <td v-text="infraestructura.per_direccion"></td>
                                    <td>
                                        <div v-if="infraestructura.per_estado">
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
        <div class="modal fade overflow-auto" tabindex="-1" :class="{'mostrar' : modal}" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-primary modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" v-text="tituloModal"></h4>
                        <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                            <span aaria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Tipo de Documento</label>
                                <div class="col-md-9">
                                    <select v-model="tipoDocumento"  class="form-control">
                                        <option value=""></option>
                                        <option value="TI">TI</option>
                                        <option value="CC">CC</option>
                                        <option value="CE">CE</option>
                                        <option value="Otro">Otro</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Numero de Documento</label>
                                <div class="col-md-9">
                                    <input type="number" v-model="documento" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Nombres</label>
                                <div class="col-md-9">
                                    <input type="text" v-model="nombre" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Apellidos</label>
                                <div class="col-md-9">
                                    <input type="text" v-model="apellido" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Correo</label>
                                <div class="col-md-9">
                                    <input type="text" v-model="email" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Dirección</label>
                                <div class="col-md-9">
                                    <input type="text" v-model="direccion" class="form-control">
                                </div>
                            </div>
                            <div v-show="errorinfraestructura" class="form-group row div-error">
                                <div class="text-center text-error">
                                    <div v-for="error in errorMostrarMsjinfraestructura" :key="error" v-text="error"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                        <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarinfraestructura()">Guardar</button>
                        <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarinfraestructura()">Actualizar</button>
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
        data (){
            return{
                id_infraestructura : 0,
                id_persona : 0,
                nombre : '',
                apellido : '',
                tipoDocumento : '',
                documento : '',
                email : '',
                direccion : '',
                arrayinfraestructura : [],
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorinfraestructura : 0,
                errorMostrarMsjinfraestructura : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'tbl_persona.per_nombre',
                buscar : ''
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
            listarinfraestructura (page,buscar,criterio){
                let me=this;
                var url= '/infraestructura?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayinfraestructura = respuesta.tbl_infraestructura.data;
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
                me.listarinfraestructura(page,buscar,criterio);
            },
            registrarinfraestructura (){
                if (this.validate_infraestructura()) {
                    return;
                }
                let me=this;
                axios.post('/infraestructura/registrar', {
                    'nombre': this.nombre,
                    'apellido': this.apellido,
                    'tipoDocumento': this.tipoDocumento,
                    'documento': this.documento,
                    'email': this.email,
                    'direccion': this.direccion
                }).then(function (response) { 
                    if(response.statusText=="OK"){
                        swal("Muy Bien!", "Has registrado el tecnico con exito!!", "success");
                    }else{
                        swal("Que mal!", "Hubo un erro al registrar al tecnico", "error");
                    }
                    me.cerrarModal();
                    me.listarinfraestructura(1,'','per_nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            validate_infraestructura (){
                this.errorinfraestructura = 0;
                this.errorMostrarMsjinfraestructura = [];

                if (!this.nombre) this.errorMostrarMsjinfraestructura.push('El nombre del infraestructura no puede estar vacio');
                if (!this.apellido) this.errorMostrarMsjinfraestructura.push('El apellido del infraestructura no puede estar vacio');
                if (!this.tipoDocumento) this.errorMostrarMsjinfraestructura.push('El tipo de documento del infraestructura no puede estar vacio');
                if (!this.documento) this.errorMostrarMsjinfraestructura.push('El documento del infraestructura no puede estar vacio');
                if (!this.email) this.errorMostrarMsjinfraestructura.push('El correo del infraestructura no puede estar vacio');
                if (!this.direccion) this.errorMostrarMsjinfraestructura.push('La dirección del infraestructura no puede estar vacia');
                if (this.errorMostrarMsjinfraestructura.length) this.errorinfraestructura = 1;

                return this.errorinfraestructura;
            },
            desactivarinfraestructura (id){
                swal({
                title: 'Esta seguro de desactivar el tecnico de infraestructura?',
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

                    axios.put('/infraestructura/desactivar',{
                        'id_persona': id
                    }).then(function (response) {
                        me.listarinfraestructura(1,'','nombre');
                        swal(
                        'Desactivado!',
                        'El tecnico se a desactivado con éxito.',
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
                }) 
            },
            activarinfraestructura (id){
                swal({
                title: 'Esta seguro de activar  el tecnico de infraestructura?',
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
                    axios.put('/infraestructura/activar',{
                        'id_persona': id
                    }).then(function (response) {
                        me.listarinfraestructura(1,'','nombre');
                        swal(
                        'Activado!',
                        'El tecnico se activado con éxito.',
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
                }) 
            },
            actualizarinfraestructura (){
                if (this.validate_infraestructura()) {
                    return;
                }

                let me=this;
                console.log(this.id_infraestructura);
                axios.put('/infraestructura/actualizar', {
                    'id_persona': this.id_persona,
                    'id_infraestructura': this.id_infraestructura,
                    'nombre': this.nombre,
                    'apellido': this.apellido,
                    'tipoDocumento': this.tipoDocumento,
                    'documento': this.documento,
                    'email': this.email,
                    'direccion': this.direccion,
                    'tipoContrato': this.tipoContrato,
                    'fechaIni': this.fechaIni,
                    'fechaFin': this.fechaFin,
                    'profesion': this.profesion
                }).then(function (response) {
                    if(response.statusText=="OK"){
                        swal("Muy Bien!", "Has acutualizado los daros con exito!!", "success");
                    }else{
                        swal("Que mal!", "Hubo un erro al actualizar los datos", "error");
                    }
                    me.cerrarModal();
                    me.listarinfraestructura(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            abrirModal(modelo, accion, data = []){
                switch (modelo) {
                    case 'infraestructura':
                    {
                        switch (accion) {
                            case 'registrar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Registrar Infraestructura';
                                this.nombre = '';
                                this.apellido = '';
                                this.tipoDocumento = '';
                                this.documento = '';
                                this.email = '';
                                this.direccion = '';
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Actualizar infraestructura';
                                this.id_infraestructura = data.id_infraestructura;
                                this.id_persona = data.id_persona;
                                this.nombre = data.per_nombre;
                                this.apellido = data.per_apellidos;
                                this.tipoDocumento = data.per_tipo_identificacion;
                                this.documento = data.per_identificacion;
                                this.email = data.per_email;
                                this.direccion = data.per_direccion;
                                this.tipoAccion = 2;
                            }
                        }
                    }
                }
            },
            cerrarModal (){
                this.modal=0;
                this.tituloModal = '';
                this.id_infraestructura = 0;
                this.id_persona = 0;
                this.nombre = '';
                this.apellido = '';
                this.tipoDocumento = '';
                this.documento = '';
                this.email = '';
                this.direccion = '';
                this.mostrarFechaFin = 0;
            }
        },
        mounted() {
            this.listarinfraestructura(1,this.buscar,this.criterio);
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
