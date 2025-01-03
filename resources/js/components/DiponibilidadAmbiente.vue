<template>
    <main class="main">
        <div class="container-fluid">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Disponibilidad Ambiente
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <input type="text" id="ambiente" autocomplete="off" list="ambientes" class="form-control" @change="pintarTabla()">
                                <datalist id="ambientes">                                         
                                    <option v-for="ambiente in arraydatalist" :key="ambiente.id_ambiente" v-bind:value="ambiente.amb_nombre" v-bind:data-index-number="ambiente.id_ambiente"  v-bind:data-value="ambiente.amb_nombre"></option>
                                </datalist>
                            </div>
                        </div>
                        <div class="col-md-6 row">
                            <div class="col-md-10"></div>
                            <div class="col-md-2"><button type="button" class="btn btn-primary" @click="limpiar()">Limpiar</button>     </div>
                          
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-striped table-sm text-center">
                            <thead>
                                <tr>
                                    <th rowspan="2" class="text-center">Meses</th>
                                    <th colspan="3" class="text-center" id="amb-1"></th>
                                    <th colspan="3" class="text-center" id="amb-2"></th>
                                    <th colspan="3" class="text-center" id="amb-3"></th>
                                    <th colspan="3" class="text-center" id="amb-4"></th>
                                    <th colspan="3" class="text-center" id="amb-5"></th>
                                    <th colspan="3" class="text-center" id="amb-6"></th>
                                    <th colspan="3" class="text-center" id="amb-7"></th>
                                    <th colspan="3" class="text-center" id="amb-8"></th>
                                    <th colspan="3" class="text-center" id="amb-9"></th>
                                    <th colspan="3" class="text-center" id="amb-10"></th>
                                </tr>
                                <tr>
                                    <th class="text-center" >M</th>
                                    <th class="text-center" >T</th>
                                    <th class="text-center" >N</th>
                                    <th class="text-center" >M</th>
                                    <th class="text-center" >T</th>
                                    <th class="text-center" >N</th>
                                    <th class="text-center" >M</th>
                                    <th class="text-center" >T</th>
                                    <th class="text-center" >N</th>
                                    <th class="text-center" >M</th>
                                    <th class="text-center" >T</th>
                                    <th class="text-center" >N</th>
                                    <th class="text-center" >M</th>
                                    <th class="text-center" >T</th>
                                    <th class="text-center" >N</th>
                                    <th class="text-center" >M</th>
                                    <th class="text-center" >T</th>
                                    <th class="text-center" >N</th>
                                    <th class="text-center" >M</th>
                                    <th class="text-center" >T</th>
                                    <th class="text-center" >N</th>
                                    <th class="text-center" >M</th>
                                    <th class="text-center" >T</th>
                                    <th class="text-center" >N</th>
                                    <th class="text-center" >M</th>
                                    <th class="text-center" >T</th>
                                    <th class="text-center" >N</th>
                                    <th class="text-center" >M</th>
                                    <th class="text-center" >T</th>
                                    <th class="text-center" >N</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>                                    
                                    <td>Enero</td>
                                    <td id="amb1-1-mañ" @click="info($event)"></td>
                                    <td id="amb1-1-tar" @click="info($event)"></td>
                                    <td id="amb1-1-noc" @click="info($event)"></td>
                                    <td id="amb2-1-mañ" @click="info($event)"></td>
                                    <td id="amb2-1-tar" @click="info($event)"></td>
                                    <td id="amb2-1-noc" @click="info($event)"></td>
                                    <td id="amb3-1-mañ" @click="info($event)"></td>
                                    <td id="amb3-1-tar" @click="info($event)"></td>
                                    <td id="amb3-1-noc" @click="info($event)"></td>
                                    <td id="amb4-1-mañ" @click="info($event)"></td>
                                    <td id="amb4-1-tar" @click="info($event)"></td>
                                    <td id="amb4-1-noc" @click="info($event)"></td>
                                    <td id="amb5-1-mañ" @click="info($event)"></td>
                                    <td id="amb5-1-tar" @click="info($event)"></td>
                                    <td id="amb5-1-noc" @click="info($event)"></td>
                                    <td id="amb6-1-mañ" @click="info($event)"></td>
                                    <td id="amb6-1-tar" @click="info($event)"></td>
                                    <td id="amb6-1-noc" @click="info($event)"></td>
                                    <td id="amb7-1-mañ" @click="info($event)"></td>
                                    <td id="amb7-1-tar" @click="info($event)"></td>
                                    <td id="amb7-1-noc" @click="info($event)"></td>
                                    <td id="amb8-1-mañ" @click="info($event)"></td>
                                    <td id="amb8-1-tar" @click="info($event)"></td>
                                    <td id="amb8-1-noc" @click="info($event)"></td>
                                    <td id="amb9-1-mañ" @click="info($event)"></td>
                                    <td id="amb9-1-tar" @click="info($event)"></td>
                                    <td id="amb9-1-noc" @click="info($event)"></td>
                                    <td id="amb10-1-mañ" @click="info($event)"></td>
                                    <td id="amb10-1-tar" @click="info($event)"></td>
                                    <td id="amb10-1-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <td>Febrero</td>
                                    <td id="amb1-2-mañ" @click="info($event)"></td>
                                    <td id="amb1-2-tar" @click="info($event)"></td>
                                    <td id="amb1-2-noc" @click="info($event)"></td>
                                    <td id="amb2-2-mañ" @click="info($event)"></td>
                                    <td id="amb2-2-tar" @click="info($event)"></td>
                                    <td id="amb2-2-noc" @click="info($event)"></td>
                                    <td id="amb3-2-mañ" @click="info($event)"></td>
                                    <td id="amb3-2-tar" @click="info($event)"></td>
                                    <td id="amb3-2-noc" @click="info($event)"></td>
                                    <td id="amb4-2-mañ" @click="info($event)"></td>
                                    <td id="amb4-2-tar" @click="info($event)"></td>
                                    <td id="amb4-2-noc" @click="info($event)"></td>
                                    <td id="amb5-2-mañ" @click="info($event)"></td>
                                    <td id="amb5-2-tar" @click="info($event)"></td>
                                    <td id="amb5-2-noc" @click="info($event)"></td>
                                    <td id="amb6-2-mañ" @click="info($event)"></td>
                                    <td id="amb6-2-tar" @click="info($event)"></td>
                                    <td id="amb6-2-noc" @click="info($event)"></td>
                                    <td id="amb7-2-mañ" @click="info($event)"></td>
                                    <td id="amb7-2-tar" @click="info($event)"></td>
                                    <td id="amb7-2-noc" @click="info($event)"></td>
                                    <td id="amb8-2-mañ" @click="info($event)"></td>
                                    <td id="amb8-2-tar" @click="info($event)"></td>
                                    <td id="amb8-2-noc" @click="info($event)"></td>
                                    <td id="amb9-2-mañ" @click="info($event)"></td>
                                    <td id="amb9-2-tar" @click="info($event)"></td>
                                    <td id="amb9-2-noc" @click="info($event)"></td>
                                    <td id="amb10-2-mañ" @click="info($event)"></td>
                                    <td id="amb10-2-tar" @click="info($event)"></td>
                                    <td id="amb10-2-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <td>Marzo</td>
                                    <td id="amb1-3-mañ" @click="info($event)"></td>
                                    <td id="amb1-3-tar" @click="info($event)"></td>
                                    <td id="amb1-3-noc" @click="info($event)"></td>
                                    <td id="amb2-3-mañ" @click="info($event)"></td>
                                    <td id="amb2-3-tar" @click="info($event)"></td>
                                    <td id="amb2-3-noc" @click="info($event)"></td>
                                    <td id="amb3-3-mañ" @click="info($event)"></td>
                                    <td id="amb3-3-tar" @click="info($event)"></td>
                                    <td id="amb3-3-noc" @click="info($event)"></td>
                                    <td id="amb4-3-mañ" @click="info($event)"></td>
                                    <td id="amb4-3-tar" @click="info($event)"></td>
                                    <td id="amb4-3-noc" @click="info($event)"></td>
                                    <td id="amb5-3-mañ" @click="info($event)"></td>
                                    <td id="amb5-3-tar" @click="info($event)"></td>
                                    <td id="amb5-3-noc" @click="info($event)"></td>
                                    <td id="amb6-3-mañ" @click="info($event)"></td>
                                    <td id="amb6-3-tar" @click="info($event)"></td>
                                    <td id="amb6-3-noc" @click="info($event)"></td>
                                    <td id="amb7-3-mañ" @click="info($event)"></td>
                                    <td id="amb7-3-tar" @click="info($event)"></td>
                                    <td id="amb7-3-noc" @click="info($event)"></td>
                                    <td id="amb8-3-mañ" @click="info($event)"></td>
                                    <td id="amb8-3-tar" @click="info($event)"></td>
                                    <td id="amb8-3-noc" @click="info($event)"></td>
                                    <td id="amb9-3-mañ" @click="info($event)"></td>
                                    <td id="amb9-3-tar" @click="info($event)"></td>
                                    <td id="amb9-3-noc" @click="info($event)"></td>
                                    <td id="amb10-3-mañ" @click="info($event)"></td>
                                    <td id="amb10-3-tar" @click="info($event)"></td>
                                    <td id="amb10-3-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <td>Abril</td>
                                    <td id="amb1-4-mañ" @click="info($event)"></td>
                                    <td id="amb1-4-tar" @click="info($event)"></td>
                                    <td id="amb1-4-noc" @click="info($event)"></td>
                                    <td id="amb2-4-mañ" @click="info($event)"></td>
                                    <td id="amb2-4-tar" @click="info($event)"></td>
                                    <td id="amb2-4-noc" @click="info($event)"></td>
                                    <td id="amb3-4-mañ" @click="info($event)"></td>
                                    <td id="amb3-4-tar" @click="info($event)"></td>
                                    <td id="amb3-4-noc" @click="info($event)"></td>
                                    <td id="amb4-4-mañ" @click="info($event)"></td>
                                    <td id="amb4-4-tar" @click="info($event)"></td>
                                    <td id="amb4-4-noc" @click="info($event)"></td>
                                    <td id="amb5-4-mañ" @click="info($event)"></td>
                                    <td id="amb5-4-tar" @click="info($event)"></td>
                                    <td id="amb5-4-noc" @click="info($event)"></td>
                                    <td id="amb6-4-mañ" @click="info($event)"></td>
                                    <td id="amb6-4-tar" @click="info($event)"></td>
                                    <td id="amb6-4-noc" @click="info($event)"></td>
                                    <td id="amb7-4-mañ" @click="info($event)"></td>
                                    <td id="amb7-4-tar" @click="info($event)"></td>
                                    <td id="amb7-4-noc" @click="info($event)"></td>
                                    <td id="amb8-4-mañ" @click="info($event)"></td>
                                    <td id="amb8-4-tar" @click="info($event)"></td>
                                    <td id="amb8-4-noc" @click="info($event)"></td>
                                    <td id="amb9-4-mañ" @click="info($event)"></td>
                                    <td id="amb9-4-tar" @click="info($event)"></td>
                                    <td id="amb9-4-noc" @click="info($event)"></td>
                                    <td id="amb10-4-mañ" @click="info($event)"></td>
                                    <td id="amb10-4-tar" @click="info($event)"></td>
                                    <td id="amb10-4-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <td>Mayo</td>
                                    <td id="amb1-5-mañ" @click="info($event)"></td>
                                    <td id="amb1-5-tar" @click="info($event)"></td>
                                    <td id="amb1-5-noc" @click="info($event)"></td>
                                    <td id="amb2-5-mañ" @click="info($event)"></td>
                                    <td id="amb2-5-tar" @click="info($event)"></td>
                                    <td id="amb2-5-noc" @click="info($event)"></td>
                                    <td id="amb3-5-mañ" @click="info($event)"></td>
                                    <td id="amb3-5-tar" @click="info($event)"></td>
                                    <td id="amb3-5-noc" @click="info($event)"></td>
                                    <td id="amb4-5-mañ" @click="info($event)"></td>
                                    <td id="amb4-5-tar" @click="info($event)"></td>
                                    <td id="amb4-5-noc" @click="info($event)"></td>
                                    <td id="amb5-5-mañ" @click="info($event)"></td>
                                    <td id="amb5-5-tar" @click="info($event)"></td>
                                    <td id="amb5-5-noc" @click="info($event)"></td>
                                    <td id="amb6-5-mañ" @click="info($event)"></td>
                                    <td id="amb6-5-tar" @click="info($event)"></td>
                                    <td id="amb6-5-noc" @click="info($event)"></td>
                                    <td id="amb7-5-mañ" @click="info($event)"></td>
                                    <td id="amb7-5-tar" @click="info($event)"></td>
                                    <td id="amb7-5-noc" @click="info($event)"></td>
                                    <td id="amb8-5-mañ" @click="info($event)"></td>
                                    <td id="amb8-5-tar" @click="info($event)"></td>
                                    <td id="amb8-5-noc" @click="info($event)"></td>
                                    <td id="amb9-5-mañ" @click="info($event)"></td>
                                    <td id="amb9-5-tar" @click="info($event)"></td>
                                    <td id="amb9-5-noc" @click="info($event)"></td>
                                    <td id="amb10-5-mañ" @click="info($event)"></td>
                                    <td id="amb10-5-tar" @click="info($event)"></td>
                                    <td id="amb10-5-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <td>Junio</td>
                                    <td id="amb1-6-mañ" @click="info($event)"></td>
                                    <td id="amb1-6-tar" @click="info($event)"></td>
                                    <td id="amb1-6-noc" @click="info($event)"></td>
                                    <td id="amb2-6-mañ" @click="info($event)"></td>
                                    <td id="amb2-6-tar" @click="info($event)"></td>
                                    <td id="amb2-6-noc" @click="info($event)"></td>
                                    <td id="amb3-6-mañ" @click="info($event)"></td>
                                    <td id="amb3-6-tar" @click="info($event)"></td>
                                    <td id="amb3-6-noc" @click="info($event)"></td>
                                    <td id="amb4-6-mañ" @click="info($event)"></td>
                                    <td id="amb4-6-tar" @click="info($event)"></td>
                                    <td id="amb4-6-noc" @click="info($event)"></td>
                                    <td id="amb5-6-mañ" @click="info($event)"></td>
                                    <td id="amb5-6-tar" @click="info($event)"></td>
                                    <td id="amb5-6-noc" @click="info($event)"></td>
                                    <td id="amb6-6-mañ" @click="info($event)"></td>
                                    <td id="amb6-6-tar" @click="info($event)"></td>
                                    <td id="amb6-6-noc" @click="info($event)"></td>
                                    <td id="amb7-6-mañ" @click="info($event)"></td>
                                    <td id="amb7-6-tar" @click="info($event)"></td>
                                    <td id="amb7-6-noc" @click="info($event)"></td>
                                    <td id="amb8-6-mañ" @click="info($event)"></td>
                                    <td id="amb8-6-tar" @click="info($event)"></td>
                                    <td id="amb8-6-noc" @click="info($event)"></td>
                                    <td id="amb9-6-mañ" @click="info($event)"></td>
                                    <td id="amb9-6-tar" @click="info($event)"></td>
                                    <td id="amb9-6-noc" @click="info($event)"></td>
                                    <td id="amb10-6-mañ" @click="info($event)"></td>
                                    <td id="amb10-6-tar" @click="info($event)"></td>
                                    <td id="amb10-6-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <td>Julio</td>
                                    <td id="amb1-7-mañ" @click="info($event)"></td>
                                    <td id="amb1-7-tar" @click="info($event)"></td>
                                    <td id="amb1-7-noc" @click="info($event)"></td>
                                    <td id="amb2-7-mañ" @click="info($event)"></td>
                                    <td id="amb2-7-tar" @click="info($event)"></td>
                                    <td id="amb2-7-noc" @click="info($event)"></td>
                                    <td id="amb3-7-mañ" @click="info($event)"></td>
                                    <td id="amb3-7-tar" @click="info($event)"></td>
                                    <td id="amb3-7-noc" @click="info($event)"></td>
                                    <td id="amb4-7-mañ" @click="info($event)"></td>
                                    <td id="amb4-7-tar" @click="info($event)"></td>
                                    <td id="amb4-7-noc" @click="info($event)"></td>
                                    <td id="amb5-7-mañ" @click="info($event)"></td>
                                    <td id="amb5-7-tar" @click="info($event)"></td>
                                    <td id="amb5-7-noc" @click="info($event)"></td>
                                    <td id="amb6-7-mañ" @click="info($event)"></td>
                                    <td id="amb6-7-tar" @click="info($event)"></td>
                                    <td id="amb6-7-noc" @click="info($event)"></td>
                                    <td id="amb7-7-mañ" @click="info($event)"></td>
                                    <td id="amb7-7-tar" @click="info($event)"></td>
                                    <td id="amb7-7-noc" @click="info($event)"></td>
                                    <td id="amb8-7-mañ" @click="info($event)"></td>
                                    <td id="amb8-7-tar" @click="info($event)"></td>
                                    <td id="amb8-7-noc" @click="info($event)"></td>
                                    <td id="amb9-7-mañ" @click="info($event)"></td>
                                    <td id="amb9-7-tar" @click="info($event)"></td>
                                    <td id="amb9-7-noc" @click="info($event)"></td>
                                    <td id="amb10-7-mañ" @click="info($event)"></td>
                                    <td id="amb10-7-tar" @click="info($event)"></td>
                                    <td id="amb10-7-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <td>Agosto</td>
                                    <td id="amb1-8-mañ" @click="info($event)"></td>
                                    <td id="amb1-8-tar" @click="info($event)"></td>
                                    <td id="amb1-8-noc" @click="info($event)"></td>
                                    <td id="amb2-8-mañ" @click="info($event)"></td>
                                    <td id="amb2-8-tar" @click="info($event)"></td>
                                    <td id="amb2-8-noc" @click="info($event)"></td>
                                    <td id="amb3-8-mañ" @click="info($event)"></td>
                                    <td id="amb3-8-tar" @click="info($event)"></td>
                                    <td id="amb3-8-noc" @click="info($event)"></td>
                                    <td id="amb4-8-mañ" @click="info($event)"></td>
                                    <td id="amb4-8-tar" @click="info($event)"></td>
                                    <td id="amb4-8-noc" @click="info($event)"></td>
                                    <td id="amb5-8-mañ" @click="info($event)"></td>
                                    <td id="amb5-8-tar" @click="info($event)"></td>
                                    <td id="amb5-8-noc" @click="info($event)"></td>
                                    <td id="amb6-8-mañ" @click="info($event)"></td>
                                    <td id="amb6-8-tar" @click="info($event)"></td>
                                    <td id="amb6-8-noc" @click="info($event)"></td>
                                    <td id="amb7-8-mañ" @click="info($event)"></td>
                                    <td id="amb7-8-tar" @click="info($event)"></td>
                                    <td id="amb7-8-noc" @click="info($event)"></td>
                                    <td id="amb8-8-mañ" @click="info($event)"></td>
                                    <td id="amb8-8-tar" @click="info($event)"></td>
                                    <td id="amb8-8-noc" @click="info($event)"></td>
                                    <td id="amb9-8-mañ" @click="info($event)"></td>
                                    <td id="amb9-8-tar" @click="info($event)"></td>
                                    <td id="amb9-8-noc" @click="info($event)"></td>
                                    <td id="amb10-8-mañ" @click="info($event)"></td>
                                    <td id="amb10-8-tar" @click="info($event)"></td>
                                    <td id="amb10-8-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <td>Septiembre</td>
                                    <td id="amb1-9-mañ" @click="info($event)"></td>
                                    <td id="amb1-9-tar" @click="info($event)"></td>
                                    <td id="amb1-9-noc" @click="info($event)"></td>
                                    <td id="amb2-9-mañ" @click="info($event)"></td>
                                    <td id="amb2-9-tar" @click="info($event)"></td>
                                    <td id="amb2-9-noc" @click="info($event)"></td>
                                    <td id="amb3-9-mañ" @click="info($event)"></td>
                                    <td id="amb3-9-tar" @click="info($event)"></td>
                                    <td id="amb3-9-noc" @click="info($event)"></td>
                                    <td id="amb4-9-mañ" @click="info($event)"></td>
                                    <td id="amb4-9-tar" @click="info($event)"></td>
                                    <td id="amb4-9-noc" @click="info($event)"></td>
                                    <td id="amb5-9-mañ" @click="info($event)"></td>
                                    <td id="amb5-9-tar" @click="info($event)"></td>
                                    <td id="amb5-9-noc" @click="info($event)"></td>
                                    <td id="amb6-9-mañ" @click="info($event)"></td>
                                    <td id="amb6-9-tar" @click="info($event)"></td>
                                    <td id="amb6-9-noc" @click="info($event)"></td>
                                    <td id="amb7-9-mañ" @click="info($event)"></td>
                                    <td id="amb7-9-tar" @click="info($event)"></td>
                                    <td id="amb7-9-noc" @click="info($event)"></td>
                                    <td id="amb8-9-mañ" @click="info($event)"></td>
                                    <td id="amb8-9-tar" @click="info($event)"></td>
                                    <td id="amb8-9-noc" @click="info($event)"></td>
                                    <td id="amb9-9-mañ" @click="info($event)"></td>
                                    <td id="amb9-9-tar" @click="info($event)"></td>
                                    <td id="amb9-9-noc" @click="info($event)"></td>
                                    <td id="amb10-9-mañ" @click="info($event)"></td>
                                    <td id="amb10-9-tar" @click="info($event)"></td>
                                    <td id="amb10-9-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <td>Octubre</td>
                                    <td id="amb1-10-mañ" @click="info($event)"></td>
                                    <td id="amb1-10-tar" @click="info($event)"></td>
                                    <td id="amb1-10-noc" @click="info($event)"></td>
                                    <td id="amb2-10-mañ" @click="info($event)"></td>
                                    <td id="amb2-10-tar" @click="info($event)"></td>
                                    <td id="amb2-10-noc" @click="info($event)"></td>
                                    <td id="amb3-10-mañ" @click="info($event)"></td>
                                    <td id="amb3-10-tar" @click="info($event)"></td>
                                    <td id="amb3-10-noc" @click="info($event)"></td>
                                    <td id="amb4-10-mañ" @click="info($event)"></td>
                                    <td id="amb4-10-tar" @click="info($event)"></td>
                                    <td id="amb4-10-noc" @click="info($event)"></td>
                                    <td id="amb5-10-mañ" @click="info($event)"></td>
                                    <td id="amb5-10-tar" @click="info($event)"></td>
                                    <td id="amb5-10-noc" @click="info($event)"></td>
                                    <td id="amb6-10-mañ" @click="info($event)"></td>
                                    <td id="amb6-10-tar" @click="info($event)"></td>
                                    <td id="amb6-10-noc" @click="info($event)"></td>
                                    <td id="amb7-10-mañ" @click="info($event)"></td>
                                    <td id="amb7-10-tar" @click="info($event)"></td>
                                    <td id="amb7-10-noc" @click="info($event)"></td>
                                    <td id="amb8-10-mañ" @click="info($event)"></td>
                                    <td id="amb8-10-tar" @click="info($event)"></td>
                                    <td id="amb8-10-noc" @click="info($event)"></td>
                                    <td id="amb9-10-mañ" @click="info($event)"></td>
                                    <td id="amb9-10-tar" @click="info($event)"></td>
                                    <td id="amb9-10-noc" @click="info($event)"></td>
                                    <td id="amb10-10-mañ" @click="info($event)"></td>
                                    <td id="amb10-10-tar" @click="info($event)"></td>
                                    <td id="amb10-10-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <td>Noviembre</td>
                                    <td id="amb1-11-mañ" @click="info($event)"></td>
                                    <td id="amb1-11-tar" @click="info($event)"></td>
                                    <td id="amb1-11-noc" @click="info($event)"></td>
                                    <td id="amb2-11-mañ" @click="info($event)"></td>
                                    <td id="amb2-11-tar" @click="info($event)"></td>
                                    <td id="amb2-11-noc" @click="info($event)"></td>
                                    <td id="amb3-11-mañ" @click="info($event)"></td>
                                    <td id="amb3-11-tar" @click="info($event)"></td>
                                    <td id="amb3-11-noc" @click="info($event)"></td>
                                    <td id="amb4-11-mañ" @click="info($event)"></td>
                                    <td id="amb4-11-tar" @click="info($event)"></td>
                                    <td id="amb4-11-noc" @click="info($event)"></td>
                                    <td id="amb5-11-mañ" @click="info($event)"></td>
                                    <td id="amb5-11-tar" @click="info($event)"></td>
                                    <td id="amb5-11-noc" @click="info($event)"></td>
                                    <td id="amb6-11-mañ" @click="info($event)"></td>
                                    <td id="amb6-11-tar" @click="info($event)"></td>
                                    <td id="amb6-11-noc" @click="info($event)"></td>
                                    <td id="amb7-11-mañ" @click="info($event)"></td>
                                    <td id="amb7-11-tar" @click="info($event)"></td>
                                    <td id="amb7-11-noc" @click="info($event)"></td>
                                    <td id="amb8-11-mañ" @click="info($event)"></td>
                                    <td id="amb8-11-tar" @click="info($event)"></td>
                                    <td id="amb8-11-noc" @click="info($event)"></td>
                                    <td id="amb9-11-mañ" @click="info($event)"></td>
                                    <td id="amb9-11-tar" @click="info($event)"></td>
                                    <td id="amb9-11-noc" @click="info($event)"></td>
                                    <td id="amb10-11-mañ" @click="info($event)"></td>
                                    <td id="amb10-11-tar" @click="info($event)"></td>
                                    <td id="amb10-11-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <td>Diciembre</td>
                                    <td id="amb1-12-mañ" @click="info($event)"></td>
                                    <td id="amb1-12-tar" @click="info($event)"></td>
                                    <td id="amb1-12-noc" @click="info($event)"></td>
                                    <td id="amb2-12-mañ" @click="info($event)"></td>
                                    <td id="amb2-12-tar" @click="info($event)"></td>
                                    <td id="amb2-12-noc" @click="info($event)"></td>
                                    <td id="amb3-12-mañ" @click="info($event)"></td>
                                    <td id="amb3-12-tar" @click="info($event)"></td>
                                    <td id="amb3-12-noc" @click="info($event)"></td>
                                    <td id="amb4-12-mañ" @click="info($event)"></td>
                                    <td id="amb4-12-tar" @click="info($event)"></td>
                                    <td id="amb4-12-noc" @click="info($event)"></td>
                                    <td id="amb5-12-mañ" @click="info($event)"></td>
                                    <td id="amb5-12-tar" @click="info($event)"></td>
                                    <td id="amb5-12-noc" @click="info($event)"></td>
                                    <td id="amb6-12-mañ" @click="info($event)"></td>
                                    <td id="amb6-12-tar" @click="info($event)"></td>
                                    <td id="amb6-12-noc" @click="info($event)"></td>
                                    <td id="amb7-12-mañ" @click="info($event)"></td>
                                    <td id="amb7-12-tar" @click="info($event)"></td>
                                    <td id="amb7-12-noc" @click="info($event)"></td>
                                    <td id="amb8-12-mañ" @click="info($event)"></td>
                                    <td id="amb8-12-tar" @click="info($event)"></td>
                                    <td id="amb8-12-noc" @click="info($event)"></td>
                                    <td id="amb9-12-mañ" @click="info($event)"></td>
                                    <td id="amb9-12-tar" @click="info($event)"></td>
                                    <td id="amb9-12-noc" @click="info($event)"></td>
                                    <td id="amb10-12-mañ" @click="info($event)"></td>
                                    <td id="amb10-12-tar" @click="info($event)"></td>
                                    <td id="amb10-12-noc" @click="info($event)"></td>
                                </tr>
                                <tr>
                                    <th>ESTADO</th>
                                    <th id="amb1-mañ"></th>
                                    <th id="amb1-tar"></th>
                                    <th id="amb1-noc"></th>
                                    <th id="amb2-mañ"></th>
                                    <th id="amb2-tar"></th>
                                    <th id="amb2-noc"></th>
                                    <th id="amb3-mañ"></th>
                                    <th id="amb3-tar"></th>
                                    <th id="amb3-noc"></th>
                                    <th id="amb4-mañ"></th>
                                    <th id="amb4-tar"></th>
                                    <th id="amb4-noc"></th>
                                    <th id="amb5-mañ"></th>
                                    <th id="amb5-tar"></th>
                                    <th id="amb5-noc"></th>
                                    <td id="amb6-mañ"></td>
                                    <td id="amb6-tar"></td>
                                    <td id="amb6-noc"></td>
                                    <td id="amb7-mañ"></td>
                                    <td id="amb7-tar"></td>
                                    <td id="amb7-noc"></td>
                                    <td id="amb8-mañ"></td>
                                    <td id="amb8-tar"></td>
                                    <td id="amb8-noc"></td>
                                    <td id="amb9-mañ"></td>
                                    <td id="amb9-tar"></td>
                                    <td id="amb9-noc"></td>
                                    <td id="amb10-mañ"></td>
                                    <td id="amb10-tar"></td>
                                    <td id="amb10-noc"></td>
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
                arrayAmbiente: []
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
            exportar (){
                window.print();
            },
            pintarTabla(){
                let me  = this;
                me.limpiarTabla();
                let idAmbiente = $('#ambientes [value="' + $('#ambiente').val() + '"]').data('indexNumber');
                var url= '/reporteAmbiente?buscar='+idAmbiente;                
                axios.get(url).then(function (response) {
                    console.log(response.data.tbl_ambiente);
                    if (response.data.tbl_ambiente.length!=0) {
                        me.arrayAmbiente.push(response.data.tbl_ambiente);
                    }                   
                    
                    for (let h = 0; h < me.arrayAmbiente.length; h++) {
                        me.arrayAmbiente[h].forEach(value => {
                            $('#amb-'+(h+1)).html(value.amb_nombre);
                            var fechaIni = value.fic_fecha_inicio.split('-');
                            var fechaFin = value.fic_fecha_fin_lectiva.split('-');
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
                            
                            let trimestre = '';
                            if (Number(fechaIni[1])>=1 && Number(fechaIni[1])<=3) {
                                trimestre="T1";
                            }else if (Number(fechaIni[1])>=4 && Number(fechaIni[1])<=6) {
                                trimestre="T2";
                            }
                            else if (Number(fechaIni[1])>=7 && Number(fechaIni[1])<=9) {
                                trimestre="T3";
                            }
                            else if (Number(fechaIni[1])>=10 && Number(fechaIni[1])<=12) {
                                trimestre="T4";
                            }

                            var y = new Date().getFullYear();

                            if (Number(fechaIni[0])<=y && Number(fechaFin[0])>=y) {
                                if (Number(fechaIni[0])==y && Number(fechaFin[0])==y) {
                                    for (let i = Number(fechaIni[1]); i <= Number(fechaFin[1]); i++) {                            
                                        $('#amb'+(h+1)+'-'+i+'-'+jornada).css('background-color','#'+value.fic_color);
                                        $('#amb'+(h+1)+'-'+i+'-'+jornada).html(`<input type="hidden" value="${fechaIni[0]}&%$#${trimestre}&%$#${value.id_ficha}">`);
                                    }
                                    $('#amb'+(h+1)+'-'+jornada).html("-");
                                } 

                                if (Number(fechaFin[0])==y) {
                                    for (let i = 1; i <= Number(fechaFin[1]); i++) {                            
                                        $('#amb'+(h+1)+'-'+i+'-'+jornada).css('background-color','#'+value.fic_color);
                                        $('#amb'+(h+1)+'-'+i+'-'+jornada).html(`<input type="hidden" value="${fechaIni[0]}&%$#${trimestre}&%$#${value.id_ficha}">`);
                                    }
                                    $('#amb'+(h+1)+'-'+jornada).html("-");
                                } 
                                
                                if (Number(fechaIni[0])==y || Number(fechaFin[0])>y) {
                                    let ar = Array.from(fechaFin[0]);
                                    for (let i = 1; i <= 12; i++) {                            
                                        $('#amb'+(h+1)+'-'+i+'-'+jornada).css('background-color','#'+value.fic_color);
                                        $('#amb'+(h+1)+'-'+i+'-'+jornada).html(`<input type="hidden" value="${fechaIni[0]}&%$#${trimestre}&%$#${value.id_ficha}">`);
                                    }
                                    $('#amb'+(h+1)+'-'+jornada).html(fechaFin[1]+'/'+ar[2]+ar[3]);
                                }  
                            }
                        });
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });
                $('#ambiente').val('');
            },
            limpiar(){
                this.arrayAmbiente = [];
                this.limpiarTabla();
            },
            limpiarTabla(){
                for (let a = 1; a <= 10; a++) {
                    for (let m = 1; m <= 12; m++) {
                        $('#amb'+a+'-'+m+'-'+'mañ').css('background-color','transparent');
                        $('#amb'+a+'-'+m+'-'+'mañ').html('');
                            $('#amb'+a+'-'+m+'-'+'tar').css('background-color','transparent');
                        $('#amb'+a+'-'+m+'-'+'tar').html('');
                            $('#amb'+a+'-'+m+'-'+'noc').css('background-color','transparent');
                        $('#amb'+a+'-'+m+'-'+'noc').html('');
                    }
                    $('#amb'+a+'-mañ').html("");
                    $('#amb'+a+'-tar').html("");
                    $('#amb'+a+'-noc').html("");
                    $('#amb-'+a).html("");
                }
            },
            info : function(e){
                let cadena = $('#'+e.target.id).find('input').val();
                let array = cadena.split('&%$#');
                swal(
                    `Año: ${array[0]} \n Trimestre: ${array[1]} \n Ficha: ${array[2]}`,
                    '',
                    'success'
                )
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
