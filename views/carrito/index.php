<h1>Tus productos en el carrito</h1>


<div style="min-height: 90vh;">
    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
            <tr>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Gestion</th>
            </tr>
        </thead>
        <?php if (isset($carrito)) : ?>
            <?php
                foreach ($carrito as $i => $elemento) :
                    $producto = $elemento['producto'];
                    ?>
                <tr class="justify-content-center">
                    <td width="100"><img src="<?= root ?>uploads/<?= $producto->Imagen_Producto ?>" style="max-width: 100%;"></td>
                    <td><?= $producto->Nombre_Producto ?></td>
                    <td>
                        <?= '$' . $producto->Precio ?>
                    </td>
                    <td class="text-center">
                        <p style="font-size:20px; display:inline-block; margin:0 20px"><?= $elemento['cantidad'] ?></p>
                    </td>
                    <td class="text-center">
                    <a href="<?= root ?>carrito/disminuir&index=<?= $i ?>" class="btn btn-primary">-</a>
                        <a href="<?= root ?>carrito/remover&index=<?= $i ?>" class="btn btn-outline-danger" style="display:inline-block;">Eliminar</a>
                        <a href="<?= root ?>carrito/aumentar&index=<?= $i ?>" class="btn btn-primary">+</a>
                    </td>
                    
                </tr>
            <?php endforeach; ?>
        <?php endif; ?>
    </table>
    <h3>Total a pagar: $<?= $_SESSION['total'] =  Utilidades::estadisticasCarrito()['total'] ?></h3>
    <?php if (isset($carrito)) : ?>
        <a href="<?= root ?>pedido/hacerPedido" class="btn btn-success" style="float:right;">Continuar con el pedido -></a>
        <a href="<?= root ?>carrito/resetear" class="btn btn-outline-warning" style="float:left;">Vaciar carrito</a>


    <?php endif; ?>
    </div>