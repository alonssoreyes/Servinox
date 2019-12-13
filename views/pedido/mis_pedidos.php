<div class="row justify-content-center mt-3" style="min-height:90vh;">
    <div class="col-md-9">
        <h1>Mis pedidos</h1>

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>N° de pedido</th>
                    <th>Fecha de pedido</th>
                    <th>Monto total</th>
                    <th>Recibo</th>
                </tr>
            </thead>
            <tbody>

                <?php while ($ped = $pedi->fetchObject()): ?>
                    <tr style="font-size:20px;">
                        <td><a href="<?=root?>pedido/detallePedido&id=<?= $ped->id_pedido ?>" class="btn btn-link btn-block" style="font-size:20px;"><?= $ped->id_pedido ?></td>
                        <td><?= $ped->created_at ?></td>
                        <td>$<?= $ped->Monto?></td>
                        <td ><a href="<?=root?>pdf/generar&id=<?= $ped->id_pedido ?>" class="btn btn-secondary btn-block" target="_blank" style="font-size:20px;"><i class="fas fa-file-download"></i>PDF</a></td>
                    </tr>
                <?php endwhile; ?>

            </tbody>
        </table>
    </div>
</div>