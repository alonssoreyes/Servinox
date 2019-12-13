
<?php
ob_start();
//Cargar los modelos de forma manual
//require_once'controllers/usuario.php';

//Crear sesiones
session_start();

//Autoload
require_once'autoload.php';
//Helpers
require_once'helpers/utilidades.php';
//Requerir parametros y constantes
require_once'config/parameters.php';
//Conexion a la base de datos
require_once'config/database.php';

//Layout VISTA
require_once'views/layout/header.php';

//Funcion mostrar error en caso de que no exista la pagina
function mostrar_error(){
    $error = new errorController;
    $error->index();
}

//Comprobar si existe por GET el controlador
if (isset($_GET['controller'])) {
    $nombreControlador = $_GET['controller'] . 'Controller';
} else if (!isset($_GET['controller']) && !isset($_GET['action'])) {
    $nombreControlador = defaultController;
} else {
    mostrar_error();
}
if (class_exists($nombreControlador)) {
    //Crea la instancia del objetvo
    $controlador = new $nombreControlador();
    //Verifica si existe el metodo  por la variable GET action 
    if (isset($_GET['action']) && method_exists($controlador, $_GET['action'])) {
        $action = $_GET['action'];
        $controlador->$action();
    } else if (!isset($_GET['controller']) && !isset($_GET['action'])) {
        $default = defaultAction;
        $controlador->$default();
    } else {
        mostrar_error();
    }
} else {
    mostrar_error();
}

require_once 'views/layout/footer.php';

ob_end_flush();
