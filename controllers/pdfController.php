<?php

require_once'models/pedido.php';
require_once 'vendor/autoload.php';
use Spipu\Html2Pdf\Html2Pdf;
class pdfController{

    public function generar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $id_cliente = isset($_SESSION['login']) ? $_SESSION['login']->id_cliente : 0;
            $ped = new Pedido();

            $ped->setId_Pedido($id);
            $ped->setId_cliente($id_cliente);
            $pedido = $ped->obtenerPedidoPDF();
            if($pedido){
                $html2pdf = new Html2Pdf();
                require_once'views/pdf/recibo.php';
            }
        }
        

        
    }
}