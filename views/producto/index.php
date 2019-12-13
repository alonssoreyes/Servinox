<div class="row" style="padding:2rem;">
    <?php $cat = $categoria->fetchObject(); ?>
    <h1><?= $cat->Nombre_categoria ?></h1>
    <div class="col-md-12">

        <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <?php while ($prod = $productos->fetchObject()) : ?>
                        <div class="col-12 col-sm-8 card col-md-3 pl-2">
                            <div class="card-header">
                                <img class="card-img" src="<?= root ?>uploads/<?= $prod->Imagen_Producto ?>" style="width:100%;max-width:100%; vertical-align:middle;">
                            </div>
                            <div class="card-body">
                                <a href="<?= root ?>producto/detalle&id=<?= $prod->id_producto ?>" title="<?= $prod->Nombre_Producto ?>">
                                    <h5 class="card-title" style="color:#036;"><?= $prod->Nombre_Producto ?></h5>
                                </a>
                                <h6 class="card-subtitle mb-2 text-muted">Marca: <?= $prod->Marca ?></h6>
                                <h6 class="card-subtitle mb-2 text-muted"><strong>Precio:</strong>$<?= $prod->Precio ?></h6>
                            </div>
                            <div class="card-footer">
                                <div class="buy d-flex justify-content-between align-items-center ">
                                    <a href="<?= root ?>carrito/anadir&id=<?= $prod->id_producto ?>" class="btn btn-primary btn-block" style="background:#036 !important; border:1px solid #036 !important"><i class="fas fa-shopping-cart "></i> Añadir</a>
                                </div>
                            </div>
                        </div>
                    <?php endwhile; ?>
                </div>
            </div>
            <!--Require Carrito-->
        </div>

    </div>
</div>