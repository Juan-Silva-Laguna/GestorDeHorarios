<template>
    <main class="main">
        <div class="container-fluid_ambiente">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Mis Horario
                </div>
                <div class="card-body">
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped table-sm" >
                            <thead>
                                <tr>
                                    <th>Hora</th>
                                    <th>Lunes</th>
                                    <th>Martes</th>
                                    <th>Miercoles</th>
                                    <th>Jueves</th>
                                    <th>Viernes</th>
                                    <th>Sabado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr><!--Tocaria hacer un arreglo que capte por dia-->
                                    <td>06:00 AM - 07:00 AM</td>
                                    <td id="l6_7"></td>
                                    <td id="m6_7"></td>
                                    <td id="mi6_7"></td>
                                    <td id="j6_7"></td>
                                    <td id="v6_7"></td>
                                    <td id="s6_7"></td>
                                </tr>
                                <tr>
                                    <td>07:00 AM - 08:00 AM</td>
                                    <td id="l7_8"></td>
                                    <td id="m7_8"></td>
                                    <td id="mi7_8"></td>
                                    <td id="j7_8"></td>
                                    <td id="v7_8"></td>
                                    <td id="s7_8"></td>
                                </tr>
                                <tr>
                                    <td>08:00 AM - 09:00 AM</td>
                                    <td id="l8_9"></td>
                                    <td id="m8_9"></td>
                                    <td id="mi8_9"></td>
                                    <td id="j8_9"></td>
                                    <td id="v8_9"></td>
                                    <td id="s8_9"></td>
                                </tr>
                                <tr>
                                    <td>09:00 AM - 10:00 AM</td>
                                    <td id="l9_10"></td>
                                    <td id="m9_10"></td>
                                    <td id="mi9_10"></td>
                                    <td id="j9_10"></td>
                                    <td id="v9_10"></td>
                                    <td id="s9_10"></td>
                                </tr>
                                <tr>
                                    <td>10:00 AM - 11:00 AM</td>
                                    <td id="l10_11"></td>
                                    <td id="m10_11"></td>
                                    <td id="mi10_11"></td>
                                    <td id="j10_11"></td>
                                    <td id="v10_11"></td>
                                    <td id="s10_11"></td>
                                </tr>
                                <tr>
                                    <td>11:00 AM - 12:00 AM</td>
                                    <td id="l11_12"></td>
                                    <td id="m11_12"></td>
                                    <td id="mi11_12"></td>
                                    <td id="j11_12"></td>
                                    <td id="v11_12"></td>
                                    <td id="s11_12"></td>
                                </tr>
                                <tr>
                                    <td>12:00 AM - 01:00 PM</td>
                                    <td id="l12_13"></td>
                                    <td id="m12_13"></td>
                                    <td id="mi12_13"></td>
                                    <td id="j12_13"></td>
                                    <td id="v12_13"></td>
                                    <td id="s12_13"></td>
                                </tr>
                                <tr>
                                    <td>01:00 PM - 02:00 PM</td>
                                    <td id="l13_14"></td>
                                    <td id="m13_14"></td>
                                    <td id="mi13_14"></td>
                                    <td id="j13_14"></td>
                                    <td id="v13_14"></td>
                                    <td id="s13_14"></td>
                                </tr>
                                <tr>
                                    <td>02:00 PM - 03:00 PM</td>
                                    <td id="l14_15"></td>
                                    <td id="m14_15"></td>
                                    <td id="mi14_15"></td>
                                    <td id="j14_15"></td>
                                    <td id="v14_15"></td>
                                    <td id="s14_15"></td>
                                </tr>
                                <tr>
                                    <td>03:00 PM - 04:00 PM</td>
                                    <td id="l15_16"></td>
                                    <td id="m15_16"></td>
                                    <td id="mi15_16"></td>
                                    <td id="j15_16"></td>
                                    <td id="v15_16"></td>
                                    <td id="s15_16"></td>
                                </tr>
                                <tr>
                                    <td>04:00 PM - 05:00 PM</td>
                                    <td id="l16_17"></td>
                                    <td id="m16_17"></td>
                                    <td id="mi16_17"></td>
                                    <td id="j16_17"></td>
                                    <td id="v16_17"></td>
                                    <td id="s16_17"></td>
                                </tr>
                                <tr>
                                    <td>05:00 PM - 06:00 PM</td>
                                    <td id="l17_18"></td>
                                    <td id="m17_18"></td>
                                    <td id="mi17_18"></td>
                                    <td id="j17_18"></td>
                                    <td id="v17_18"></td>
                                    <td id="s17_18"></td>
                                </tr>
                                <tr>
                                    <td>06:00 PM - 07:00 PM</td>
                                    <td id="l18_19"></td>
                                    <td id="m18_19"></td>
                                    <td id="mi18_19"></td>
                                    <td id="j18_19"></td>
                                    <td id="v18_19"></td>
                                    <td id="s18_19"></td>
                                </tr>
                                <tr>
                                    <td>07:00 PM - 08:00 PM</td>
                                    <td id="l19_20"></td>
                                    <td id="m19_20"></td>
                                    <td id="mi19_20"></td>
                                    <td id="j19_20"></td>
                                    <td id="v19_20"></td>
                                    <td id="s19_20"></td>
                                </tr>
                                <tr>
                                    <td>08:00 PM - 09:00 PM</td>
                                    <td id="l20_21"></td>
                                    <td id="m20_21"></td>
                                    <td id="mi20_21"></td>
                                    <td id="j20_21"></td>
                                    <td id="v20_21"></td>
                                    <td id="s20_21"></td>
                                </tr>
                                <tr>
                                    <td>09:00 PM - 10:00 PM</td>
                                    <td id="l21_22"></td>
                                    <td id="m21_22"></td>
                                    <td id="mi21_22"></td>
                                    <td id="j21_22"></td>
                                    <td id="v21_22"></td>
                                    <td id="s21_22"></td>
                                </tr>
                                <tr>
                                    <td>10:00 PM - 11:00 PM</td>
                                    <td id="l22_23"></td>
                                    <td id="m22_23"></td>
                                    <td id="mi22_23"></td>
                                    <td id="j22_23"></td>
                                    <td id="v22_23"></td>
                                    <td id="s22_23"></td>
                                </tr>
                                <tr>
                                    <td>11:00 PM - 12:00 PM</td>
                                    <td id="l23_24"></td>
                                    <td id="m23_24"></td>
                                    <td id="mi23_24"></td>
                                    <td id="j23_24"></td>
                                    <td id="v23_24"></td>
                                    <td id="s23_24"></td>
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
                arrayhorario : [],
            }
        },
        methods : {
            mostrarMiHorario(id,rol){
                let me=this;
                var url= '/persona/miHorario?id='+id +'&rol='+rol;;
                axios.get(url).then(function (response) {
                    me.arraytodo=[];
                    var respuesta= response.data;
                    me.arrayhorario = respuesta.tbl_persona;
                    me.arrayhorario.forEach(a => {
                        
                        let d = '';
                        switch (a.hor_dia) {
                            case 1:
                                d = 'l';
                                break;
                            case 2:
                                d = 'm';
                                break;
                            case 3:
                                d = 'mi';
                                break;
                            case 4:
                                d = 'j';
                                break;
                            case 5:
                                d = 'v';
                                break;
                            case 6:
                                d = 's';
                                break;
                        }
                        for (let i = 6; i < 24; i++) {
                            if (i >= Number(a.hor_hora_inicio) && i < Number(a.hor_hora_fin)) {
                                console.log('#'+d+i+'_'+(i+1));
                                $('#'+d+i+'_'+(i+1)).css('background-color','#'+a.color);
                                $('#'+d+i+'_'+(i+1)).html('<center>'+a.nombre1+'<br>'+a.nombre2+'</center>');
                            }      
                        }
                    }); 
                })
                .catch(function (error) {
                    console.log(error);
                });
            }
        },
        mounted() {
            this.mostrarMiHorario($('#id').val(),$('#rol').val());
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
