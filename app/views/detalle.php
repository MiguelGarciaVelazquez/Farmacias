<!-- views/producto/detalle.php -->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalles de Farmacia</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mvc/public/css/tableStyles.css">
</head>
<body>
    <h2>Detalles de la Farmacia</h2>
    <?php if ($detalle): ?>
        <p><strong>Nombre Farmacia:</strong> <?php echo htmlspecialchars($detalle->farmaciaNombre); ?></p>
        <p><strong>Dirección:</strong> <?php echo htmlspecialchars($detalle->farmaciaDireccion); ?></p>
        <p><strong>Nombre Encargado:</strong> <?php echo htmlspecialchars($detalle->farmaciaNombreEncargado ); ?></p>
        <p><strong>Telefono:</strong> <?php echo htmlspecialchars($detalle->farmaciaTelefono); ?></p>
        <p><strong>Correo:</strong> <?php echo htmlspecialchars($detalle->farmaciaCorreo); ?></p>
        <p><strong>Existencias:</strong> <?php echo htmlspecialchars($detalle->medicinasExistencias); ?></p>
        <?php if($detalle->medicinasReceta == 1){ ?>
            <p class="numero_1"><strong>Nota Importante:</strong> 
            <?php echo "Este medicamento requiere receta medica para su venta.";
                }  
                   elseif($detalle->medicinasReceta == 0){ ?>
            <p class="numero_0"><strong>Nota Importante:</strong>      
            <?php echo "Venta libre";   
                   }  
        ?></p>


    <?php else: ?>
        <p>No se encontraron detalles para este producto.</p>
    <?php endif; ?>
</body>
</html>



