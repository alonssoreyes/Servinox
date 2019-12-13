<?php
$template = '
    <div>
        <img src="assets/img/logoazul.png" alt="Imagen logo" style="float:left;">
        <h1 style="text-align:center;">Resumen de la compra</h1>
        <p style="text-align:center;">Todo para tu negocio</p>
    </div>

    <div style="width:80%; margin:100px 10%;">
        <table>
            <thead>
                <tr >
                    <th style="padding:0 10px;">Imagen </th>
                    <th style="padding:0 10px;">Producto</th>
                    <th style="padding:0 10px;">Cantidad</th>
                    <th style="padding:0 10px;">Estado Actual</th>
                    <th style="padding:0 10px;">Subtotal</th>
                </tr>
            </thead>
            <tbody>
    ';
?>
                <?php foreach ($pedido as $pedi) :
                    $nombre = $pedi['Nombre_Cliente'] . " " . $pedi['Apellidos_Cliente'];
                    $total = $pedi['Monto'];
                    $fecha = $pedi['created_at'];
                    $dir = $pedi['Direccion'].", ".$pedi['Municipio'].", ".$pedi['Estado'];
                    ?>
<?php
    $template .= '
                <tr style="margin-bottom:100px;">
                    <td><img src="uploads/' . $pedi['Imagen_Producto'] . '" style="max-width:50%;"></td>
                    <td style="padding: 10px;">' . $pedi['Nombre_Producto'] . '</td>
                    <td style="padding: 10px;">' . $pedi['cantidad_producto'] . '</td>
                    <td style="padding: 10px;">' . $pedi['Estado_Actual'] . '</td>
                    <td style="padding: 10px;">' . $pedi['subtotal'] . '</td>
                </tr>
                ';
    ?>
                <?php endforeach; ?>
<?php
$template .= '
            </tbody>
        </table>
        <div>
            <h4 style="text-align:right; display:inline;">Total pagado <h2>$' . $total . '</h2></h4>
            <p style="text-align:right; display:inline;">Fecha de pedido<h2 style="display:inline-block;">' . $fecha . '</h2></p>
            <h4 style="text-align:left;">Direccion de envio</h4>
            <p style="text-align:left";>'.$dir.'</p>
            <h4 style="text-align:center;">Gracias por tu compra =)</h4>
        </div>
    </div>
    ';
?>

