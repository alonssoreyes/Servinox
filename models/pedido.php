<?php

class Pedido
{

    private $id_pedido;
    private $id_cliente;
    private $Estado;
    private $Municipio;
    private $Direccion;
    private $CodigoPostal;
    private $Telefono;
    private $created_at;
    private $updated_at;
    private $Monto;
    private $con;

    function getMonto()
    {
        return $this->Monto;
    }

    function setMonto($Monto)
    {
        $this->Monto = $Monto;
    }


    public function __construct()
    {
        $this->con = Database::conectar();
    }

    function getId_pedido()
    {
        return $this->id_pedido;
    }

    function getId_cliente()
    {
        return $this->id_cliente;
    }

    function getEstado()
    {
        return $this->Estado;
    }

    function getMunicipio()
    {
        return $this->Municipio;
    }

    function getDireccion()
    {
        return $this->Direccion;
    }

    function getCodigoPostal()
    {
        return $this->CodigoPostal;
    }

    function getTelefono()
    {
        return $this->Telefono;
    }

    function getCreated_at()
    {
        return $this->created_at;
    }

    function getUpdated_at()
    {
        return $this->updated_at;
    }

    function setId_pedido($id_pedido)
    {
        $this->id_pedido = $id_pedido;
    }

    function setId_cliente($id_cliente)
    {
        $this->id_cliente = $id_cliente;
    }

    function setEstado($Estado)
    {
        $this->Estado = $Estado;
    }

    function setMunicipio($Municipio)
    {
        $this->Municipio = $Municipio;
    }

    function setDireccion($Direccion)
    {
        $this->Direccion = $Direccion;
    }

    function setCodigoPostal($CodigoPostal)
    {
        $this->CodigoPostal = $CodigoPostal;
    }

    function setTelefono($Telefono)
    {
        $this->Telefono = $Telefono;
    }

    function setCreated_at($created_at)
    {
        $this->created_at = $created_at;
    }

    function setUpdated_at($updated_at)
    {
        $this->updated_at = $updated_at;
    }

    function obtenerPedidos()
    { }
    //Guarda el pedido en la tabla correspondiente
    public function guardarPedido()
    {
        $result = false;
        $sql = "INSERT INTO pedido (id_cliente,Estado,Municipio,Direccion,Codigo_Postal,Telefono,created_at,updated_at,Estado_Actual,Monto)"
            . "VALUES ({$this->getId_cliente()},"
            . "'{$this->getEstado()}',"
            . "'{$this->getMunicipio()}',"
            . "'{$this->getDireccion()}',"
            . "'{$this->getCodigoPostal()}',"
            . "'{$this->getTelefono()}',"
            . "GETDATE(),"
            . "GETDATE(),"
            . "'En Preparacion',"
            . "'{$this->getMonto()}')";

        $guardar = $this->con->query($sql);
        if ($guardar) {
            $result = true;
        }
        return $result;
    }
    //Guarda el detalle en la misma transaccion 
    public function guardarDetallePedido()
    {
        $sql = "SELECT IDENT_CURRENT('pedido') AS 'pedido_id'";
        $query = $this->con->query($sql);
        $pedido_id = $query->fetchObject()->pedido_id;

        foreach ($_SESSION['carrito'] as $i => $elemento) {
            $producto = $elemento['producto'];
            $insert = "INSERT INTO detalle_pedido (id_pedido,id_producto,cantidad_producto,subtotal)"
                . "VALUES ({$pedido_id},{$producto->id_producto},{$elemento['cantidad']},({$elemento['precio']}*{$elemento['cantidad']}))";
            $this->con->query($insert);
        }
    }

    public function obtenerPedidosUsuario()
    {
        $sql = "SELECT * FROM pedido WHERE id_cliente={$this->getId_cliente()}";

        $pedidos = $this->con->query($sql);

        return $pedidos;
    }

    public function obtenerPedido()
    {
        $sql = "SELECT dp.*, pro.*, ped.* FROM detalle_pedido dp INNER JOIN producto pro ON (pro.id_producto=dp.id_producto) INNER JOIN pedido ped ON (ped.id_pedido=dp.id_pedido)
                WHERE dp.id_pedido={$this->getId_pedido()}";
        $pedido = $this->con->query($sql);

        return $pedido;
    }
    public function obtenerPedidoPDF()
    {
        $sql = "SELECT p.*,cli.*, dp.*,pr.* FROM pedido p  
        INNER JOIN Cliente cli  ON p.id_cliente=cli.id_cliente 
        INNER JOIN detalle_pedido dp ON dp.id_pedido=p.id_pedido
        INNER JOIN Producto pr ON dp.id_producto=pr.id_producto
    WHERE p.id_pedido={$this->getId_pedido()} AND p.id_cliente={$this->getId_cliente()}";

        $pedido = $this->con->query($sql);
        return $pedido;
    }
}
