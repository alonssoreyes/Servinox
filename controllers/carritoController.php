<?php

require_once 'models/producto.php';

class carritoController {

    public function index() {
        $carrito = isset($_SESSION['carrito']) ? $_SESSION['carrito'] : null;

        require_once'views/carrito/index.php';
    }

    public function anadir() {
        if (isset($_GET['id'])) {
            $producto_id = $_GET['id'];
        } else {
            header('location:' . root);
        }

        if (isset($_SESSION['carrito'])) {
            $contador = 0;
            foreach ($_SESSION['carrito'] as $i => $elemento) {
                if ($elemento['id_producto'] == $producto_id) {
                    $_SESSION['carrito'][$i]['cantidad'] ++;
                    $contador++;
                }
            }
        }
        if (!isset($contador) || $contador == 0) {
            //Sacar el producto de la base de datos
            $product = new Producto();
            $product->setId_producto($producto_id);
            $producto = $product->mostrarUnProducto()->fetchObject();
            if (is_object($producto)) {
                $_SESSION['carrito'][] = array(
                    'id_producto' => $producto->id_producto,
                    'precio' => $producto->Precio,
                    'cantidad' => 1,
                    'producto' => $producto
                );
            }
        }
        header('location:' . root . 'carrito/index');
    }

    public function eliminar() {
        
    }

    public function resetear() {
        unset($_SESSION['carrito']);
        header('location:' . root . 'carrito/index');
    }

    public function remover() {
        if (isset($_GET)) {
            $i = $_GET['index'];
            if (count($_SESSION['carrito']) == 1) {
                unset($_SESSION['carrito']);
            } else {
                unset($_SESSION['carrito'][$i]);
            }
            header('location:' . root . 'carrito/index');
        }
    }

    public function aumentar() {
        if (isset($_GET)) {
            $i = $_GET['index'];
            $_SESSION['carrito'][$i]['cantidad'] ++;
            header('location:' . root . 'carrito/index');
        }
    }
    public function disminuir() {
        if (isset($_GET)) {
            $i = $_GET['index'];
            if($_SESSION['carrito'][$i]['cantidad']>1){
                $_SESSION['carrito'][$i]['cantidad']--;
            }else{
                unset($_SESSION['carrito']);
            }
            header('location:' . root . 'carrito/index');
        }
    }
}
