<template>
    <main class="main">
        <div class="container-fluid_ambiente">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Reporte por Ambiente
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <input type="text" id="ambiente" autocomplete="off" list="ambientes" class="form-control" @change="pintarTabla()">
                                <datalist id="ambientes">                                         
                                    <option v-for="ambiente in arraydatalist" :key="ambiente.id_ambiente" v-bind:value="ambiente.amb_nombre" v-bind:data-index-number="ambiente.id_ambiente" v-bind:data-value="ambiente.amb_nombre"></option>
                                </datalist>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped table-sm text-center">
                            <thead>
                                <tr>
                                    <th colspan="2" style="width: 20px;"></th>
                                    <th colspan="15" class="text-center">AÑOS</th>
                                </tr>
                                <tr>
                                    <th colspan="2"></th>
                                    <th colspan="3" class="text-center">{{new Date().getFullYear() - 2}}</th>
                                    <th colspan="3" class="text-center">{{new Date().getFullYear() - 1}}</th>
                                    <th colspan="3" class="text-center">{{new Date().getFullYear()}}</th>
                                    <th colspan="3" class="text-center">{{new Date().getFullYear() + 1}}</th>
                                    <th colspan="3" class="text-center">{{new Date().getFullYear() + 2}}</th>
                                </tr>
                                <tr>
                                    <th class="text-center">TRIMESTRE</th>
                                    <th class="text-center">MESES</th>
                                    <th class="text-center">Mañana</th>
                                    <th class="text-center">Tarde</th>
                                    <th class="text-center">Noche</th>
                                    <th class="text-center">Mañana</th>
                                    <th class="text-center">Tarde</th>
                                    <th class="text-center">Noche</th>
                                    <th class="text-center">Mañana</th>
                                    <th class="text-center">Tarde</th>
                                    <th class="text-center">Noche</th>
                                    <th class="text-center">Mañana</th>
                                    <th class="text-center">Tarde</th>
                                    <th class="text-center">Noche</th>
                                    <th class="text-center">Mañana</th>
                                    <th class="text-center">Tarde</th>
                                    <th class="text-center">Noche</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td rowspan="3"><br> T1</td>
                                    <td>Enero</td>
                                    <td id="1-1-mañ"></td>
                                    <td id="1-1-tar"></td>
                                    <td id="1-1-noc"></td>
                                    <td id="1-2-mañ"></td>
                                    <td id="1-2-tar"></td>
                                    <td id="1-2-noc"></td>
                                    <td id="1-3-mañ"></td>
                                    <td id="1-3-tar"></td>
                                    <td id="1-3-noc"></td>
                                    <td id="1-4-mañ"></td>
                                    <td id="1-4-tar"></td>
                                    <td id="1-4-noc"></td>
                                    <td id="1-5-mañ"></td>
                                    <td id="1-5-tar"></td>
                                    <td id="1-5-noc"></td>
                                </tr>
                                <tr>
                                    <td>Febrero</td>
                                    <td id="2-1-mañ"></td>
                                    <td id="2-1-tar"></td>
                                    <td id="2-1-noc"></td>
                                    <td id="2-2-mañ"></td>
                                    <td id="2-2-tar"></td>
                                    <td id="2-2-noc"></td>
                                    <td id="2-3-mañ"></td>
                                    <td id="2-3-tar"></td>
                                    <td id="2-3-noc"></td>
                                    <td id="2-4-mañ"></td>
                                    <td id="2-4-tar"></td>
                                    <td id="2-4-noc"></td>
                                    <td id="2-5-mañ"></td>
                                    <td id="2-5-tar"></td>
                                    <td id="2-5-noc"></td>
                                </tr>
                                <tr>
                                    <td>Marzo</td>
                                    <td id="3-1-mañ"></td>
                                    <td id="3-1-tar"></td>
                                    <td id="3-1-noc"></td>
                                    <td id="3-2-mañ"></td>
                                    <td id="3-2-tar"></td>
                                    <td id="3-2-noc"></td>
                                    <td id="3-3-mañ"></td>
                                    <td id="3-3-tar"></td>
                                    <td id="3-3-noc"></td>
                                    <td id="3-4-mañ"></td>
                                    <td id="3-4-tar"></td>
                                    <td id="3-4-noc"></td>
                                    <td id="3-5-mañ"></td>
                                    <td id="3-5-tar"></td>
                                    <td id="3-5-noc"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3"><br>T2</td>
                                    <td>Abril</td>
                                    <td id="4-1-mañ"></td>
                                    <td id="4-1-tar"></td>
                                    <td id="4-1-noc"></td>
                                    <td id="4-2-mañ"></td>
                                    <td id="4-2-tar"></td>
                                    <td id="4-2-noc"></td>
                                    <td id="4-3-mañ"></td>
                                    <td id="4-3-tar"></td>
                                    <td id="4-3-noc"></td>
                                    <td id="4-4-mañ"></td>
                                    <td id="4-4-tar"></td>
                                    <td id="4-4-noc"></td>
                                    <td id="4-5-mañ"></td>
                                    <td id="4-5-tar"></td>
                                    <td id="4-5-noc"></td>
                                </tr>
                                <tr>
                                    <td>Mayo</td>
                                    <td id="5-1-mañ"></td>
                                    <td id="5-1-tar"></td>
                                    <td id="5-1-noc"></td>
                                    <td id="5-2-mañ"></td>
                                    <td id="5-2-tar"></td>
                                    <td id="5-2-noc"></td>
                                    <td id="5-3-mañ"></td>
                                    <td id="5-3-tar"></td>
                                    <td id="5-3-noc"></td>
                                    <td id="5-4-mañ"></td>
                                    <td id="5-4-tar"></td>
                                    <td id="5-4-noc"></td>
                                    <td id="5-5-mañ"></td>
                                    <td id="5-5-tar"></td>
                                    <td id="5-5-noc"></td>
                                </tr>
                                <tr>
                                    <td>Junio</td>
                                    <td id="6-1-mañ"></td>
                                    <td id="6-1-tar"></td>
                                    <td id="6-1-noc"></td>
                                    <td id="6-2-mañ"></td>
                                    <td id="6-2-tar"></td>
                                    <td id="6-2-noc"></td>
                                    <td id="6-3-mañ"></td>
                                    <td id="6-3-tar"></td>
                                    <td id="6-3-noc"></td>
                                    <td id="6-4-mañ"></td>
                                    <td id="6-4-tar"></td>
                                    <td id="6-4-noc"></td>
                                    <td id="6-5-mañ"></td>
                                    <td id="6-5-tar"></td>
                                    <td id="6-5-noc"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3"><br>T3</td>
                                    <td>Julio</td>
                                    <td id="7-1-mañ"></td>
                                    <td id="7-1-tar"></td>
                                    <td id="7-1-noc"></td>
                                    <td id="7-2-mañ"></td>
                                    <td id="7-2-tar"></td>
                                    <td id="7-2-noc"></td>
                                    <td id="7-3-mañ"></td>
                                    <td id="7-3-tar"></td>
                                    <td id="7-3-noc"></td>
                                    <td id="7-4-mañ"></td>
                                    <td id="7-4-tar"></td>
                                    <td id="7-4-noc"></td>
                                    <td id="7-5-mañ"></td>
                                    <td id="7-5-tar"></td>
                                    <td id="7-5-noc"></td>
                                </tr>
                                <tr>
                                    <td>Agosto</td>
                                    <td id="8-1-mañ"></td>
                                    <td id="8-1-tar"></td>
                                    <td id="8-1-noc"></td>
                                    <td id="8-2-mañ"></td>
                                    <td id="8-2-tar"></td>
                                    <td id="8-2-noc"></td>
                                    <td id="8-3-mañ"></td>
                                    <td id="8-3-tar"></td>
                                    <td id="8-3-noc"></td>
                                    <td id="8-4-mañ"></td>
                                    <td id="8-4-tar"></td>
                                    <td id="8-4-noc"></td>
                                    <td id="8-5-mañ"></td>
                                    <td id="8-5-tar"></td>
                                    <td id="8-5-noc"></td>
                                </tr>
                                <tr>
                                    <td>Septiembre</td>
                                    <td id="9-1-mañ"></td>
                                    <td id="9-1-tar"></td>
                                    <td id="9-1-noc"></td>
                                    <td id="9-2-mañ"></td>
                                    <td id="9-2-tar"></td>
                                    <td id="9-2-noc"></td>
                                    <td id="9-3-mañ"></td>
                                    <td id="9-3-tar"></td>
                                    <td id="9-3-noc"></td>
                                    <td id="9-4-mañ"></td>
                                    <td id="9-4-tar"></td>
                                    <td id="9-4-noc"></td>
                                    <td id="9-5-mañ"></td>
                                    <td id="9-5-tar"></td>
                                    <td id="9-5-noc"></td>
                                </tr>
                                <tr>
                                    <td rowspan="3"><br>T4</td>
                                    <td>Octubre</td>
                                    <td id="10-1-mañ"></td>
                                    <td id="10-1-tar"></td>
                                    <td id="10-1-noc"></td>
                                    <td id="10-2-mañ"></td>
                                    <td id="10-2-tar"></td>
                                    <td id="10-2-noc"></td>
                                    <td id="10-3-mañ"></td>
                                    <td id="10-3-tar"></td>
                                    <td id="10-3-noc"></td>
                                    <td id="10-4-mañ"></td>
                                    <td id="10-4-tar"></td>
                                    <td id="10-4-noc"></td>
                                    <td id="10-5-mañ"></td>
                                    <td id="10-5-tar"></td>
                                    <td id="10-5-noc"></td>
                                </tr>
                                <tr>
                                    <td>Noviembre</td>
                                    <td id="11-1-mañ"></td>
                                    <td id="11-1-tar"></td>
                                    <td id="11-1-noc"></td>
                                    <td id="11-2-mañ"></td>
                                    <td id="11-2-tar"></td>
                                    <td id="11-2-noc"></td>
                                    <td id="11-3-mañ"></td>
                                    <td id="11-3-tar"></td>
                                    <td id="11-3-noc"></td>
                                    <td id="11-4-mañ"></td>
                                    <td id="11-4-tar"></td>
                                    <td id="11-4-noc"></td>
                                    <td id="11-5-mañ"></td>
                                    <td id="11-5-tar"></td>
                                    <td id="11-5-noc"></td>
                                </tr>
                                <tr>
                                    <td>Diciembre</td>
                                    <td id="12-1-mañ"></td>
                                    <td id="12-1-tar"></td>
                                    <td id="12-1-noc"></td>
                                    <td id="12-2-mañ"></td>
                                    <td id="12-2-tar"></td>
                                    <td id="12-2-noc"></td>
                                    <td id="12-3-mañ"></td>
                                    <td id="12-3-tar"></td>
                                    <td id="12-3-noc"></td>
                                    <td id="12-4-mañ"></td>
                                    <td id="12-4-tar"></td>
                                    <td id="12-4-noc"></td>
                                    <td id="12-5-mañ"></td>
                                    <td id="12-5-tar"></td>
                                    <td id="12-5-noc"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Fin ejemplo de tabla Listado -->
        </div>
    </main>
