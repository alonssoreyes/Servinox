<?php
require_once 'models/producto.php';
class productoController {
    
    //Carga la pantalla de productos
    public function categoria() {
        if(isset($_GET)){
            $id= $_GET['id'];
            $productosPorCategoria = new Producto();
            $productosPorCategoria->setId_producto($id);
            
            $productos = $productosPorCategoria->mostrarPorCategoria();
            $categoria = $productosPorCategoria->getCategoria();
            require_once'views/producto/index.php';
        }
    }
    
    public function detalle(){
        if(isset($_GET)){
            $id = $_GET['id'];
            $detalleProducto = new Producto();
            $detalleProducto->setId_producto($id);
            $producto = $detalleProducto->mostrarUnProducto();
            
            require_once'views/producto/detalle.php';
        }
    }
//    public function getCategoria(){
//        $id = isset($_GET) ? $_GET['id'] : false;
//        
//        $categoriaProductos = new Producto();
//        $categoriaProductos->setId($id);
//        
//        $categoria = $categoriaProductos->getCategoria();
//    }
}
