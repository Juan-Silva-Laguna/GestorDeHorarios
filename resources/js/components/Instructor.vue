<template>
    <main class="main" v-bind:style="this.espacio">
        <div class="container-fluid_instructor">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Instructores
                    <button type="button" @click="abrirModal('instructor', 'registrar')" class="btn btn-secondary">
                        <i class="icon-plus"></i>&nbsp;Nuevo
                    </button>
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <select class="form-control col-md-3" v-model="criterio">
                                    <option value="tbl_persona.per_nombre">Nombre de instructor</option>
                                    <option value="tbl_persona.per_identificacion">Numero de identidad</option>
                                    <option value="tbl_instructor.ins_tipo_contrato">Tipo de Contrato</option>
                                </select>
                                <input type="text" v-model="buscar" @keyup.enter="listarinstructor(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                <button type="submit" @click="listarinstructor(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Tipo Documento</th>
                                    <th>Numero Documento</th>
                                    <th>Nombre</th>
                                    <th>Contrato</th>
                                    <th>Fecha Inicio</th>
                                    <th>Fecha Fin</th>
                                    <th>Profesion</th>
                                    <th>Correo</th>
                                    <th>Horas Asignadas</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="instructor in arrayinstructor" :key="instructor.id_instructor" v-bind:class="instructor.per_estado==0 ? `alert alert-danger` : ``">
                                    <td>
                                        <button type="button" @click="abrirModal('instructor', 'actualizar', instructor)" class="btn btn-warning btn-sm">
                                            <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                        <template v-if="instructor.per_estado">
                                            <button type="button" class="btn btn-danger btn-sm" @click="desactivarinstructor(instructor.id_persona)">
                                                <i class="fa fa-toggle-off"></i>
                                            </button>
                                        </template>                                 
                                    </td>
                                    <td v-text="instructor.per_tipo_identificacion"></td>
                                    <td v-text="instructor.per_identificacion"></td>
                                    <td v-text="instructor.per_nombre+' '+instructor.per_apellidos"></td>
                                    <td v-text="instructor.ins_tipo_contrato"></td>
                                    <td v-text="instructor.ins_fechaInicio"></td>
                                    <td v-text="instructor.ins_fechaFin"></td>
                                    <td v-text="instructor.ins_profesion"></td>
                                    <td v-text="instructor.per_email"></td>
                                    <th v-text="instructor.ins_horas"></th>
                                    <td>
                                        <div v-if="instructor.per_estado">
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
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Profesión</label>
                                <div class="col-md-9">
                                    <input type="text" v-model="profesion" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Tipo de Contrato</label>
                                <div class="col-md-9">
                                    <select v-model="tipoContrato" @change="validarFechaFin()" class="form-control">
                                        <option value=""></option>
                                        <option value="Temporal">Temporal</option>
                                        <option value="Indefinido">Indefinido</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Fecha Inicio</label>
                                <div class="col-md-9">
                                    <input type="date" v-model="fechaIni" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row" v-if="mostrarFechaFin">
                                <label class="col-md-3 form-control-label" for="text-input">Fecha Fin</label>
                                <div class="col-md-9">
                                    <input type="date" v-model="fechaFin" class="form-control">
                                </div>
                            </div>
                            <div v-show="errorinstructor" class="form-group row div-error">
                                <div class="text-center text-error">
                                    <div v-for="error in errorMostrarMsjinstructor" :key="error" v-text="error"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                        <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarinstructor()">Guardar</button>
                        <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarinstructor()">Actualizar</button>
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
        name: 'Instructor',
        props: ['id','campo'],
        data (){
            return{
                id_instructor : 0,
                id_persona : 0,
                nombre : '',
                apellido : '',
                tipoDocumento : '',
                documento : '',
                email : '',
                direccion : '',
                tipoContrato : '',
                fechaIni : '',
                fechaFin : '',
                profesion : '',
                mostrarFechaFin : 0,
                arrayinstructor : [],
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorinstructor : 0,
                errorMostrarMsjinstructor : [],
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
                buscar : '',
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
            listarinstructor (page,buscar,criterio){
                let me=this;
                var url= '/instructor?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayinstructor = respuesta.tbl_instructor.data;
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
                me.listarinstructor(page,buscar,criterio);
            },
            validarFechaFin(){
                if (this.tipoContrato == 'Temporal') {
                    this.mostrarFechaFin = 1;
                }else{
                    this.mostrarFechaFin = 0;
                }
            },
            registrarinstructor (){
                if (this.validate_instructor()) {
                    return;
                }

                let todo = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,'A', 'B', 'C', 'D', 'E', 'F']
                let color = '';
                for (let i = 0; i < 6; i++) {
                let j =Math.round(Math.random()*15);;
                    color += todo[j];
                }

                let me=this;
                axios.post('/instructor/registrar', {
                    'nombre': this.nombre,
                    'apellido': this.apellido,
                    'tipoDocumento': this.tipoDocumento,
                    'documento': this.documento,
                    'email': this.email,
                    'direccion': this.direccion,
                    'tipoContrato': this.tipoContrato,
                    'fechaIni': this.fechaIni,
                    'fechaFin': this.fechaFin,
                    'profesion': this.profesion,
                    'color': color
                }).then(function (response) { 
                    if(response.statusText=="OK"){
                        swal("Muy Bien!", "Has registrado el instructor con exito!!", "success");
                    }else{
                        swal("Que mal!", "Hubo un erro al registrar el instructor", "error");
                    }
                    me.cerrarModal();
                    me.listarinstructor(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            validate_instructor (){
                this.errorinstructor = 0;
                this.errorMostrarMsjinstructor = [];

                if (!this.nombre) this.errorMostrarMsjinstructor.push('El nombre del instructor no puede estar vacio');
                if (!this.apellido) this.errorMostrarMsjinstructor.push('El apellido del instructor no puede estar vacio');
                if (!this.tipoDocumento) this.errorMostrarMsjinstructor.push('El tipo de documento del instructor no puede estar vacio');
                if (!this.documento) this.errorMostrarMsjinstructor.push('El documento del instructor no puede estar vacio');
                if (!this.email) this.errorMostrarMsjinstructor.push('El correo del instructor no puede estar vacio');
                if (!this.direccion) this.errorMostrarMsjinstructor.push('La dirección del instructor no puede estar vacia');
                if (!this.profesion) this.errorMostrarMsjinstructor.push('La profesión del instructor no puede estar vacia');
                if (!this.tipoContrato) this.errorMostrarMsjinstructor.push('El tipo de contrato del instructor no puede estar vacio');
                if (!this.fechaIni) this.errorMostrarMsjinstructor.push('La Fecha inicial del instructor no puede estar vacia');
                if (this.errorMostrarMsjinstructor.length) this.errorinstructor = 1;

                return this.errorinstructor;
            },
            desactivarinstructor (id){
                swal({
                title: 'Esta seguro de desactivar este instructor?',
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

                    axios.put('/instructor/desactivar',{
                        'id_persona': id
                    }).then(function (response) {
                        me.listarinstructor(1,'','nombre');
                        swal(
                        'Desactivado!',
                        'El registro ha sid_instructoro desactivado con éxito.',
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
            actualizarinstructor (){
                if (this.validate_instructor()) {
                    return;
                }

                let me=this;
                console.log(this.id_instructor);
                axios.put('/instructor/actualizar', {
                    'id_persona': this.id_persona,
                    'id_instructor': this.id_instructor,
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
                        swal("Muy Bien!", "Has actualizado los datos con exito!!", "success");
                    }else{
                        swal("Que mal!", "Hubo un erro al actualizar los datos", "error");
                    }
                    me.cerrarModal();
                    me.listarinstructor(1,'','nombre');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            abrirModal(modelo, accion, data = []){
                switch (modelo) {
                    case 'instructor':
                    {
                        switch (accion) {
                            case 'registrar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Registrar Instructor';
                                this.nombre = '';
                                this.codigo = '';
                                this.capacidad = '';
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Actualizar instructor';
                                this.id_instructor = data.id_instructor;
                                this.id_persona = data.id_persona;
                                this.nombre = data.per_nombre;
                                this.apellido = data.per_apellidos;
                                this.tipoDocumento = data.per_tipo_identificacion;
                                this.documento = data.per_identificacion;
                                this.email = data.per_email;
                                this.direccion = data.per_direccion;
                                this.tipoContrato = data.ins_tipo_contrato;
                                this.fechaIni = data.ins_fechaInicio;
                                this.fechaFin = data.ins_fechaFin;
                                this.profesion = data.ins_profesion;
                                if (data.ins_tipo_contrato=='Temporal') {
                                    this.mostrarFechaFin = 1;
                                }else{
                                    this.mostrarFechaFin = 0;
                                }
                                this.tipoAccion = 2;
                            }
                        }
                    }
                }
            },
            cerrarModal (){
                this.modal=0;
                this.tituloModal = '';
                this.id_instructor = 0;
                this.id_persona = 0;
                this.nombre = '';
                this.apellido = '';
                this.tipoDocumento = '';
                this.documento = '';
                this.email = '';
                this.direccion = '';
                this.tipoContrato = '';
                this.fechaIni = '';
                this.fechaFin = '';
                this.profesion = '';
                this.mostrarFechaFin = 0;
            }
        },
        mounted() {
            if (this.id == undefined) {
                this.listarinstructor(1,this.buscar,this.criterio);
            }
            else{
                this.listarinstructor(1,this.id,this.campo);
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
