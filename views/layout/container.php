<?php
//Consulta para traer 4 productos al azar
//Instancia de la base de datos;
$con = Database::conectar();
$sql = "SELECT TOP 4 p.*, c.Nombre_categoria as 'nombre_categoria' FROM Producto p JOIN Categoria  c 
ON p.id_categoria=c.id_categoria
WHERE p.Stock>0 
ORDER BY NEWID()";

$query = $con->prepare($sql);
$query->execute();
?>
</div>

<div class="row">
    <div class="col-md-12 hero text-center">
        <div class="row info-e">
            <div class="col-md-7 p-5">
                <h1>Todo en acero inoxidable</h1>
                <p class="text-justify">Bienvenidos a SERVINOX, empresa especializada en la fabricación y comercialización de Equipo y muebles en Acero Inoxidable para: Restaurantes, Comedores, Cafeterias, Bares, Laboratorios e Industria en General. Contamos con más de 15 años de experiencia, cubriendo todas las necesidades del ramo, fabricamos ademas carritos de Hot-Dogs y atendemos proyectos especiales. Te invitamos a conocer lo que tenemos para ti con los mejores precios. </p>
            </div>
            <div class="col-md-5 p-5">
                <img src="assets/img/michael-browning-MtqG1lWcUw0-unsplash.jpg" alt="">
            </div>
        </div>
    </div>
</div>
<div class="container">
<div class="row">
    <div class="col-md-12">
        <h1 style="margin:2rem 0; color:#444; text-align:center;">LOS MAS DESTACADOS</h1>
    </div>
</div>
<div class="row ">
    <?php while ($prod = $query->fetchObject()) : ?>
        <div class="col-12 col-sm-8 card col-md-3 pl-2">
            <div class="card-header text-center bg-white">
                <img class="card-img" src="<?= root ?>uploads/<?= $prod->Imagen_Producto ?>" style="max-width:70%; vertical-align:middle;">
            </div>
            <div class="card-body">
                <a href="<?=root?>producto/detalle&id=<?=$prod->id_producto?>" title="<?= $prod->Nombre_Producto ?>">
                    <h3 class="card-title" style="color:#036;"><?= $prod->Nombre_Producto ?></h3>
                </a>
                <h5 class="card-subtitle mb-2 text-muted">Marca: <?= $prod->Marca ?></h5>
            </div>
            <div class="card-footer">
                <div class="buy d-flex justify-content-between align-items-center">
                    <a href="<?= root ?>carrito/anadir&id=<?= $prod->id_producto ?>" class="btn  btn-block boton-agregar"><i class="fas fa-shopping-cart"></i>Añadir</a>
                </div>
            </div>
        </div>
    <?php endwhile; ?>
</div>
    </div>
<div class="row">
    <div class="col-md-12 info-cont">
        <div class="info">
            <!-- <h2>Empresa Líder en producción de Equipos para Cocinas Industriales</h2>
            <p>Bienvenidos a SERVINOX, empresa especializada en la fabricación y comercialización de Equipo y muebles en Acero Inoxidable para: Restaurantes, Comedores, Cafeterias, Bares, Laboratorios e Industria en General.</p> -->
        </div>
    </div>
</div>
<div class="container">
<div class="row">
    <div class="col-md-12">
        <h2 class="text-center" style="margin:2rem 0; color:#444; text-align:center; font-size:50px !important">Categorias</h2>
    </div>
</div>
<div class="row text-center">
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 categoria">
        <a href="<?= root ?>producto/categoria&id=1"><img src="<?= root ?>assets/img/cat1.jpg" alt="" style="max-width:100%; max-height:100%;">
            <div class="titulo-categoria">
                <h3>Carrito Hot Dog</h3>
            </div>
        </a>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 categoria">
        <a href="<?= root ?>producto/categoria&id=4">
            <img src="<?= root ?>assets/img/cat2.jpg" alt="" style="max-width:100%; max-height:100%;">
            <div class="titulo-categoria">
                <h3>Utensilios para cocina</h3>
            </div>
        </a>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 categoria">
        <a href="<?= root ?>producto/categoria&id=2">
            <img src="<?= root ?>assets/img/cat3.jpg" alt="" style="max-width:100%; max-height:100%;">
            <div class="titulo-categoria">
                <h3>Cocción</h3>
            </div>
        </a>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 categoria">
        <a href="<?= root ?>producto/categoria&id=4">
            <img src="<?= root ?>assets/img/cat4.jpg" alt="" style="max-width:100%; max-height:100%;">
            <div class="titulo-categoria">
                <h3>Campanas de extracción</h3>
            </div>
        </a>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <h2 class="h1 text-center" style="margin:2rem 0; color:#444; text-align:center; text-transform:uppercase">Nosotros Somos</h2>
    </div>
