
<div class="carrito" style="width:70%; margin:0 auto; min-height:90vh;">
    <h1>Detalles del pedido</h1>
    <div style="max-height: 55%; overflow-y: scroll;">
        
        
        <table class="table table-bordered table-hover" style="max-height: 10px; overflow-y: scroll; font-size:17px;">
            <thead class="thead-dark">
                <tr>
                    <th>Imagen</th>
                    <th>Nombre</th>
                    <th>Subtotal</th>
                    <th>Cantidad</th>
                    <th>Estado Actual</th>
                </tr>
            </thead>
            <?php $total=0;?>
            <?php while ($pedido = $pedi->fetchObject()): ?>
                <tr>
                    <td width="100"><img src="<?= root ?>uploads/<?= $pedido->Imagen_Producto ?>" style="max-width: 100%;"></td>
                    <td><?= $pedido->Nombre_Producto ?></td>
                    <?php $pedido->subtotal = ($pedido->Precio*$pedido->cantidad_producto) ?>
                    <td><?= '$'.($pedido->Precio*$pedido->cantidad_producto) ?></td>
                    <td><?= $pedido->cantidad_producto ?></td>
                    <td><?= $pedido->Estado_Actual ?></td>
                </tr>
                <?php $total+=$pedido->subtotal ?>
            <?php endwhile; ?>
        </table>
        <h2>Total pagado: $<?=$total?></h2>
    </div>
</div>