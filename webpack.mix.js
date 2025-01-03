const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.styles([
    'resources/assets/css/bootstrap.min.css',
    'resources/assets/css/font-awesome.min.css',
    'resources/assets/css/simple-line-icons.min.css',
    'resources/assets/css/style_home.css',
    'resources/assets/css/style.css'
], 'public/css/todo.css')
.scripts([
    'resources/assets/js/jquery.min.js',
    'resources/assets/js/popper.min.js',
    'resources/assets/js/bootstrap.min.js',
    'resources/assets/js/template.js',
    'resources/assets/js/sweetalert2.all.js',   
    'resources/assets/js/xlsx.full.min.js'
], 'public/js/todo.js')
.js(['resources/js/app.js'], 'public/js/app.js');
