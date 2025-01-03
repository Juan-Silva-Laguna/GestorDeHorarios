<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Sistema Ventas Laravel Vue Js- IncanatoIT">
    <meta name="author" content="Incanatoit.com">
    <meta name="keyword" content="Sistema ventas Laravel Vue Js, Sistema compras Laravel Vue Js">
    <link rel="shortcut icon" href="../Accessories/img/favicon.png">
    <title>Schedule Sena</title>
  
    <link href="css/todo.css" rel="stylesheet">
</head>

<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
<div id="app">
    <header class="app-header navbar">
        <button class="navbar-toggler mobile-sidebar-toggler d-lg-none mr-auto" type="button">
          <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#"></a>
        <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button">
          <span class="navbar-toggler-icon"></span>
        </button>
        <ul class="nav navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <input type="hidden" id="id" value="{{Auth::user()->id_persona}}">
                <input type="hidden" id="rol" value="{{Auth::user()->per_rol}}">
                <a class="nav-link" style="color: #000; font-size: 120%;" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    <i class="fa fa-lock"></i> Cerrar sesión
                </a>
                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    {{ csrf_field() }}
                </form>
                <a @click="menu=11" class="nav-link"  style="color: #000; font-size: 100%;">
                    <img src="{{Auth::user()->per_foto}}" class="img-avatar">
                    <span class="d-md-down-none">{{Auth::user()->per_nombre}}  </span>
                </a>
                
            </li>
        </ul>
    </header>

    <div class="app-body">
        <!-- Contenido Principal -->
      
        @if(Auth::check())
            @if (Auth::user()->per_rol == 1)
                @include('sidebar.contenidocoordinador')
                <template v-if="menu==0">
                    <inicio></inicio>
                </template>

                <template v-if="menu==1">
                    <Ficha></Ficha>
                </template>

                <template v-if="menu==2">
                    <Ambiente></Ambiente>
                </template>

                <template v-if="menu==3">
                    <Instructor></Instructor>
                </template>

                <template v-if="menu==4">
                    <Programa></Programa>
                </template>
                <template v-if="menu==12">
                    <Infraestructura></Infraestructura>
                </template>
                <template v-if="menu==14">
                    <mantenimiento></mantenimiento>
                </template>
                <template v-if="menu==13">
                    <Mensajes></Mensajes>
                </template>
                <template v-if="menu==5">
                    <Horario></Horario>
                </template>
                <template v-if="menu==11">
                    <Perfil></Perfil>
                </template>
                <template v-if="menu==16">
                    <diponibilidad-ambiente></diponibilidad-ambiente>
                </template>                
                <template v-if="menu==17">
                    <reporte-ambiente></reporte-ambiente>
                </template>
            @elseif (Auth::user()->per_rol == 3)
                @include('sidebar.contenidoinstructor')
                <template v-if="menu==6">
                    <misfichas></misfichas>
                </template>
                <template v-if="menu==8">
                    <misambientes></misambientes>
                </template>
                <template v-if="menu==0">
                    <mihorario></mihorario>
                </template>
                <template v-if="menu==11">
                    <Perfil></Perfil>
                </template>
            @elseif (Auth::user()->per_rol == 2)
                @include('sidebar.contenidoaprendiz')
                <template v-if="menu==7">
                    <misinstructores></misinstructores>
                </template>
                <template v-if="menu==8">
                    <misambientes></misambientes>
                </template>
                <template v-if="menu==0">
                    <mihorario></mihorario>
                </template>
                <template v-if="menu==11">
                    <Perfil></Perfil>
                </template>
            @elseif (Auth::user()->per_rol == 4)
                @include('sidebar.contenidoinfraestructura')
                <template v-if="menu==0">
                    <ActivarAmbiente :id="{{Auth::user()->id_persona}}"></ActivarAmbiente>
                </template>
                <template v-if="menu==1">
                    <mantenimiento></mantenimiento>
                </template>
                <template v-if="menu==11">
                    <Perfil></Perfil>
                </template>
            @else

            @endif

        @endif
        <!-- Contenido Principal -->
        @yield('componentes')
 
        
        <!-- /Fin del contenido principal -->
    </div>
</div>
    <script src="js/app.js"></script>
    <script src="js/todo.js"></script>
    <script>
        
        $('.nav-link').on('click', function (e) {
            e.preventDefault();
            for (let i = 0; i < 15; i++) {
                if (i == $(this).attr('id')) {
                    $(this).attr('style','background-color: rgba(0, 0, 0, 0.2)');
                }else{
                    $('#'+i).attr('style','background: transparent');
                }
            }
        })
        
    </script>
</body>

</html>