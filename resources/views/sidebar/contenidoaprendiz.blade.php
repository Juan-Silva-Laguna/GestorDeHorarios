<div class="sidebar">
    <nav class="sidebar-nav">
        <ul class="nav">
            <li  @click="menu=0"  class="nav-item nav-dropdown">
                <a class="nav-link" id="0" href="#"><i class="icon-event" ></i>Mi Horario</a>
            </li>
            <li  @click="menu=7" class="nav-item nav-dropdown">
                <a class="nav-link" href="#"><i class="icon-bag" ></i>Mis Instructores</a>
            </li>
            <li  @click="menu=8" class="nav-item nav-dropdown">
                <a class="nav-link" href="#"><i class="icon-home" ></i>Mis Ambientes</a>
            </li>            
            <li class="nav-item">
                <a class="nav-link" href="archivo/Manual de aprendiz.pdf"  target="_blank"><i class="icon-info"></i> Ayuda <span class="badge badge-danger">PDF</span></a>
                <a class="nav-link" href="#" onclick="window.open('archivo/Manual de aprendiz.pdf', 'Manual de aprendiz')"><i class="icon-info"></i> Ayuda <span class="badge badge-danger">PDF</span></a>
            </li>
        </ul>
    </nav>
    <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>