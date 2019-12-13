<?php
$con = Database::conectar();
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta name="description" content="Servinox, contamos con una amplia gama de equipos para cocinas industriales con las cuales podrás comenzar o renovar tu negocio, los mejores precios y calidad.">
    <meta name="author" content="Alonso Reyes">

    <!-- FAV ICON -->
    <link rel="shortcut icon" type="image/png" href="<?=root?>favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="<?= root ?>assets/css/bootstrap.min.css">

    <!-- Estilos adicionales -->
    <link rel="stylesheet" type="text/css" href="<?= root ?>assets/css/main.css">
    <link rel="stylesheet" type="text/css" href="<?= root ?>assets/css/animate.css">
    <link rel="stylesheet" type="text/css" href="<?= root ?>assets/css/lightbox.css">
    <link rel="stylesheet" href="<?= root ?>assets/js/WaitMe/waitMe.min.css">


    <!-- jQuery -->
    <script type="text/javascript" src="<?= root ?>assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="<?= root ?>assets/js/lightbox.js"></script>


    <!-- BootstrapJS -->
    <script type="text/javascript" src="<?= root ?>assets/js/bootstrap.min.js"></script>
    <script src="<?= root ?>assets/js/jquery.min.js"></script>
    <script src="<?= root ?>assets/js/sweetalert.min.js"></script>
    <script src="<?= root ?>assets/js/waitMe/waitMe.min.js"></script>
    <script src="<?= root ?>assets/js/main.js"></script>
    <!-- main JS -->
    <link href="https://fonts.googleapis.com/css?family=Anton|Raleway&display=swap" rel="stylesheet">
    <!-- Font awesome -->
    <script src="https://kit.fontawesome.com/d8b82db4a1.js"></script>

    <title>Servinox| Todo para tu negocio</title>
</head>

<body>
    <!-- <div class="content"> -->
    <header class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg  barra">
                <div class="container">
                    <a class="navbar-brand" href="#">
                        <img src="<?= root ?>assets/img/logoazul.png" alt="Logo Servinox" style="max-width: 50%;" class="lightSpeedIn">
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link enlace" href="<?= root ?>">Inicio</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link enlace dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Catalogo
                                </a>
                                <?php $categorias = Utilidades::mostrarCategorias(); ?>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background: linear-gradient(90deg, rgba(0,51,102,1) 0%, rgba(0,51,102,1) 21%, rgba(4,73,140,1) 89%) !important;  color:#fff !important;">
                                    <?php while ($cat = $categorias->fetchObject()) : ?>
                                        <a class="dropdown-item" href="<?= root ?>producto/categoria&id=<?= $cat->id_categoria ?>" style="color:#fff;"><?= $cat->Nombre_categoria ?></a>
                                    <?php endwhile; ?>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link enlace" href="<?= root ?>contacto/index">Contacto</a>
                            </li>
                            <?php if (!isset($_SESSION['login'])) : ?>
                                <li class="nav-item">
                                    <a class="nav-link enlace" href="<?= root ?>cliente/login">Iniciar Sesión</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link enlace" href="<?= root ?>cliente/registro">Registrarse</a>
                                </li>
                            <?php else : ?>
                                <li class="nav-item dropdown">
                                    <a class="nav-link enlace dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <?php echo $_SESSION['login']->Nombre_Cliente ?></a>

                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background:#036 !important; color:#fff !important;">
                                        <a href="<?= root ?>cliente/datos" class="dropdown-item" style="color:#fff;">Actualizar mis datos</a>
                                        <a href="<?= root ?>pedido/misPedidos" class="dropdown-item" style="color:#fff;">Mis pedidos</a>
                                        <a href="<?= root ?>cliente/logout" class="dropdown-item" style="color:#fff;">Cerrar Sesión</a>

                                    </div>
                                </li>
                            <?php endif; ?>
                            <li class="nav-item">
                                <a href="<?= root ?>carrito/index" class="nav-link enlace"><i class="fas fa-shopping-cart"></i>(<?= Utilidades::estadisticasCarrito()['contador'] ?>)</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>
        </div>


    </header> <!-- header -->
    <div class="container" id="index">
    <?php if (isset($_SESSION['comprado'])) : ?>
    <?php echo $_SESSION['comprado'] ?>
    <?= Utilidades::borrarSesion('comprado') ?>
<?php endif; ?>