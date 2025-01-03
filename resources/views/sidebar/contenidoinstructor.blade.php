<div class="sidebar">
    <nav class="sidebar-nav">
        <ul class="nav">
            <li  @click="menu=0"  class="nav-item nav-dropdown">
                <a class="nav-link" id="0" href="#"><i class="icon-event" ></i>Mi Horario</a>
            </li>
            <li  @click="menu=6" class="nav-item nav-dropdown">
                <a class="nav-link" id="6" href="#"><i class="icon-people" ></i>Mis Fichas</a>
            </li>
            <li  @click="menu=8" class="nav-item nav-dropdown">
                <a class="nav-link" id="8" href="#"><i class="icon-home" ></i>Mis Ambientes</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="#" onclick="window.open('archivo/Manual de instructor.pdf', 'Manual de instructor')"><i class="icon-info"></i> Ayuda <span class="badge badge-danger">PDF</span></a>
            </li>
        </ul>
    </nav>
    <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>