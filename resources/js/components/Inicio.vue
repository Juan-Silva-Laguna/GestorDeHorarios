<template>

    <main class="main row">
        <div class="container-fluid_notificacion col-md-4">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Notificaciones
                </div>
                
                <div class="card-body">
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-sm">
                            <tbody>
                                <tr v-for="notificacion in arraynotificacion" :key="notificacion.not_clave" v-bind:style="notificacion.not_visto==0 ? `background-color: #e4e5e6;font-weight: bold;cursor: pointer;` : ``" @click="vistonotificacion(notificacion.not_clave, notificacion.not_indice)">
                                    <td style="height: 37px;padding-left: 80px;" v-text="notificacion.not_texto"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <nav>
                        <ul class="pagination">
                            <li class="page-item" v-if="pagination.current_page > 1">
                                <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page - 1)">Ant</a>
                            </li>
                            <li class="page-item" v-for="page in pagesNumber" :key="page" :class="[page == isActived ? 'active' : '']">
                                <a class="page-link" href="#" @click.prevent="cambiarPagina(page)" v-text="page"></a>
                            </li>
                            <li class="page-item" v-if="pagination.current_page < pagination.last_page">
                                <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page + 1)">Sig</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- Fin ejemplo de tabla Listado -->
        </div>
        <!--Fin del modal-->
        <div v-if="opcion==1" class="col-md-8">
            <ficha :id="id"></ficha>
        </div>
        <div v-if="opcion==2" class="col-md-8">
            <ambiente :id="id" :campo="campo"></ambiente>
        </div>
        <div v-if="opcion==3" class="col-md-8">
            <instructor :id="id" :campo="campo"></instructor>
        </div>
        <div v-if="opcion==4" class="col-md-8">
            <mensajes :id="id" :campo="campo"></mensajes>
        </div>
        <div v-if="opcion==5" class="col-md-8">
            <horario :id="id" :campo="campo"></horario>
        </div>
    </main>
</template>

<script>
    import Ficha from './Ficha';
    import Instructor from './Instructor';
    import Mensajes from './Mensajes';
    import Ambiente from './Ambiente';
    import Horario from './Horario.vue';
    export default {
        components:{
            Ficha,
            Instructor,
            Mensajes,
            Ambiente,
            Horario
        },
        data (){
            return{
                arraynotificacion : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                opcion : 0,
                id:'',
                campo:''
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
            listarnotificacion (page){
                let me=this;
                var url= '/notificacion?page=' + page
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    console.log(respuesta.tbl_notificacion.data);
                    me.arraynotificacion = respuesta.tbl_notificacion.data;
                    me.pagination= respuesta.pagination;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            cambiarPagina(page){
                let me = this;
                //Actualiza la página actual
                me.pagination.current_page = page;
                //Envia la petición para visualizar la data de esa página
                me.listarnotificacion(page);
            },
            vistonotificacion (id, campo){
                console.log(id);
                let me = this;
                    axios.put('/notificacion/visto',{
                        'id': id
                    }).then(function (response) {
                        var respuesta= response.data;
                        me.listarnotificacion(1);
                    }).catch(function (error) {
                        console.log(error);
                    });
                    this.opcion=0;
                    setTimeout(() => {
                        switch (campo) {
                            case 'ficha':
                                this.id=id;
                                this.opcion=1;
                                break;
                            case 'ambiente':
                                this.id=id.slice(1,id.length);
                                this.campo = "id_ambiente";
                                this.opcion=2;
                                break;
                            case 'instructor':
                                this.campo = "tbl_instructor.id_instructor";
                                this.id=id;
                                this.opcion=3;
                                break;
                            case 'mensaje':
                                this.id=id.slice(1,id.length);
                                this.campo = "id_contacto";
                                this.opcion=4;
                                break;
                            case 'horario':
                                this.id=id.slice(1,id.length);
                                this.campo = "tbl_ficha.id_ficha";
                                this.opcion=5;
                                if ($(document).width()<=766) {
                                    $('html, body').animate({scrollTop: $(document).height()}, 'slow');
                                }else{
                                    $('html, body').animate({scrollTop:0}, 'slow');
                                }                                
                                break;
                        }
                    }, 500);
            },
        },
        mounted() {
            this.listarnotificacion(1);
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
