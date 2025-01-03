<template>
    <main class="main" v-bind:style="this.espacio">
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Fichas 
                    <button type="button" @click="abrirModal('ficha', 'registrar')" class="btn btn-secondary">
                        <i class="icon-plus"></i>&nbsp;Nuevo
                    </button>
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <select class="form-control col-md-3" v-model="criterio">
                                    <option value="tbl_ficha.id_ficha">Codigo de Programa</option>
                                    <option value="tbl_programa.pro_nombre">Nombre del programa</option>
                                </select>
                                <input type="text" v-model="buscar" @keyup.enter="listarficha(1,buscar,criterio)" class="form-control" placeholder="Ingrese dato a buscar">
                                <button type="submit" @click="listarficha(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive-sm">
                        <table class="table table-bordered table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Código de Ficha</th>
                                    <th>Programa</th>
                                    <th>Fecha Inicio</th>
                                    <th>Fecha Fin Lectiva</th>
                                    <th>Fecha Fin Practica </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="ficha in arrayFicha" :key="ficha.id_ficha"  v-bind:class="ficha.fic_estado==1 ? `alert alert-warning` :ficha.fic_estado==2 ? `alert alert-danger` : ``">
                                    <td>
                                        <button type="button" @click="abrirModal('ficha', 'actualizar', ficha)" class="btn btn-warning btn-sm"  v-if="ficha.fic_estado==0">
                                            <i class="icon-pencil"></i>
                                        </button> &nbsp;  
                                        <button type="button" @click="eliminarFicha(ficha.id_ficha)" class="btn btn-danger btn-sm"  v-if="ficha.fic_estado==2">
                                            <i class="icon-trash"></i>
                                        </button> &nbsp;                              
                                    </td>
                                    <td v-text="ficha.id_ficha"></td>
                                    <td v-text="ficha.pro_nombre"></td>
                                    <td v-text="ficha.fic_fecha_inicio"></td>
                                    <td v-text="ficha.fic_fecha_fin_lectiva"></td>
                                    <td v-text="ficha.fic_fecha_fin_practica"></td>                                    
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
        <div class="modal fade" tabindex="-1" :class="{'mostrar' : modal}" role="dialog" aria-labelledby="myModalLabel" style="display: none; overflow-y: scroll;" aria-hidden="true">
            <div class="modal-dialog modal-primary modal-lg " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" v-text="tituloModal"></h4>
                        <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                            <span aaria-hidden="true">×</span>
                        </button>
                    </div>
                    <div  class="modal-body" v-if="opcion==1">
                        <center>
                            <img src="Images/gif-logo.gif" alt="gif">
                            <h3>Cargando...</h3>
                        </center>
                    </div>
                    <div class="modal-body" v-if="opcion==0">
                        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Código de ficha</label>
                                <div class="col-md-9">
                                    <input type="number" v-model="id_ficha" class="form-control" :disabled="tipoAccion==2" placeholder="Codigo de la nueva ficha">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="email-input">Programa</label>
                                <div class="col-md-9">
                                    <input type="text" v-model="programa" list="todos" id="todo" :disabled="tipoAccion==2" @click="llenarDataList()" class="form-control" placeholder="Identifique el programa para esta ficha">
                                    <datalist id="todos">
                                        <option v-for="programa in arrayPrograma" :key="programa.id_programa" v-bind:value="programa.pro_nombre" v-bind:data-index-number="programa.id_programa" v-bind:data-value="programa.pro_tipo"></option>
                                    </datalist>                                    
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Fecha Inicio</label>
                                <div class="col-md-9">
                                    <input type="date" v-model="fecha_ini" class="form-control" placeholder="id_ficha de categoría" @change="calcularFechaFin()">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Fecha Final Lectiva</label>
                                <div class="col-md-9">
                                    <input type="date" id="lec" v-model="fecha_fin_lec" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Fecha Final Practica</label>
                                <div class="col-md-9">
                                    <input type="date" id="prac" v-model="fecha_fin_prac" class="form-control" placeholder="id_ficha de categoría">
                                </div>
                            </div>
                            <div class="form-group row">
                               <label class="col-md-3 form-control-label" for="text-input">Adjuntar Archivo de aprendices</label>
                                <div class="col-md-9">
                                    <input type="file" class="form-control" id="excel" :disabled="tipoAccion==2" @change="cargarAprendices" accept=".xlsx">
                                    El formato a adjuntar debe ser la siguiente plantilla <a href="archivo/plantilla aprendices.xlsx"> clic aqui </a>
                                </div>
                            </div>
                            <div v-if="planeacion">
                                <div class="text-center"><h5>Planeación Horario</h5></div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Hora Inicial</label>
                                    <div class="col-md-9">
                                        <input type="time" v-model="hora_inicio" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Hora Final</label>
                                    <div class="col-md-9">
                                        <input type="time" v-model="hora_final" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Ambiente</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="ambiente" id="ambiente" list="ambientes" class="form-control">
                                        <datalist id="ambientes">                                         
                                            <option v-for="ambiente in arrayAmbientes" :key="ambiente.id_ambiente" v-bind:value="ambiente.amb_nombre" v-bind:data-index-number="ambiente.id_ambiente"></option>
                                        </datalist>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive-sm">
                                <table class="table table-bordered table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th>Nombres</th>
                                            <th>Apellidos</th>
                                            <th>Tipo Identicación</th>
                                            <th>Identicación</th>
                                            <th>Correo</th>
                                            <th>Dirección</th>
                                        </tr>
                                    </thead>
                                    <tbody v-if="tipoAccion==1">
                                        <tr v-for="aprendiz in arrayAprendices" :key="aprendiz['Numero Identidad']">
                                            <td v-text="aprendiz['Nombres']"></td>
                                            <td v-text="aprendiz['Apellidos']"></td>
                                            <td v-text="aprendiz['Tipo Identificación']"></td>
                                            <td v-text="aprendiz['Numero Identidad']"></td> 
                                            <td v-text="aprendiz['Correo']"></td>    
                                            <td v-text="aprendiz['Dirección']"></td>                                    
                                        </tr>
                                    </tbody>
                                    <tbody v-if="tipoAccion==2">
                                        <tr v-for="aprendiz in arrayAprendices" :key="aprendiz['Numero Identidad']">
                                            <td v-text="aprendiz['per_nombre']"></td>
                                            <td v-text="aprendiz['per_apellidos']"></td>
                                            <td v-text="aprendiz['per_tipo_identificacion']"></td>
                                            <td v-text="aprendiz['per_identificacion']"></td>  
                                            <td v-text="aprendiz['per_email']"></td>    
                                            <td v-text="aprendiz['per_direccion']"></td>                                      
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div v-show="errorFicha" class="form-group row div-error">
                                <div class="text-center text-error">
                                    <div v-for="error in errorMostrarMsjFicha" :key="error" v-text="error"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                        <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarficha()">Guardar</button>
                        <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarficha()">Actualizar</button>
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
        name: 'Ficha',
        props: ['id'],
        data (){
            return{
                id_ficha : 0,
                fecha_ini : '',
                fecha_fin_lec : '',
                fecha_fin_prac : '',
                hora_inicio : '',
                hora_final:'',
                programa : '',
                ambiente : '',
                planeacion : '',
                arrayFicha : [],
                arrayPrograma : [],
                arrayAmbientes: [],
                arrayAprendices : [],
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorFicha : 0,
                errorMostrarMsjFicha : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'tbl_ficha.id_ficha',
                buscar : '',
                opcion: 0,
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
            eliminarFicha(id){
                swal({
                title: 'Si acepta se eliminaran completamente todos los datos de la ficha!',
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
                        let me=this;
                        axios.put('/ficha/eliminar', {
                            'id': id
                        }).then(function (response) { 
                            me.listarficha(1,'','tbl_ficha.id_ficha');
                            if (response.data[0]) {
                                swal(
                                'Muy Bien!',
                                response.data[1],
                                'success'
                                )
                            }
                            else{
                                swal(
                                'Erro :(',
                                response.data[1],
                                'error'
                                )
                            }
                        })
                        .catch(function (error) {
                            console.log(error);
                        });
                    } else if (
                        result.dismiss === swal.DismissReason.cancel
                    ) {
                    }
                }) 

            },
            dataListAmbiente(){     
                let me=this;
                var url= '/ambiente/dataListAmbiente';
                axios.get(url).then(function (response) {
                    console.log(response);
                    var respuesta= response.data;          
                    me.arrayAmbientes = respuesta.tbl_ambiente;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            listarficha (page,buscar,criterio){
                let me=this;
                var url= '/ficha?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayFicha = respuesta.tbl_ficha.data;
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
                me.listarficha(page,buscar,criterio);
            },
            registrarficha (){
                
                if (this.validate_ficha()) {
                    return;
                }

                this.opcion = 1;
                let todo = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,'A', 'B', 'C', 'D', 'E', 'F']
                let color = '';
                for (let i = 0; i < 6; i++) {
                let j =Math.round(Math.random()*15);;
                    color += todo[j];
                }

                let me=this;
                let arrHI=this.hora_inicio.split(':');
                let arrHF=this.hora_final.split(':');
                axios.post('/ficha/registrar', {
                    'id_ficha': this.id_ficha,
                    'programa': $('#todos [value="' + $('#todo').val() + '"]').data('indexNumber'),
                    'fecha_ini': this.fecha_ini,
                    'fecha_fin_lec': this.fecha_fin_lec,
                    'fecha_fin_prac': this.fecha_fin_prac,
                    'hora_inicio': arrHI[0],
                    'hora_final': arrHF[0],
                    'ambiente': $('#ambientes [value="' + $('#ambiente').val() + '"]').data('indexNumber'),
                    'arrayAprendices': this.arrayAprendices,
                    'color': color
                }).then(function (response) { 
                    if(response.statusText=="OK"){
                        swal("Muy Bien!", "Has registrado la ficha con exito!!", "success");
                    }else{
                        swal("Que mal!", "Hubo un erro al registrar la ficha", "error");
                    }
                    me.opcion = 0;
                    me.cerrarModal();
                    me.listarficha(1,'','id_ficha');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            validate_ficha (){
                this.errorFicha = 0;
                this.errorMostrarMsjFicha = [];

                if (!this.id_ficha) this.errorMostrarMsjFicha.push('El código de la ficha no puede estar vacio');
                if (!this.programa) this.errorMostrarMsjFicha.push('Escriba y seleccione un programa');
                if (!this.fecha_ini) this.errorMostrarMsjFicha.push('Fecha inicial obligatoria');
                if (!this.fecha_fin_lec) this.errorMostrarMsjFicha.push('Fecha final lectiva obligatoria');
                if (!this.fecha_fin_prac) this.errorMostrarMsjFicha.push('Fecha final practica obligatoria');
                if (!this.arrayAprendices.length > 0) this.errorMostrarMsjFicha.push('Por favor seleccione un archivo');
                if (this.errorMostrarMsjFicha.length) this.errorFicha = 1;

                return this.errorFicha;
            },
            llenarDataList(){     
                let me=this;
                var url= '/dataListPrograma';
                axios.get(url).then(function (response) {
                    var respuesta= response.data;                
                    me.arrayPrograma = respuesta.tbl_programa;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            calcularFechaFin(){ 
                let me=this;
                let lectiva=0,practica=182;
                switch ($('#todos [value="' + $('#todo').val() + '"]').data('value')) {
                    case 'Tecnologo':
                        lectiva = 547;                      
                        break;
                    case 'Tecnico':
                        lectiva = 365;                   
                        break;
                    case 'Curso':
                        lectiva = 30;  
                        practica=30;                     
                        break;
                    default:
                        return;
                        break;
                }
                let arrayFecha = me.fecha_ini.split("-");
                var TuFecha = new Date(arrayFecha[1]+"/"+arrayFecha[2]+"/"+arrayFecha[0]);
                
                TuFecha.setDate(TuFecha.getDate() + lectiva);
                me.fecha_fin_lec = TuFecha.getFullYear() + '-' +(TuFecha.getMonth() + 1) + '-' + TuFecha.getDate();
                let arraLec = me.fecha_fin_lec.split("-");
                let l = arraLec[0];
                for (let i = 1; i < arraLec.length; i++) {
                    if (arraLec[i].length==1) {
                        l += "-"+0+arraLec[i];                   
                    }else{
                        l += "-"+arraLec[i];
                    }
                }
                me.fecha_fin_lec = l;

                TuFecha.setDate(TuFecha.getDate() + practica);
                me.fecha_fin_prac = TuFecha.getFullYear() + '-' +(TuFecha.getMonth() + 1) + '-' + TuFecha.getDate();
                let arraPrac = me.fecha_fin_prac.split("-");
                let p = arraPrac[0];
                for (let i = 1; i < arraPrac.length; i++) {
                    if (arraPrac[i].length==1) {
                        p += "-"+0+arraPrac[i];                   
                    }else{
                        p += "-"+arraPrac[i];
                    }
                }
                me.fecha_fin_prac = p;
                //console.log($('#todos [value="' + $('#todo').val() + '"]').data('indexNumber'));

            },
            cargarAprendices(event){
                let me=this;
                let url = URL.createObjectURL(event.target.files[0]);
                let oReq = new XMLHttpRequest();
                oReq.open("GET", url, true);
                oReq.responseType = "arraybuffer";

                oReq.onload = function(e) {
                    let arraybuffer = oReq.response;

                    /* convert data to binary string */
                    let data = new Uint8Array(arraybuffer);
                    let arr = new Array();
                    for(let i = 0; i != data.length; ++i) arr[i] = String.fromCharCode(data[i]);
                    let bstr = arr.join("");

                    /* Call XLSX */
                    let workbook = XLSX.read(bstr, {type:"binary"});

                    /* DO SOMETHING WITH workbook HERE */
                    let first_sheet_name = workbook.SheetNames[0];
                    /* Get worksheet */
                    let worksheet = workbook.Sheets[first_sheet_name];
                    let objeto = XLSX.utils.sheet_to_json(worksheet,{raw:true});
                    
                    me.arrayAprendices = objeto;
                }
                oReq.send();

            },
            actualizarficha (){
                if (this.validate_ficha()) {
                    return;
                }

                let me=this;
                axios.put('/ficha/actualizar', {
                    'id_ficha': this.id_ficha,
                    'fecha_ini': this.fecha_ini,
                    'fecha_fin_lec': this.fecha_fin_lec,
                    'fecha_fin_prac': this.fecha_fin_prac
                }).then(function (response) {
                    if(response.statusText=="OK"){
                        swal("Muy Bien!", "Has actualizado la ficha con exito!!", "success");
                    }else{
                        swal("Que mal!", "Hubo un erro al actualizar la ficha", "error");
                    }
                    me.cerrarModal();
                    me.listarficha(1,'','id_ficha');
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            abrirModal(modelo, accion, data = []){
                switch (modelo) {
                    case 'ficha':
                    {
                        this.arrayAprendices = [];
                        switch (accion) {
                            case 'registrar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Registar ficha';
                                this.id_ficha = '';
                                this.tipo = '';
                                this.tipoAccion = 1;
                                this.planeacion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                this.modal = 1;
                                this.tipoAccion = 2;
                                this.tituloModal = 'Actualizar ficha';
                                this.id_ficha = data.id_ficha;
                                this.programa = data.pro_nombre;
                                this.planeacion = 0;
                                this.fecha_ini = data.fic_fecha_inicio;
                                this.fecha_fin_lec = data.fic_fecha_fin_lectiva;
                                this.fecha_fin_prac = data.fic_fecha_fin_practica;
                                let me=this;
                                axios.get('/ficha/mostrarAprendices?ficha=' + data.id_ficha ).then(function (response) {
                                    me.arrayAprendices = response.data.aprendices;
                                })
                                .catch(function (error) {
                                    console.log(error);
                                });                               
                            }
                        }
                    }
                }
            },
            cerrarModal (){
                this.modal=0;
                this.tituloModal = '';
                this.id_ficha = '';
                this.tipo = '';
            }
        },
        mounted() {
            this.dataListAmbiente(); 
            if (this.id == undefined) {
                this.listarficha(1,this.buscar,this.criterio);
            }
            else{
                this.listarficha(1,this.id,this.criterio);
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
