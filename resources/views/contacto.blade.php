<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Sistema de horarios de sena">
    <meta name="author" content="Incanatoit.com">
    <meta name="keyword" content="Sistema de horarios Sena R.Huila">    
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="shortcut icon" href="Images/logo_sena_naranja.png">
    <title>Sistema de Horarios (Ingresar)</title>
    <link href="css/todo.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light" style="background:#fc7323;">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a href="#"class="Containaer_Logos">
                <img src="Images/logo_sena_y_guidesena.png" width="150" height="60">
            </a>
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="/"><b>Inicio</b></a>
                </li>
                <!--
                <li class="nav-item">
                    <a class="nav-link" href="mapa"><b>Mapa</b></a>
                </li>-->
                <li class="nav-item">
                    <a class="nav-link" href="contacto"><b>Contáctenos</b></a>
                </li>
            </ul>
            <div class="form-inline my-2 my-lg-0">
                <a href="ingresar" class="btn btn-light"><i class="zmdi zmdi-account"></i> INGRESAR</a>
            </div>
        </div>
    </nav>
<!-- Contactenos -->
<br>
<h2 class="TitleIngresar">Contactenos</h2>
<div class="container">
    <br>
    <h4>Llena este Formulario para ponerte en contacto con nosotros.</h4>
    <br>
    <h6 style="color: red">* Campos obligatorios.</h6>
    <div class="row">        
        <div class="col-md-7">
            
                <div class="row">                
                    <div class="form-group col-md-6">
                        <input type="text" class="form-control" id="nombre" placeholder="Nombre completo*" required>
                    </div>
                    <div class="form-group col-md-6">
                        <input type="email" class="form-control" id="correo" placeholder="Correo*" required>
                    </div>
                    <div class="form-group col-md-6">
                        <input type="number" class="form-control" id="celular" placeholder="Télefono*" required>
                    </div>
                    <div class="form-group col-md-6">
                        <input type="text" class="form-control" id="asunto" placeholder="Asunto*" required>
                    </div>
                    <div class="form-group col-md-12">
                        <textarea class="form-control" id="mensaje" cols="52" rows="5" placeholder="Mensaje*" required></textarea>
                    </div>
                    <div class="form-group col-md-12 text-right">
                        <input type="button" class="btn" style="background-color: #fc7323; width: 90px;" onClick="hi()" value="Enviar">
                    </div>
                </div>
            
        </div>
        <div class="col-md-5">
            <center>
                <img src="Images/contactenos-logo.png" width="300" height="250">
            </center>            
        </div>
    </div>
</div>
<br><br><br>
<!-- Footer -->
<footer class="app-footer page-footer font-small pt-4">

  <!-- Footer Links -->
  <div class="container-fluid text-center text-md-left">
    <div class="row text-center">
      <div class="col-md-4">
        <img src="Images/guide_sena_logo_negro.png" width="75" height="55">
      </div>
      <div class="col-md-4">
        <div class="footer-copyright text-center py-2">
            <span><a href="#"class="colorCpoyright">Copyright</a> &copy; 2020</span>
            <span class="ml-auto">Desarrollado por <a href="#" class="colorCpoyright">Aprendices SENA</a></span> 
        </div>
      </div>
      <div class="col-md-4">
        <ul class="list-unstyled">        
            <a target="_blank" href="https://twitter.com/SENAComunica"><i class="icon-social-twitter fa-2x"></i></a>        
            <a target="_blank" href="https://www.facebook.com/SENA"><i class="icon-social-facebook fa-2x"></i></a>
            <a target="_blank" href="https://www.instagram.com/senacomunica/"><i class="icon-social-instagram fa-2x"></i></a>
        </ul>
      </div>
    </div>
  </div>
</footer>
<script type="text/javascript">

    function hi() {
        var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
        let data = {
            nombre: $('#nombre').val(),
            correo: $('#correo').val(),
            celular: $('#celular').val(),
            asunto: $('#asunto').val(),
            mensaje: $('#mensaje').val(),
            _token: CSRF_TOKEN
        }  
        
        $.ajax({
            type: 'POST',
            url: "{{route('contacta')}}",
            data: data,
            dataType: 'JSON',
            success: function (results) {
                if (results.success === true) {
                    swal("Exito!", results.message, "success");
                    $('#nombre').val('');
                    $('#correo').val('');
                    $('#celular').val('');
                    $('#asunto').val('');
                    $('#mensaje').val('');
                } else {
                    swal("Error!", results.message, "error");
                }
            }
        });
    };
</script>
<script src="js/todo.js"></script>
</body>
</html>