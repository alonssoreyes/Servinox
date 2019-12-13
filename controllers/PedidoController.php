<?php

require_once 'models/pedido.php';

class pedidoController
{

    public function hacerPedido()
    {

        require_once 'views/pedido/hacer.php';
    }

    public function anadir()
    {
        if (isset($_SESSION['login'])) {
            //Validar datos del formulario
            $estado = isset($_POST['estado']) ? $_POST['estado'] : false;
            $municipio = isset($_POST['municipio']) ? $_POST['municipio'] : false;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : false;
            $codigoPostal = isset($_POST['codigopostal']) ? $_POST['codigopostal'] : false;
            $telefono = isset($_POST['telefono']) ? $_POST['telefono'] : false;
            $Monto = isset($_SESSION['total']) ? $_SESSION['total'] : false;
            //Guardar pedido en la base de datos
            $pedido = new Pedido();

            $pedido->setId_cliente($_SESSION['login']->id_cliente);
            $pedido->setEstado($estado);
            $pedido->setMunicipio($municipio);
            $pedido->setDireccion($direccion);
            $pedido->setCodigoPostal($codigoPostal);
            $pedido->setTelefono($telefono);
            $pedido->setMonto($Monto);

            $guardar = $pedido->guardarPedido();
            //Guardar detalle pedido
            $pedido->guardarDetallePedido();
            if ($guardar) {
                Utilidades::borrarSesion('carrito');
                $_SESSION['comprado'] = "<script>Swal.fire(
                    'Compra realizada!',
                    'Revisa tu pedido en el menu',
                    'success'
                  );</script>";
                header('location:' . root);
            } else {
                echo "Hubo un error";
            }
        } else {
            header('location:' . root);
        }
    }

    public function misPedidos()
    {
        if (isset($_SESSION['login'])) {
            $id_cliente = $_SESSION['login']->id_cliente;
            $pedidos = new Pedido();
            $pedidos->setId_cliente($id_cliente);
            $pedi = $pedidos->obtenerPedidosUsuario();
            require_once 'views/pedido/mis_pedidos.php';
        }else{
            header('location:'.root);
        }
    }

    public function detallePedido()
    {
        if (isset($_GET)) {
            $id = $_GET['id'];
            $pedido = new Pedido();
            $pedido->setId_pedido($id);
            $pedi = $pedido->obtenerPedido();
            require_once 'views/pedido/detalle.php';
        }
    }
}
