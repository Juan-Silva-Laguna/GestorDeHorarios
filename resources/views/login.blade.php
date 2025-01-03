<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Sistema de horarios de sena">
    <meta name="author" content="Incanatoit.com">
    <meta name="keyword" content="Sistema de horarios Sena R.Huila">
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
    <div class="container" id="app">
        <h2 class="TitleIngresar">Ingresar</h2>
        <div class="row" style="background: #E6E6E6;">
            <!--<div class="alert alert-danger col-md-12"></div>-->
                <div class="col-md-4 mx-auto">
                
                <br>
                <form class="FrmIngresar" method="POST" action="{{route('validar')}}">
                {{ csrf_field() }}
                    <div class="form-group">                    
                        <label><span>*</span> Tipo de Identificación</label>
                        <select class="form-control" name="tipoDoc" id="tipoDoc">
                            <option value="">-- Seleccionar -- </option>
                            <option value="CC">CC</option>
                            <option value="TI">TI</option>
                            <option value="CE">CE</option>
                            <option value="Otro">Otro</option>
                        </select>
                        <label for=""><span>*</span> Número de Identificación</label>
                        <input type="number" value="{{old('numDoc')}}" name="numDoc" id="numDoc" class="form-control">
                        
                        <label for=""><span>*</span> Tipo de Usuario</label>
                        <select class="form-control" name="tipoUser" id="tipoUser">
                            <option value="" selected>-- Seleccionar -- </option>
                            <option value="2">Aprendiz</option>
                            <option value="3">Instructor</option>
                            <option value="4">Infraestructura</option>
                            <option value="1">Coordinador</option>
                        </select>

                        <label for=""><span>*</span> Contraseña</label>
                        <input type="password" name="clave" id="clave" class="form-control">
                    </div>                 
                    {!!$errors->first('numDoc','<div class="alert alert-danger">:message</div>')!!}            
                    <input type="submit" class="btn btn-warning form-control" style="background: #FD6A00;" value="Ingresar">
                    <p class="text-center">
                        ¿Olvidaste tu Contraseña ? <a href="#">Click aqui para restablecerla.</a>
                    </p>
                </form>
            </div>
        </div>
    </div>
<br>
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
<script src="js/todo.js"></script>
</body>
</html>