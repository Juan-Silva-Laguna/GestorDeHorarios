<template>
    <main class="main">
        <div class="container-fluid">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Historico de Mantenimiento
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <select class="form-control col-md-3" v-model="criterio">
                                    <option value="tbl_mantenimiento.man_problema">Daño</option>
                                    <option value="tbl_mantenimiento.man_reparacion">Arreglo</option>
                                    <option value="tbl_ambiente.amb_nombre">Ambiente</option>
                                    <option value="tbl_mantenimiento.created_at">Fecha Daño</option>
                                    <option value="tbl_mantenimiento.updated_at">Fecha Arreglo</option>
                                </select>
                                <input type="text" v-model="buscar" @keyup.enter="listarmantenimiento(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                <button type="submit" @click="listarmantenimiento(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Ambiente</th>
                                    <th>Daño</th>
                                    <th>Arreglo</th>
                                    <th>Fecha Daño</th>
                                    <th>Fecha Arreglo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="mantenimiento in arrayMantenimiento" :key="mantenimiento.id_mantenimiento">                                    
                                    <td v-text="mantenimiento.amb_nombre"></td>
                                    <td v-text="mantenimiento.man_problema"></td>
                                    <td v-text="mantenimiento.man_reparacion"></td>
                                    <td>{{formatoFecha(mantenimiento.created_at)}}</td>
                                    <td>{{formatoFecha(mantenimiento.updated_at)}}</td>
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
    </main>
</template>

<script>
    export default {
        data (){
            return{
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'mantenimiento.man_problema',
                buscar : '',
                arrayMantenimiento: []
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
            listarmantenimiento (page,buscar,criterio){
                let me=this;
                var url= '/mantenimiento?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    console.log(respuesta);
                    me.arrayMantenimiento = respuesta.tbl_mantenimiento.data;
                    me.pagination= respuesta.pagination;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            formatoFecha (fecha){
                return String(fecha).substr(0,10)+" "+String(fecha).substr(11,8);
            },
            cambiarPagina(page,buscar,criterio){
                let me = this;
                //Actualiza la página actual
                me.pagination.current_page = page;
                //Envia la petición para visualizar la data de esa página
                me.listarmantenimiento(page,buscar,criterio);
            }
        },
        mounted() {
            this.listarmantenimiento(1,this.buscar,this.criterio);
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
