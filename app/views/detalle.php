<!-- views/producto/detalle.php -->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalles de Farmacia</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mvc/public/css/tableStyles.css">
</head>
<body>
    <h2>Información de la Farmacia</h2>
    
    <!-- Contenedor principal que incluye la información y el logo -->
    <div class="contenedor-detalle">
        
        <!-- Información de la farmacia -->
        <div class="detalle-info">
            <?php if ($detalle): ?>
                <p><strong>Nombre Farmacia:</strong> <?php echo htmlspecialchars($detalle->farmaciaNombre); ?></p>
                <p><strong>Dirección:</strong> <?php echo htmlspecialchars($detalle->farmaciaDireccion); ?></p>
                <p><strong>Nombre Encargado:</strong> <?php echo htmlspecialchars($detalle->farmaciaNombreEncargado ); ?></p>
                <p><strong>Teléfono:</strong> <?php echo htmlspecialchars($detalle->farmaciaTelefono); ?></p>
                <p><strong>Correo:</strong> <?php echo htmlspecialchars($detalle->farmaciaCorreo); ?></p>
                <p><strong>Existencias:</strong> <?php echo htmlspecialchars($detalle->medicinasExistencias); ?></p>
                <?php if($detalle->medicinasReceta == 1){ ?>
                    <p class="numero_1"><strong>Nota Importante:</strong> 
                    <?php echo "Este medicamento requiere receta médica para su venta.";
                        } elseif($detalle->medicinasReceta == 0){ ?>
                    <p class="numero_0"><strong>Nota Importante:</strong>      
                    <?php echo "Venta libre";   
                        }  
                ?></p>
            <?php else: ?>
                <p>No se encontraron detalles para este producto.</p>
            <?php endif; ?>
        </div>

        <!-- Logo de la farmacia -->
        <div class="logo">
            <img src="<?php echo htmlspecialchars($detalle->logopath); ?>" alt="Logo de la Farmacia">
        </div>
    </div>
</body>
</html>



