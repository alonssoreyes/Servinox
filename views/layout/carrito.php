<?php
if (isset($_SESSION['compras'])) {
    $datos = $_SESSION['compras'];
}
if (isset($_SESSION['total'])) {
    $total = $_SESSION['total'];
}
?>

<div class="col-md-4">
    <h1>Carrito</h1>

    <div class="table-responsive bg-light">
        <table class="table table-hover table-stripped table-sm">
            <thead>
                <tr>
                    <th>Imagen</th>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <td>Precio U.</td>
                </tr>
            </thead>
            <tbody>
                <?php if (isset($_SESSION['compras'])) : ?>
                    <?php for ($i = 0; $i < count($datos); $i++) : ?>
                        <tr>
                            <td width=100><img src="uploads/<?= $datos[$i]['Imagen'] ?>" alt="" style="max-width:100%;"></td>
                            <td class="align-middle">
                                <?= $datos[$i]['Nombre'] ?>
                                <small class="d-block text-muted">Codigo: <?= $datos[$i]['Id'] ?></small>
                            </td>
                            <td class="align-middle text-center">
                                <input type="number" min="1" value="<?= $datos[$i]['Cantidad'] ?>" data-precio="<?= $datos[$i]['Precio'] ?>" data-id="<?= $datos[$i]['Id'] ?>" class="form-control form-control-sm cantidad">
                            </td>
                            <td class="align-middle text-center">$<?= $datos[$i]['Precio'] ?></td>
                        </tr>

                    <?php endfor; ?>
                <?php else : ?>
                    <tr>
                        <td>
                            <p>Carrito vacio</p>
                        </td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
    <table class="table">
        <tr>
            <th>Subtotal</th>
            <td class="text-info text-right" id="total">$<?= isset($total) ? $total : 0; ?></td>
        </tr>
        <tr>
            <th>Envio</th>
            <td class="text-info text-right" id="envio">$<?= isset($total) ? ($total * 0.05) : 0 ?></td>
        </tr>
        <tr>
            <th>Total</th>
            <td class="text-right">
                <h3 class="font-weight-bold" id="totalF">$<?= isset($total) ? $total + ($total * 0.05) : 0 ?></h3>
            </td>
        </tr>
    </table>
    <?php if (isset($_SESSION['compras']) && isset($_SESSION['user-logged'])) : ?>
        <a href="vaciar" class="btn btn-sm btn-danger text-white">Vaciar Carrito</a>
        <form action="comprar.php" method="POST" id="form">
            <div class="form-group">
                <label><strong>Titular de la tarjeta</strong></label>
                <input type="text" class="form-control" value="<?= $_SESSION['user-logged']['Nombre_Cliente'] . ' ' . $_SESSION['user-logged']['Apellidos_Cliente'] ?>" required pattern="[A-Z a-z]+" name="nombre">
            </div>
            <div class="form-group">
                <label><strong>Numero de tarjeta</strong></label>
                <input type="text" class="form-control" placeholder="Visa/MasterCard" required pattern="[0-9]+" minlength="16" maxlength="16" required>
            </div>
            <div class="form-group">
                <label><strong>Fecha Vencimiento</strong></label>
                <input type="date" class="form-control" name="fecha" required>
            </div>
            <div class="form-group">
                <label><strong>Numero de seguridad</strong></label>
                <input type="text" class="form-control" placeholder="Al reverso de la tarjeta" maxlength="3" required pattern="[0-9 /]+">
            </div>
            <div class="form-group">
                <label><strong>Estado de la Republica</strong></label>
                <select name="estado" style="display:block; margin:0 0 2% 0;" class="form-control">
                    <option value="" selected disabled>---Selecciona tu estado----</option>
                    <option value="Aguascalientes">Aguascalientes</option>
                    <option value="Baja California">Baja California</option>
                    <option value="Baja California Sur">Baja California Sur</option>
                    <option value="Campeche">Campeche</option>
                    <option value="Coahuila de Zaragoza">Coahuila de Zaragoza</option>
                    <option value="Colima">Colima</option>
                    <option value="Chiapas">Chiapas</option>
                    <option value="Chihuahua">Chihuahua</option>
                    <option value="Distrito Federal">Distrito Federal</option>
                    <option value="Durango">Durango</option>
                    <option value="Guanajuato">Guanajuato</option>
                    <option value="Guerrero">Guerrero</option>
                    <option value="Hidalgo">Hidalgo</option>
                    <option value="Jalisco">Jalisco</option>
                    <option value="México">México</option>
                    <option value="Michoacán de Ocampo">Michoacán de Ocampo</option>
                    <option value="Morelos">Morelos</option>
                    <option value="Nayarit">Nayarit</option>
                    <option value="Nuevo León">Nuevo León</option>
                    <option value="Oaxaca">Oaxaca</option>
                    <option value="Puebla">Puebla</option>
                    <option value="Querétaro">Querétaro</option>
                    <option value="Quintana Roo">Quintana Roo</option>
                    <option value="San Luis Potosí">San Luis Potosí</option>
                    <option value="Sinaloa">Sinaloa</option>
                    <option value="Sonora">Sonora</option>
                    <option value="Tabasco">Tabasco</option>
                    <option value="Tamaulipas">Tamaulipas</option>
                    <option value="Tlaxcala">Tlaxcala</option>
                    <option value="Veracruz de Ignacio de la Llave">Veracruz de Ignacio de la Llave</option>
                    <option value="Yucatán">Yucatán</option>
                    <option value="Zacatecas">Zacatecas</option>

                </select>
            </div>
            <div class="form-group">
                <label><strong>Municipio</strong></label>
                <input type="text" class="form-control" name="municipio" required>
            </div>
            <div class="form-group">
                <label><strong>Dirección (Incluir numero ext. o int.)</strong></label>
                <input type="text" class="form-control" name="direccion" required>
            </div>
            <div class="form-group">
                <label><strong>Codigo Postal</strong></label>
                <input type="text" class="form-control" name="codigopostal" minlength="5" maxlength="5" required>
            </div>
            <div class="form-group">
                <label><strong>Telefono al cual contactarnos</strong></label>
                <input type="text" class="form-control" name="telefono" maxlength="10" minlength="8" required>
            </div>
            <input type="submit" class="btn btn-lg btn-success btn-block text-white" id="btncomprar" value="Pagar Ahora">
        </form>


    <?php else : ?>
        <div>
            <h6>Inicia sesíon y añade productos al carrito para seguir con el proceso</h6>
        </div>
    <?php endif; ?>
</div>