<template>
    <main class="main" v-bind:style="this.espacio">
        <div class="container-fluid_contacto">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> PQR
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <select class="form-control col-md-3" v-model="criterio">
                                    <option value="con_nombre">Nombre del remitente</option>
                                    <option value="con_correo">Correo del remitente</option>
                                </select>
                                <input type="text" v-model="buscar" @keyup.enter="listarcontacto(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                <button type="submit" @click="listarcontacto(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Asunto</th>
                                    <th>Mensaje</th>
                                    <th>De</th>
                                    <th>Correo</th>
                                    <th>Celular</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="contacto in arraycontacto" :key="contacto.id_contacto" v-bind:style="contacto.con_visto==0 ? `background-color: #e4e5e6;` : ``">
                                    <td>
                                    <template v-if="contacto.con_visto==0">
                                        <button type="button" class="btn btn-info btn-sm" @click="vistocontacto(contacto.id_contacto)">
                                            <i class="fa fa-check-square-o"></i>
                                        </button>
                                    </template>                                   
                                    </td>
                                    <td v-text="contacto.con_asunto"></td>
                                    <td v-text="contacto.con_mensaje"></td>
                                    <td v-text="contacto.con_nombre"></td>
                                    <td v-text="contacto.con_correo"></td>
                                    <td v-text="contacto.con_celular"></td>
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
        <!--Fin del modal-->
    </main>
</template>

<script>
    export default {
        name: 'Mensajes',
        props: ['id','campo'],
        data (){
            return{
                arraycontacto : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'con_nombre',
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
            listarcontacto (page,buscar,criterio){
                let me=this;
                var url= '/contacto/index?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arraycontacto = respuesta.tbl_contacto.data;
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
                me.listarcontacto(page,buscar,criterio);
            },
            vistocontacto (id){
                swal({
                title: 'Seguro que has visto este mensaje?',
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

                    axios.put('/contacto/visto',{
                        'id_contacto': id
                    }).then(function (response) {
                        me.listarcontacto(1,'','nombre');
                        swal(
                        'Muy Bien!',
                        'Has resuelto un mensaje',
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
        },
        mounted() {
            if (this.id == undefined) {
                this.listarcontacto(1,this.buscar,this.criterio);
            }
            else{
                this.listarcontacto(1,this.id,this.campo);
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
