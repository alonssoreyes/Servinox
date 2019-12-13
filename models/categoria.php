<?php

class Categoria{
    private $id;
    private $Nombre;
    private $con;

    public function __construct() {
        $this->con = Database::conectar();
    }
    
    function getId() {
        return $this->id;
    }

    function getNombre() {
        return $this->getNombre();
    }

    function setId($id) {
        $this->id = $id;
    }

    function setNombre($Nombre) {
        $this->Nombre = $Nombre;
    }
    
    public function getCategorias(){
        $sql = "SELECT * FROM categoria";
        $categorias = $this->con->query($sql);
        
        return $categorias;
    }

}