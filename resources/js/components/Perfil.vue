<template>
    <main class="main">
        <div class="container-fluid_perfil">
            <!-- Ejemplo de tabla Listado -->
            <div class="card">
                <div class="card-header">
                    <i class="fa fa-align-justify"></i> Mi Perfil
                    <button type="button" @click="abrirModal()" class="btn btn-secondary">
                        <i class="icon-plus"></i>&nbsp;Cambiar Clave
                    </button>
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-6">
                                    <div class="form-group">
                                        <label class=" form-control-label" for="text-input">Tipo de Documento</label>
                                        <div class="">
                                            <select v-model="tipoDocumento"  class="form-control">
                                                <option value=""></option>
                                                <option value="TI">TI</option>
                                                <option value="CC">CC</option>
                                                <option value="CE">CE</option>
                                                <option value="Otro">Otro</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class=" form-control-label" for="text-input">Numero de Documento</label>
                                        <div class="">
                                            <input type="number" v-model="documento" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class=" form-control-label" for="text-input">Nombres</label>
                                        <div class="">
                                            <input type="text" v-model="nombre" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class=" form-control-label" for="text-input">Apellidos</label>
                                        <div class="">
                                            <input type="text" v-model="apellido" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class=" form-control-label" for="text-input">Correo</label>
                                        <div class="">
                                            <input type="text" v-model="email" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class=" form-control-label" for="text-input">Dirección</label>
                                        <div class="">
                                            <input type="text" v-model="direccion" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button @click="actualizarperfil" class="form-control btn btn-info">Actualizar Datos</button>
                                    </div>
                            </div>
                            <div class="col-md-2"></div>
                            <div class="col-md-2">
                                <br><br>
                                <img id="foto" class="img-avatar" width="350" height="350">
                                <form accept-charset="UTF-8" enctype="multipart/form-data">
                                    <input type="hidden" id="fotoAntigua">       
                                    <center><label for="archivoImage" style="border-radius: 10px 10px 10px 10px;background-color: #5EB319;cursor: pointer;padding: 11px 30px !important;text-align: center;color: #fff;width: 220px;">Cambiar Foto:</label>
                                    <input type="file" name="archivoImage" id="archivoImage" max="1" accept=".jpg,.jpeg,.png" style="opacity: 0;position: absolute;" @change="cambiarImagen"></center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fin ejemplo de tabla Listado -->
        </div>
        <!--Inicio del modal agregar/actualizar-->
        <div class="modal fade" tabindex="-1" :class="{'mostrar' : modal}" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog modal-primary modal-lg col-md-6" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Cambiar Clave</h4>
                        <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                            <span aaria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <div class="form-group row">
                                <label class="col-md-3 form-control-label" for="text-input">Clave Nueva</label>
                                <div class="col-md-9">
                                    <input type="password" v-model="clave1" class="form-control">
                                </div><br><br>
                                <label class="col-md-3 form-control-label" for="text-input">Repita Clave Nueva</label>
                                <div class="col-md-9">
                                    <input type="password" v-model="clave2" class="form-control">
                                </div>
                            </div>
                            <div class="form-group row div-error">
                                <div class="text-center text-error">
                                    <div v-for="error in errorMostrarMsjperfil" :key="error" v-text="error"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                        <button type="button" class="btn btn-primary" @click="actualizarclave()">Guardar</button>
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
                id_persona : 0,
                nombre : '',
                apellido : '',
                tipoDocumento : '',
                documento : '',
                email : '',
                direccion : '',
                foto: null,
                clave1: '',
                clave2: '',
                modal : 0,
                claveAnterior : '',
                claveNueva : '',
                errorperfil : 0,
                errorMostrarMsjperfil : []
            }
        },
        methods : {
            mostrarPerfil (id){
                let me=this;
                var url= '/perfil?id=' + id;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    respuesta.tbl_persona.forEach(perfil => {
                        me.nombre = perfil.per_nombre;
                        me.apellido = perfil.per_apellidos;
                        me.tipoDocumento = perfil.per_tipo_identificacion;
                        me.documento = perfil.per_identificacion;
                        me.email = perfil.per_email;
                        me.direccion = perfil.per_direccion;
                        me.id_persona = perfil.id_persona;
                        $('#foto').attr('src',perfil.per_foto);
                        $('#fotoAntigua').val(perfil.per_foto);
                    });
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            cambiarImagen(event){
                var data = new  FormData();
                console.log(this.foto);
                data.append('foto', event.target.files[0]);
                data.append('fotoAntigua', $('#fotoAntigua').val());
                data.append('id_persona', $('#id').val());
                axios.post('/perfil/cambiarFoto',data)
                .then(function (response) {
                    if(response.statusText=="OK"){
                        swal("Muy Bien!", "Has cambiado tu foto con exito!!", "success");
                        $('#foto').attr('src',response.data);
                    }else{
                        swal("Que mal!", "Hubo un erro al cambiar la foto", "error");
                    }
                })
            },
            actualizarclave(){
                if (this.clave1 != '' && this.clave1==this.clave2) {
                    let me=this;
                    axios.put('/perfil/cambiarClave', {
                        'id_persona': $('#id').val(),
                        'clave': me.clave1
                    }).then(function (response) {
                        if(response.statusText=="OK"){
                            swal("Muy Bien!", "Has cambiado la clave  con exito!!", "success");
                        }else{
                            swal("Que mal!", "Hubo un erro al cambiar la clave", "error");
                        }
                        me.cerrarModal();
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
                }else{
                    this.errorMostrarMsjperfil = [];
                    this.errorMostrarMsjperfil.push('No coinciden las contraseñas!');
                }
                
            },
            validate_perfil (){
                this.errorinstructor = 0;
                this.errorMostrarMsjperfil = [];
                if (!this.nombre) this.errorMostrarMsjperfil.push('El nombre del instructor no puede estar vacio');
                if (!this.apellido) this.errorMostrarMsjperfil.push('El apellido del instructor no puede estar vacio');
                if (!this.tipoDocumento) this.errorMostrarMsjperfil.push('El tipo de documento del instructor no puede estar vacio');
                if (!this.documento) this.errorMostrarMsjperfil.push('El documento del instructor no puede estar vacio');
                if (!this.email) this.errorMostrarMsjperfil.push('El correo del instructor no puede estar vacio');
                if (!this.direccion) this.errorMostrarMsjperfil.push('La dirección del instructor no puede estar vacia');
                if (this.errorMostrarMsjperfil.length) this.errorinstructor = 1;

                return this.errorinstructor;
            },
            actualizarperfil (){
                if (this.validate_perfil()) {
                    return;
                }
                let me=this;
                axios.put('/perfil/actualizar', {
                    'id_persona': me.id_persona,
                    'id_instructor': me.id_instructor,
                    'nombre': me.nombre,
                    'apellido': me.apellido,
                    'tipoDocumento': me.tipoDocumento,
                    'documento': me.documento,
                    'email': me.email,
                    'direccion': me.direccion
                }).then(function (response) {
                    swal("Muy Bien!", 'Has actualizado tus datos con exito!!', "success"); 
                    me.cerrarModal();
                })
                .catch(function (error) {
                    console.log(error);
                });
        
            },
            abrirModal(){                                
                this.modal = 1;                   
            },
            cerrarModal (){
                this.modal=0;
            }
        },
        mounted() {
            this.mostrarPerfil($('#id').val());
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
