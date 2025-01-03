<div class="sidebar">
    <nav class="sidebar-nav">
        <ul class="nav">
            <li  @click="menu=0" class="nav-item nav-dropdown">
                <a class="nav-link" id="0" href="#"><i class="fa fa-wrench" ></i> Ambientes Inactivos</a>
            </li>
            <li  @click="menu=1" class="nav-item nav-dropdown">
                <a class="nav-link" id="1" href="#"><i class="fa fa-history" ></i>  Historico</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="#" onclick="window.open('archivo/Manual de infraestructura.pdf', 'Manual de infraestructura')"><i class="icon-info"></i> Ayuda <span class="badge badge-danger">PDF</span></a>
            </li>
        </ul>
    </nav>
    <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>