<div style="width:50%; margin: 0 auto; padding: 20px;" class="bg-light justify-content-center">
    <?php if (isset($_SESSION['login'])) : ?>
        <h1>Datos de envio</h1>
        <form action="<?= root ?>pedido/anadir" method="POST" id="formDatos">
            <div class="form-group">
                <label><strong><i class="fas fa-user"></i> Titular de la tarjeta</strong></label>
                <input type="text" class="form-control" value="<?= $_SESSION['login']->Nombre_Cliente . ' ' . $_SESSION['login']->Apellidos_Cliente ?>" required pattern="[A-Z a-z]+" name="nombre">
            </div>
            <div class="form-group">
                <label><strong><i class="far fa-credit-card"></i> Numero de tarjeta</strong></label>
                <input type="text" class="form-control" placeholder="Visa/MasterCard" required pattern="[0-9]+" minlength="16" maxlength="16" required>
            </div>
            <div class="form-group">
                <label><strong><i class="fas fa-calendar-week"></i> Fecha Vencimiento</strong></label>
                <input type="date" class="form-control" name="fecha" required>
            </div>
            <div class="form-group">
                <label><strong><i class="fas fa-key"></i> Numero de seguridad</strong></label>
                <input type="text" class="form-control" placeholder="Al reverso de la tarjeta" maxlength="3" required pattern="[0-9 /]+">
            </div>
            <div class="form-group">
                <label><strong> <i class="fas fa-map-marker-alt"></i> Estado de la Republica</strong></label>
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
                <label><strong> <i class="fas fa-map-marker-alt"></i> Municipio</strong></label>
                <input type="text" class="form-control" name="municipio" required>
            </div>
            <div class="form-group">
                <label><strong> <i class="fas fa-map-marker-alt"></i> Dirección (Incluir numero ext. o int.)</strong></label>
                <input type="text" class="form-control" name="direccion" required>
            </div>
            <div class="form-group">
                <label><strong> <i class="fas fa-map-marker-alt"></i> Codigo Postal</strong></label>
                <input type="text" class="form-control" name="codigopostal" minlength="5" maxlength="5" required>
            </div>
            <div class="form-group">
                <label><strong> <i class="fas fa-phone"></i> Telefono al cual contactarnos</strong></label>
                <input type="text" class="form-control" name="telefono" maxlength="10" minlength="8" required>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-block btn-success" value="Pagar">
            </div>
        </form>
    <?php else : ?>
        <h1>Necesitas estar logueado para continuar</h1>
        <p>Inicia sesión para poder continuar con tu pedido</p>
    <?php endif; ?>

</div>