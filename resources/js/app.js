/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('programa', require('./components/Programa.vue').default);
Vue.component('ficha', require('./components/Ficha.vue').default);
Vue.component('ambiente', require('./components/Ambiente.vue').default);
Vue.component('instructor', require('./components/Instructor.vue').default);
Vue.component('horario', require('./components/Horario.vue').default);
Vue.component('activarambiente', require('./components/Activarambiente.vue').default);
Vue.component('perfil', require('./components/Perfil.vue').default);
Vue.component('misfichas', require('./components/MisFichas.vue').default);
Vue.component('misambientes', require('./components/MisAmbientes.vue').default);
Vue.component('mihorario', require('./components/MiHorario.vue').default);
Vue.component('misinstructores', require('./components/MisInstructores.vue').default);
Vue.component('infraestructura', require('./components/infraestructura.vue').default);
Vue.component('mensajes', require('./components/Mensajes.vue').default);
Vue.component('inicio', require('./components/Inicio.vue').default);
Vue.component('mantenimiento', require('./components/Mantenimiento.vue').default);
Vue.component('diponibilidad-ambiente', require('./components/DiponibilidadAmbiente.vue').default);
Vue.component('reporte-ambiente', require('./components/ReporteAmbiente.vue').default);
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    data :{
        menu : 0
    }
});
