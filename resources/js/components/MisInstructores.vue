<template>
    <main class="main">
        <div class="container-fluid_ambiente">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Mis Instructores
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3"  v-for="instructor in arrayinstructores" :key="instructor.id_persona">
                            <center>
                                <img v-bind:src="instructor.per_foto" width="130" height="130"  class="img-avatar"><br>
                                <b v-text="instructor.per_nombre"></b><br>
                                <b v-text="instructor.per_email"></b><br>
                                <b v-text="instructor.ins_profesion"></b><br><br>
                            </center>                                
                        </div>                            
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
                arrayinstructores : [],
            }
        },
        methods : {
            mostrarMisambientes(id){
                let me=this;
                var url= '/persona/misInstrucores?id=' + id;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayinstructores = respuesta.tbl_persona;
                })
                .catch(function (error) {
                    console.log(error);
                });
            }
        },
        mounted() {
            this.mostrarMisambientes($('#id').val());
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
