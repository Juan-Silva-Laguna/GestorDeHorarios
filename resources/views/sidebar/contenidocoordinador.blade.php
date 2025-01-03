<div class="sidebar">
    <nav class="sidebar-nav">
        <ul class="nav">
            <li @click="menu=0" class="nav-item nav-dropdown">
                <b><a class="nav-link" style="background: #33444c;" href="main.html"><i class="icon-speedometer"></i> Inicio</a></b>                
            </li>
            <li class="nav-title">
                Funciones
            </li>
            <li  @click="menu=1" class="nav-item nav-dropdown">
                <a class="nav-link" id="1" href="#"><i class="icon-bag" ></i> Fichas</a>
            </li>
            <li class="nav-item nav-dropdown">
                <a class="nav-link nav-dropdown-toggle" @click="menu=2" href="#"><i class="icon-home"></i> Ambientes</a>
                <ul class="nav-dropdown-items">
                    <li class="nav-item">
                        <a class="nav-link" @click="menu=16" href="#"><i class="icon-note"></i>Ambientes Disponibles</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" @click="menu=17" href="#"><i class="icon-notebook"></i> Reporte de Ambientes </a>
                    </li>
                </ul>
            </li>
            <li  @click="menu=3" class="nav-item nav-dropdown">
                <a class="nav-link" id="3" href="#"><i class="icon-people" ></i> Instructores</a>
            </li>
            <li  @click="menu=4" class="nav-item nav-dropdown">
                <a class="nav-link" id="4" href="#"><i class="icon-book-open" ></i> Programas</a>
            </li>
            <li  @click="menu=12"  class="nav-item nav-dropdown">
                <a class="nav-link" id="12" href="#"><i class="fa fa-wrench" ></i> Infraestructura</a>
            </li>
            <li  @click="menu=14"  class="nav-item nav-dropdown">
                <a class="nav-link" id="14" href="#"><i class="fa fa-history" ></i> Histórico Mant</a>
            </li>
            <li  @click="menu=13"  class="nav-item nav-dropdown">
                <a class="nav-link" id="13" href="#"><i class="fa fa-envelope-o" ></i> PQR</a>
            </li>
            <li  @click="menu=5" class="nav-item nav-dropdown">
                <a class="nav-link" id="5" href="#"><i class="icon-event" ></i> Horarios</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="window.open('archivo/Manual de Coordinador.pdf', 'Manual de coordinador')"><i class="icon-info"></i> Ayuda <span class="badge badge-danger">PDF</span></a>
            </li>
        </ul>
    </nav>
    <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>
