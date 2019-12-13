<?php

class Producto {

    private $id_producto;
    private $id_categoria;
    private $Nombre;
    private $Descripcion;
    private $Marca;
    private $Stock;
    private $Precio;
    private $Imagen;
    private $con;

    function getId_producto() {
        return $this->id_producto;
    }

    function getId_categoria() {
        return $this->id_categoria;
    }

    function getNombre() {
        return $this->Nombre;
    }

    function getDescripcion() {
        return $this->Descripcion;
    }

    function getMarca() {
        return $this->Marca;
    }

    function getStock() {
        return $this->Stock;
    }

    function getPrecio() {
        return $this->Precio;
    }

    function getImagen() {
        return $this->Imagen;
    }

    function setId_producto($id_producto) {
        $this->id_producto = $id_producto;
    }

    function setId_categoria($id_categoria) {
        $this->id_categoria = $id_categoria;
    }

    function setNombre($Nombre) {
        $this->Nombre = $Nombre;
    }

    function setDescripcion($Descripcion) {
        $this->Descripcion = $Descripcion;
    }

    function setMarca($Marca) {
        $this->Marca = $Marca;
    }

    function setStock($Stock) {
        $this->Stock = $Stock;
    }

    function setPrecio($Precio) {
        $this->Precio = $Precio;
    }

    function setImagen($Imagen) {
        $this->Imagen = $Imagen;
    }

    public function __construct() {
        $this->con = Database::conectar();
    }

    function mostrarTodosProductos() {
        $sql = "SELECT * FROM Productos WHERE Stock>0";

        $productos = $this->con->query($sql);

        return $productos;
    }

    function mostrarPorCategoria() {
        $sql = "SELECT * FROM Producto WHERE id_categoria={$this->getId_producto()} AND Stock>0";

        $productos = $this->con->query($sql);

        return $productos;
    }

    function mostrarUnProducto() {
        $sql = "SELECT * FROM Producto WHERE id_producto={$this->getId_producto()}";
        $producto = $this->con->query($sql);

        return $producto;
    }

    function getCategoria() {
        $sql = "SELECT * FROM categoria WHERE id_categoria ={$this->getId_producto()}";
        $categoria = $this->con->query($sql);

        return $categoria;
    }

}