</template>

<script>
    export default {
        name: 'reporteAmbiente',
        data (){
            return{
                arraydatalist: [],
                arrayAmbientet: []
            }
        },
        methods : {
            dataListAmbiente(){     
                let me=this;
                var url= '/ambiente/dataListAmbiente';
                axios.get(url).then(function (response) {
                    console.log(response);
                    var respuesta= response.data;          
                    me.arraydatalist = respuesta.tbl_ambiente;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            pintarTabla(){
                let me  = this;
                me.limpiarTabla();
                let idAmbiente = $('#ambientes [value="' + $('#ambiente').val() + '"]').data('indexNumber');
                var url= '/reporteAmbiente?buscar='+idAmbiente;
                axios.get(url).then(function (response) {
                    response.data.tbl_ambiente.forEach(value => {
                        var fechaIni = value.fic_fecha_inicio.split('-');
                        var fechaFin = value.fic_fecha_fin_lectiva.split('-');
                        var y = new Date().getFullYear();
                        var año = 0;
                        switch (Number(fechaIni[0])) {
                            case y-2:
                                año=1;
                                break;
                            case y-1:
                                año=2;
                                break;
                            case y:
                                año=3;
                                break;
                            case y+1:
                                año=4;
                                break;
                            case y+2:
                                año=5;
                                break;
                        }

                        var fechaTot = Number(fechaFin[0])-Number(fechaIni[0]);

                        var jornada = '';
                        var horIni = Number(value.fic_hora_ini);
                        var horFin = Number(value.fic_hora_fin);
                        if (horIni>=6 && horFin<=12) {
                            jornada = 'mañ';
                        }else if (horIni>=12 && horFin<=18) {
                            jornada = 'tar';
                        }else if (horIni>=18 && horFin<=24) {
                            jornada = 'noc';
                        }

                        if (fechaTot==0) {
                            for (let i = Number(fechaIni[1]); i <= Number(fechaFin[1]); i++) {                            
                                $('#'+i+'-'+año+'-'+jornada).css('background-color','#'+value.fic_color);
                                $('#'+i+'-'+año+'-'+jornada).html(value.id_ficha);
                            }
                        }

                        if (fechaTot==1) {
                            for (let i = Number(fechaIni[1]); i <= 12; i++) {                            
                                $('#'+i+'-'+año+'-'+jornada).css('background-color','#'+value.fic_color);
                                $('#'+i+'-'+año+'-'+jornada).html(value.id_ficha);
                                if (i==12) {
                                    año++;
                                    for (let j = 1; j <= Number(fechaFin[1]); j++) {
                                        $('#'+j+'-'+año+'-'+jornada).css('background-color','#'+value.fic_color);
                                        $('#'+j+'-'+año+'-'+jornada).html(value.id_ficha);                               
                                    }
                                }
                            }
                        }

                        if (fechaTot==2) {
                            for (let i = Number(fechaIni[1]); i <= 12; i++) {                            
                                $('#'+i+'-'+año+'-'+jornada).css('background-color','#'+value.fic_color);
                                $('#'+i+'-'+año+'-'+jornada).html(value.id_ficha);
                                if (i==12) {
                                    año++;
                                    for (let j = 1; j <= 12; j++) {
                                        $('#'+j+'-'+año+'-'+jornada).css('background-color','#'+value.fic_color);
                                        $('#'+j+'-'+año+'-'+jornada).html(value.id_ficha); 
                                        if (j==12) {
                                            año++;
                                            for (let x = 1; x <= Number(fechaFin[1]); x++) {
                                                $('#'+x+'-'+año+'-'+jornada).css('background-color','#'+value.fic_color);
                                                $('#'+x+'-'+año+'-'+jornada).html(value.id_ficha);                                 
                                            }
                                        }                                 
                                    }
                                }
                            }
                        }
                    });
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            limpiarTabla(){
                for (let a = 1; a <= 5; a++) {
                    for (let m = 1; m <= 12; m++) {
                        $('#'+m+'-'+a+'-'+'mañ').css('background-color','transparent');
                        $('#'+m+'-'+a+'-'+'mañ').html('');
                            $('#'+m+'-'+a+'-'+'tar').css('background-color','transparent');
                        $('#'+m+'-'+a+'-'+'tar').html('');
                            $('#'+m+'-'+a+'-'+'noc').css('background-color','transparent');
                        $('#'+m+'-'+a+'-'+'noc').html('');
                    }
                }
            }
        },
        mounted() {
            this.dataListAmbiente();          
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
