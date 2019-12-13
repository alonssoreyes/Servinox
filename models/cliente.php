<?php

class Cliente {

    private $id;
    private $Nombre;
    private $Apellidos;
    private $Email;
    private $Password;
    private $con;

    public function __construct() {
        $this->con = Database::conectar();
    }

    function getId() {
        return $this->id;
    }

    function getNombre() {
        return $this->Nombre;
    }

    function getApellidos() {
        return $this->Apellidos;
    }

    function getEmail() {
        return $this->Email;
    }

    function getPassword() {
        return $this->Password;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setNombre($Nombre) {
        $this->Nombre = $Nombre;
    }

    function setApellidos($Apellidos) {
        $this->Apellidos = $Apellidos;
    }

    function setEmail($Email) {
        $this->Email = $Email;
    }

    function setPassword($Password) {
        $this->Password = $Password;
    }

    public function guardar() {
        //Declaracion de booleana a falso 
        $result = false;
        //Insercion de los datos del cliente
        $sql = "INSERT INTO cliente"
                . "(Nombre_Cliente,Apellidos_Cliente,Email,Password,created_at,updated_at)"
                . "VALUES ('{$this->getNombre()}','{$this->getApellidos()}','{$this->getEmail()}',"
                . "'{$this->getPassword()}',GETDATE(),GETDATE())";
        $guardar = $this->con->query($sql);

        //Si la consulta no tiene errores, retornar true
        if ($guardar) {
            $result = true;
        }
        return $result;
    }

    public function entrar() {
        //Declaracion de booleana a falso 
        $result = false;
        //Insercion de los datos del cliente
        $sql = "SELECT * FROM cliente WHERE email='{$this->getEmail()}'";
        //Saca el objeto de el usuario donde coincide con el email
        $cliente = $this->con->query($sql)->fetchObject();
        if ($cliente) {
            if (password_verify($this->getPassword(), $cliente->Password)) {
                //Si la consulta no tiene errores, retornar true
                $result = true;
            }
        }
       if($result){
           return $cliente;
       }
    }
    
    public function actualizar(){
        //Declaracion de booleana a falso 
        $result = false;
        //Actualizacion de los datos del cliente
        $sql = "UPDATE cliente SET Nombre_Cliente='{$this->getNombre()}',"
        . "Apellidos_Cliente='{$this->getApellidos()}',"
        . "Email='{$this->getEmail()}'"
        . "WHERE id_cliente={$this->getId()}";
        
        $query = $this->con->query($sql);
        
        if($query){
            $result = true;
        }
        return $result;
    }
    
    public function recargaSesion(){
        $sql = "SELECT * FROM cliente WHERE id_cliente={$this->id}";
        
        $cliente = $this->con->query($sql)->fetchObject();
        
        return $cliente;
    }

}
