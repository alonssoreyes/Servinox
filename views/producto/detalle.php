<div class="row" style="padding:2rem;">
    <div class="col-md-12">
        <?php $prod = $producto->fetchObject(); ?>
        <div class="row">
            <div class="col-sm-12 col-md-7">
                <center><img src="<?= root ?>uploads/<?= $prod->Imagen_Producto ?>" style="max-width:70%;" class="card-img-top"></center>
            </div>
            <div class="col-md-5 card">
                <div class="card-header mt-3">
                    <h2><?= $prod->Nombre_Producto ?></h2>
                    <p class="card-text" ><a href="#" class="btn btn-link" style="color:#036 !important;"></a></p>
                </div>
                <div class="card-body ">
                    <h2 class="h1">$<?= $prod->Precio ?>+ IVA</h2>
                    <p class="card-text"><?= $prod->Descripcion_Producto ?></p>
                    <h2 class="card-title">Marca <?= $prod->Marca ?></h2>
                    <p class="car-title">Cantidad disponible: <?= $prod->Stock ?> </p>
                </div>
                <div class="card-footer">
                    <a href="<?= root ?>carrito/anadir&id=<?= $prod->id_producto ?>" class="btn btn-success btn-block" style="margin: 1% 0"><i class="fas fa-shopping-cart"></i> Añadir</a>
                </div>
            </div>
        </div>
    </div>
</div>