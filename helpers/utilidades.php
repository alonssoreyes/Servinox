<?php

class Utilidades {
    
    //Usada para eliminar sesiones, mayormente para sesiones con alertas
    public static function borrarSesion($nombre) {
        if (isset($_SESSION[$nombre])) {
            unset($_SESSION[$nombre]);
        }

        return $nombre;
    }

    public static function mostrarCategorias() {
        require_once 'models/categoria.php';
        $categoria = new Categoria();

        $categorias = $categoria->getCategorias();

        return $categorias;
    }

    public static function estadisticasCarrito() {
        $estadisticas = array(
            'contador' => 0,
            'total' => 0
        );
        if (isset($_SESSION['carrito'])) {
            $estadisticas['contador'] = count($_SESSION['carrito']);

            foreach ($_SESSION['carrito'] as $i => $producto) {
                $estadisticas['total'] += $producto['precio'] * $producto['cantidad'];
            }
        }
        return $estadisticas;
    }


}
