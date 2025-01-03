<template>
    <main class="main">
        <div class="container-fluid_programa">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Programas
                    <button type="button" @click="abrirModal('programa', 'registrar')" class="btn btn-secondary">
                        <i class="icon-plus"></i>&nbsp;Nuevo
                    </button>
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <select class="form-control col-md-3" v-model="criterio">
                                    <option value="pro_nombre">Nombre del programa</option>
                                    <option value="pro_tipo">Tipo de Programa</option>
                                </select>
                                <input type="text" v-model="buscar" @keyup.enter="listarPrograma(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                <button type="submit" @click="listarPrograma(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Nombre de Programa</th>
                                    <th>Tipo de Programa</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="programa in arrayPrograma" :key="programa.id_programa">
                                    <td>
                                        <button type="button" @click="abrirModal('programa', 'actualizar', programa)" class="btn btn-warning btn-sm">
                                            <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                        <template v-if="programa.pro_estado">
                                            <button type="button" class="btn btn-danger btn-sm" @click="desactivarprograma(programa.id_programa)">
                                                <i class="fa fa-toggle-off"></i>
                                            </button>
                                        </template>
                                        <template v-else>
                                            <button type="button" class="btn btn-success btn-sm" @click="activarprograma(programa.id_programa)">
                                                <i class="fa fa-toggle-on"></i>
                                            </button>
                                        </template>                                    
                                    </td>
                                    <td v-text="programa.pro_nombre"></td>
                                    <td v-text="programa.pro_tipo"></td>
                                    <td>
                                        <div v-if="programa.pro_estado">
                                            <span class="badge badge-success">Activo</span>
                                        </div>
                                        <div v-else>
                                            <span class="badge badge-danger">Desactivado</span>
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
                    <div class="modal-body">
                        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Nombre del Programa</label>
                                <div class="col-md-9">
                                    <input type="text" v-model="nombre" class="form-control" placeholder="Nombre de categoría">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="email-input">Tipo de Programa</label>
                                <div class="col-md-9">
                                    <select v-model="tipo" class="form-control">
                                        <option value="">-- Seleccione --</option>
                                        <option value="Tecnólogo">Tecnólogo</option>
                                        <option value="Técnico">Técnico</option>
                                        <option value="Curso">Curso</option>
                                    </select>
                                </div>
                            </div>
                            <div v-show="errorprograma" class="form-group row div-error">
                                <div class="text-center text-error">
                                    <div v-for="error in errorMostrarMsjprograma" :key="error" v-text="error"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                        <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarprograma()">Guardar</button>
                        <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarprograma()">Actualizar</button>
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
                id_programa : 0,
                nombre : '',
                tipo : '',
                arrayPrograma : [],
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorprograma : 0,
                errorMostrarMsjprograma : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'pro_nombre',
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
            listarPrograma (page,buscar,criterio){
                let me=this;
                var url= '/programa?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayPrograma = respuesta.tbl_programa.data;
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
                me.listarPrograma(page,buscar,criterio);
            },
            registrarprograma (){
                if (this.validate_programa()) {
                    return;
                }

                let me=this;
                axios.post('/programa/registrar', {
                    'nombre': this.nombre,
                    'tipo': this.tipo
                }).then(function (response) {
                    if(response.statusText=="OK"){
                        swal("Muy Bien!", "Has registrado el programa con exito!!", "success");
                    }else{
                        swal("Que mal!", "Hubo un erro al registrar el programa", "error");
                    }
                    me.cerrarModal();
                    me.listarPrograma(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            validate_programa (){
                this.errorprograma = 0;
                this.errorMostrarMsjprograma = [];

                if (!this.nombre) this.errorMostrarMsjprograma.push('El nombre de la programa no puede estar vacio');
                if (!this.tipo) this.errorMostrarMsjprograma.push('Debe seleccionar un tipo de programa');
                if (this.errorMostrarMsjprograma.length) this.errorprograma = 1;

                return this.errorprograma;
            },
            desactivarprograma (id){
                swal({
                title: 'Esta seguro de desactivar este programa?',
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

                    axios.put('/programa/desactivar',{
                        'id_programa': id
                    }).then(function (response) {
                        me.listarPrograma(1,'','nombre');
                        swal(
                        'Desactivado!',
                        'El registro ha sid_programao desactivado con éxito.',
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
            activarprograma (id){
                swal({
                title: 'Esta seguro de activar este programa?',
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
                    axios.put('/programa/activar',{
                        'id_programa': id
                    }).then(function (response) {
                        me.listarPrograma(1,'','nombre');
                        swal(
                        'Activado!',
                        'El programa activado con éxito.',
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
            actualizarprograma (){
                if (this.validate_programa()) {
                    return;
                }

                let me=this;
                console.log(this.id_programa);
                axios.put('/programa/actualizar', {
                    'nombre': this.nombre,
                    'tipo': this.tipo,
                    'id_programa' : this.id_programa
                }).then(function (response) { 
                    if(response.statusText=="OK"){
                        swal("Muy Bien!", "Has actualizado el programa con exito!!", "success");
                    }else{
                        swal("Que mal!", "Hubo un erro al actualizar el programa", "error");
                    }
                    me.cerrarModal();
                    me.listarPrograma(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            abrirModal(modelo, accion, data = []){
                switch (modelo) {
                    case 'programa':
                    {
                        switch (accion) {
                            case 'registrar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Registar programa';
                                this.nombre = '';
                                this.tipo = '';
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Actualizar programa';
                                this.id_programa = data.id_programa;
                                this.nombre = data.pro_nombre;
                                this.tipo = data.pro_tipo;
                                this.tipoAccion = 2;
                            }
                        }
                    }
                }
            },
            cerrarModal (){
                this.modal=0;
                this.tituloModal = '';
                this.nombre = '';
                this.tipo = '';
            }
        },
        mounted() {
            this.listarPrograma(1,this.buscar,this.criterio);
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
