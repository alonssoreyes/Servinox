<?php

require_once 'models/cliente.php';

class clienteController {
    
    //Metodo de prueba
    public function index() {
        echo "Controlador clientes, accion index";
    }
    //Renderiza en la vista el formulario de registro
    public function registro() {
        require_once 'views/cliente/registro.php';
    }
    //Renderiza en la vista en formulario de inicio de sesion
    public function login() {
        require_once 'views/cliente/login.php';
    }
    
    //Metodo para insertar en la base de datos
    public function guardar() {
        if (isset($_POST)) {
            //Validar que ningun campo venga vacio
            $nombre = isset($_POST['name']) ? $_POST['name'] : false;
            $apellidos = isset($_POST['lastname']) ? $_POST['lastname'] : false;
            $email = isset($_POST['email']) ? $_POST['email'] : false;
            $contrasenia = isset($_POST['password']) ? $_POST['password'] : false;

            if ($nombre && $apellidos && $email && $contrasenia) {
                $cliente = new Cliente();
                $cliente->setNombre($nombre);
                $cliente->setApellidos($apellidos);
                $cliente->setEmail($email);

                //Encriptar la contraseña
                $hash = password_hash($contrasenia, PASSWORD_BCRYPT, ['cost' => 11]);

                $cliente->setPassword($hash);
                $guardar = $cliente->guardar();
                if ($guardar) {
                    $_SESSION['registro'] = "Registro completado";
                } else {
                    $_SESSION['fallo'] = "Registro fallido";
                }
            }else{
                $_SESSION['fallo'] = "Registro fallido";
            }
        } else {
            $_SESSION['fallo'] = "Registro fallido";
        }
        header('location:' . root . 'cliente/registro');
    }
    
    //Metodo para el inicio de sesion
    public function entrar(){
        if(isset($_POST)){
            $email = $_POST['email'] ? $_POST['email'] : false;
            $password = $_POST['password'] ? $_POST['password'] : false;
            //Valida que no vengan datos vacios
            if($email && $password){
                $cliente = new Cliente();
                $cliente->setEmail($email);
                $cliente->setPassword($password);
                
                $entrar = $cliente->entrar();
                //Si los datos pasados son correctos, redireccion
                if($entrar){
                    $_SESSION['login'] = $entrar;
                    header('location:'.root);
                }else{
                    $_SESSION['fallo']= "Email o contraseña incorrectos";
                    header('location:'.root.'cliente/login');
                }
            }else{
                header('location:'.root.'cliente/login');
            }
        }
    }
    //Retorna la vista de los datos del cliente en sesion
    public function datos(){
        require_once'views/cliente/datos.php';
    }
    //Actualizar los datos del cliente en sesion
    public function actualizarDatos(){
        if(isset($_POST)){
            $id = $_SESSION['login']->id_cliente;
            $nombre = isset($_POST['name']) ? $_POST['name'] : false;
            $apellidos = isset($_POST['lastname']) ? $_POST['lastname'] : false;
            $email = isset($_POST['email']) ? $_POST['email'] : false;
            
            if ($nombre && $apellidos && $email) {
                $cliente = new Cliente();
                $cliente->setId($id);
                $cliente->setNombre($nombre);
                $cliente->setApellidos($apellidos);
                $cliente->setEmail($email);
                
                $datosActualizados = $cliente->actualizar();
                //Llenar la sesion con los nuevos datos
                $_SESSION['login'] = $cliente->recargaSesion();
            }
        }else{
            $_SESSION['fallo']="Fallo la actualización de los datos";
        }
        header('location:'. root . 'cliente/datos');
    }
    //Cierra la sesion del cliente
    public function logout(){
        if(isset($_SESSION['login'])){
            unset($_SESSION['login']);
            header('location:'.root);
        }
    }
    
    
}
