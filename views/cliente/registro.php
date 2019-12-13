<div class="container">
    <div class="row p-5">
        <div class="col-lg-6">
            <img src="<?= root ?>assets/img/registro.png" style="max-width: 100%">
        </div>
        <div class="col-xs-12 col-sm-10 col-md-6 col-lg-6 login">
            <center>
                <h2>Registro</h2>
            </center>
            <br>
            <!--Mostrar el mensaje de alerta en caso de que el registro haya sido exitoso-->
            <?php if (isset($_SESSION['registro'])) : ?>
                <strong class="text-success"><?= $_SESSION['registro'] ?></strong>
            <?php endif; ?>
            <!--Borrar la alerta una vez mostrada-->
            <?php Utilidades::borrarSesion('registro'); ?>
            <!--Mostrar mensaje de error en caso de que no se haya completado -->
            <?php if (isset($_SESSION['fallo'])) : ?>
                <strong class="text-danger"><?= $_SESSION['fallo'] ?></strong>
            <?php endif; ?>
            <!--Borrar el mensaje de error-->
            <?php Utilidades::borrarSesion('fallo'); ?>
            <form action="<?= root ?>cliente/guardar" class="form-group text-center" style="margin: 0 auto;" method="POST">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Nombre" name="name" id="name">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Apellidos" name="lastname" id="lastname">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Email" name="email" id="email">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Contraseña" name="password" id=="password">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Confirmar Contraseña" name="confirmPassword">
                </div>
                <button type="submit" class="btn btn-block" style="background:#036;color:#fff;">Registrarme</button>
            </form>
        </div>

    </div>
</div>