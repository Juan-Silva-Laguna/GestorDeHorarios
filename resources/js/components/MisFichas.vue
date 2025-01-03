<template>
    <main class="main">
        <div class="container-fluid_ficha">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Mis Fichas
                </div>
                <div class="card-body">
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>                                    
                                    <th>Codigo de ficha</th>
                                    <th>Programa</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="ficha in arrayficha" :key="ficha.id_ficha">
                                    <td v-text="ficha.id_ficha"></td>
                                    <td v-text="ficha.pro_nombre"></td>
                                    <td>
                                        <button type="button" @click="verAprendices(ficha.id_ficha)" class="btn btn-info btn-sm">
                                            Ver Aprendices<i class="icon-eye"></i>
                                        </button> &nbsp;                                    
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--Inicio del modal agregar/actualizar-->
        <div class="modal fade overflow-auto" tabindex="-1" :class="{'mostrar' : modal}" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-primary modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"> Aprendices</h4>
                        <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                            <span aaria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-3"  v-for="aprendiz in arrayaprendices" :key="aprendiz.id_persona">
                                <center>
                                    <img v-bind:src="aprendiz.per_foto" width="130" height="130"  class="img-avatar"><br>
                                    <b v-text="aprendiz.per_nombre"></b><br>
                                    <b v-text="aprendiz.per_email"></b><br><br>
                                </center>                                
                            </div>                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
</template>

<script>
    export default {
        data (){
            return{
                arrayficha : [],
                arrayaprendices: [],
                modal : 0
            }
        },
        methods : {
            mostrarMisFichas(id){
                let me=this;
                var url= '/persona/misFichas?id=' + id ;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayficha = respuesta.tbl_persona;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            verAprendices(ficha){
                this.modal = 1;
                let me=this;
                var url= '/ficha/verAprendices?ficha=' + ficha ;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayaprendices = respuesta.tbl_ficha;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            cerrarModal (){
                this.modal=0;
            }
        },
        mounted() {
            this.mostrarMisFichas($('#id').val());
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
