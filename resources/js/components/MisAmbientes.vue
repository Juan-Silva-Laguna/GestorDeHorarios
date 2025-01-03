<template>
    <main class="main">
        <div class="container-fluid_ambiente">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Mis ambientes
                </div>
                <div class="card-body">
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>                                    
                                    <th>Codigo de ambiente</th>
                                    <th>Nombre del Ambiente</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="ambiente in arrayambiente" :key="ambiente.id_ambiente">
                                    <td v-text="ambiente.amb_codigo_ambiente"></td>
                                    <td v-text="ambiente.amb_nombre"></td>
                                </tr>
                            </tbody>
                        </table>
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
                arrayambiente : [],
            }
        },
        methods : {
            mostrarMisambientes(id,rol){
                let me=this;
                var url= '/persona/misAmbientes?id=' + id+'&rol='+rol;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayambiente = respuesta.tbl_persona;
                })
                .catch(function (error) {
                    console.log(error);
                });
            }
        },
        mounted() {
            this.mostrarMisambientes($('#id').val(),$('#rol').val());
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
