<div class="row datos">
    <div class="col-md-12">
        <h2 style="color:#444; border:none; font-size:3rem;">Mis datos</h2>
        <br>
        <!-- comentario -->
        <form action="<?=root?>cliente/actualizarDatos" class="form-group" method="POST" autocomplete="off">
            <label for="name">Nombre:</label>
            <input type="text" class="form-control" placeholder="Nombre" name="name" value="<?= $_SESSION['login']->Nombre_Cliente; ?>">
            <label for="name">Apellidos:</label>
            <input type="text" class="form-control" placeholder="Apellidos" name="lastname" value="<?= $_SESSION['login']->Apellidos_Cliente ?>">
            <label for="name">Email:</label>
            <input type="text" class="form-control" placeholder="Email" name="email" value="<?= $_SESSION['login']->Email; ?>">
            <br>
            <input type="submit" value="Actualizar datos" class="btn btn-success">
        </form>
        <a href="password" class="btn btn-link">Cambiar contraseña</a>
    </div>
</div>