</div>
<div class="row m-3">
    <div class="col-md-6">
        <img src="<?= root ?>assets/img/quienes-somos.jpg" alt="" style="max-width:100%; width:100%;">
    </div>
    <div class="col-md-6 text-justify" style="font-size:17px">
        <p>SERVINOX empresa 100% mexicana, fundada y establecida en la Cd. de Guadalajara, Jalisco para atender las necesidades crecientes del mercado mexicano en el área general del acero inoxidable. Siendo la mejor opción para todos nuestros clientes y la mejor para los que aun no lo son.</p>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <h2 class="h1 text-center" style="margin:2rem 0; color:#444; text-align:center; text-transform:uppercase">Testimoniales</h2>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <!-- Section: Testimonials v.1 -->
        <section class="text-center p-1">
            <div class="row">

                <!--Grid column-->
                <div class="col-lg-4 col-md-12 mb-lg-0 mb-4">
                    <!--Card-->
                    <div class="card testimonial-card">
                        <!--Background color-->
                        <div class="card-up info-color"></div>
                        <!--Avatar-->
                        <div class="avatar mx-auto white">
                            <img src="<?= root ?>assets/img/Andres.jpg" class="rounded-circle img-fluid" style="max-width:75%;">
                        </div>
                        <div class="card-body">
                            <!--Name-->
                            <h4 class="font-weight-bold mb-4">Jorge Vargas</h4>
                            <hr>
                            <!--Quotation-->
                            <p class="dark-grey-text mt-4 text-justify" style="font-size:17px;"><i class="fas fa-quote-left pr-2"></i>
                                Quede muy contento con la compra que realice, me ayudo a iniciar mi negocio, 100% recomendado</p>
                        </div>
                    </div>
                    <!--Card-->
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-4 col-md-6 mb-md-0 mb-4">
                    <!--Card-->
                    <div class="card testimonial-card">
                        <!--Background color-->
                        <div class="card-up blue-gradient">
                        </div>
                        <!--Avatar-->
                        <div class="avatar mx-auto white">
                            <img src="<?= root ?>assets/img/jabil.png" class="rounded-circle img-fluid">
                        </div>
                        <div class="card-body">
                            <!--Name-->
                            <h4 class="font-weight-bold mb-4">JABIL</h4>
                            <hr>
                            <!--Quotation-->
                            <p class="dark-grey-text mt-4 text-justify" style="font-size:17px;"><i class="fas fa-quote-left pr-2"></i>Estamos contentos de colaborar con Servinox, para nuestro comedor industrial el cual fue diseñado para aproximadamente 1000 empleados. </p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <!--Card-->
                    <div class="card testimonial-card">
                        <!--Background color-->
                        <div class="card-up indigo"></div>
                        <!--Avatar-->
                        <div class="avatar mx-auto white">
                            <img src="<?= root ?>assets/img/juan.jpg" class="rounded-circle img-fluid" style="max-width:75%;">
                        </div>
                        <div class="card-body">
                            <!--Nombre-->
                            <h4 class="font-weight-bold mb-4">Juan Manuel</h4>
                            <hr>
                            <!--Comentario-->
                            <p class="dark-grey-text mt-4 text-justify" style="font-size:17px;"><i class="fas fa-quote-left pr-2"></i>Excelente opción para iniciar un negocio, quede satisfecho con un horno para la fabricación de mis jericallas.</p>
                        </div>
                    </div>
                    <!--Card-->
                </div>

            </div>

        </section>
    </div>
</div>