<template>
    <main class="main">
        <div class="container-flu">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Ambientes Inactivos 
                </div>
                <div class="card-body">
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Codigo de Ambiente</th>
                                    <th>Nombre de ambiente</th>
                                    <th>Daño</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="ambiente in arrayAmbiente" :key="ambiente.id_mantenimiento">
                                    <td>
                                        <template v-if="!ambiente.amb_estado">
                                            <button type="button" class="btn btn-success btn-sm" @click="abrirModal(ambiente.id_mantenimiento, ambiente.man_ides_amb, ambiente.id_ambiente)">
                                                <i class="fa fa-toggle-on"></i>
                                            </button>
                                        </template>                                  
                                    </td>
                                    <td v-text="ambiente.amb_codigo_ambiente"></td>
                                    <td v-text="ambiente.amb_nombre"></td>
                                    <td v-text="ambiente.man_problema"></td>
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
                        <h4 class="modal-title">Activar Modal</h4>
                        <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                            <span aaria-hidden="true">×</span>
                        </button>
                    </div>              
                    <div class="modal-body">
                        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Que arreglos realizaste?</label>
                                <div class="col-md-9">
                                    <textarea  class="form-control" v-model="arreglo"></textarea>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                        <button type="button" class="btn btn-primary" @click="activarAmbiente()">Finalizar Activación</button>
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
                arrayAmbiente:[],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                arrayIdes: [],
                id_ambiente: null,
                id_mantenimiento: null,
                modal:0,
                arreglo:''

            }
        },
        props: ['id'],
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
            listarAmbiente (){
                let me=this;
                var url= '/ambientesInactivos';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayAmbiente = respuesta.tbl_ambiente.data;
                    me.pagination= respuesta.pagination;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            cambiarPagina(){
                let me = this;
                //Actualiza la página actual
                me.pagination.current_page = page;
                //Envia la petición para visualizar la data de esa página
                me.listarAmbiente();
            },
            activarAmbiente (){   
                let me = this;  
                         
                axios.put('/mantenimiento/editar',{
                    'id_mantenimiento': me.id_mantenimiento,
                    'id_ambiente': me.id_ambiente,
                    'arrayIdes': me.arrayIdes,
                    'arreglo': me.arreglo,
                    'id_responsable': me.id
                }).then(function (response) {
                    me.modal = 0;
                    me.listarAmbiente(1,'','nombre');
                    swal(
                    'Activado!',
                    'El ambiente se activado con éxito.',
                    'success'
                    )
                }).catch(function (error) {
                    console.log(error);
                });
                
            },
            abrirModal(id_mant, ides, id_amb){
                this.modal = 1;
                this.id_ambiente = id_amb;
                this.arrayIdes = ides.split(';');
                this.id_mantenimiento = id_mant;
                console.log(this.id_ambiente);
                console.log(this.arrayIdes);
                console.log(this.id_mantenimiento);
                
            },
            cerrarModal (){
                this.modal = 0;
                this.id_ambiente = null;
                this.arrayIdes = [];
                this.id_mantenimiento = null;
            }
        },
        mounted() {
            this.listarAmbiente(1,this.buscar,this.criterio);
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
