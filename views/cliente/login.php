<!--Vista del formulario de inicio de sesión-->
<div class="container">
    <div class="row p-5">
        <div class="col-lg-6">
            <img src="<?= root ?>assets/img/login.png" style="max-width: 100%; border-radius: 20px;">
        </div>
        <div class="col-xs-12 col-sm-10 col-md-6 col-lg-6 login">
            <center>
                <h2>Inicia Sesión</h2>
            </center>
            <br>
            <!--Mostrar mensaje de error en caso de que no se haya completado -->
            <?php if (isset($_SESSION['fallo'])) : ?>
                <strong class="text-danger"><?= $_SESSION['fallo'] ?></strong>
            <?php endif; ?>
            <!--Borrar el mensaje de error-->
            <?php Utilidades::borrarSesion('fallo'); ?>
            <form action="<?= root ?>cliente/entrar" class="form-group text-center" method="POST" style="margin: 0 auto;">
                <input type="email" class="form-control" placeholder="Email" name="email" required>
                <br>
                <input type="password" class="form-control" placeholder="Contraseña" name="password" required>
                <br>
                <input type="submit" value="Entrar" class="btn btn-block" style="background: #036; color:#fff;">
            </form>
        </div>

    </div>
</div>