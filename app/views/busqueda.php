<?php
require_once 'helpers.php'; // Incluir la funcion  auxiliar
?>

<!DOCTYPE html>
<html>
<head>
<style>
        #map {
            height: 350px;
            width: 100%;
        }
    </style>

    <title>Busqueda</title>
    <link rel="stylesheet" type="text/css" href="http://localhost/mvc/public/css/tableStyles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script src="http://localhost/mvc/public/JS/Modal.js"></script>
</head>
<body>
    <!--  <h1>Usuarios</h1>
    <a href="index.php?action=create"></a>
   -->



   <h2>Mapa de tu ubicación actual y Farmacias Cercanas</h2>
<!-- <p id="location">Cargando ubicación...</p>  -->
<div id="map">     </div>

<script>
    // Convertimos la Geolocation API en una Promesa
    function getPosition() {
        return new Promise((resolve, reject) => {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(resolve, reject);
            } else {
                reject(new Error("Geolocation API no soportada por este navegador"));
            }
        });
    }

    // Función asincrónica para obtener la ubicación y mostrar el mapa
    async function initMap() {
        try {
            // Esperamos a que se resuelva la promesa de la ubicación
            const position = await getPosition();
            const lat = 19.29121115778741 //position.coords.latitude;      //19.29121115778741
            const lng = -98.9980028305282//position.coords.longitude;     //-98.9980028305282

            // Inicializamos el mapa de Google con las coordenadas
            const location = { lat, lng };
            const map = new google.maps.Map(document.getElementById('map'), {
                zoom: 16,
                center: location
            });

            // Añadir un marcador en la ubicación del usuario
            const userMarker = new google.maps.Marker({
                position: location,
                map: map,
                title: "Tu ubicación"        
            });

             // Crear un InfoWindow para la ubicación del usuario
            const userInfoWindow = new google.maps.InfoWindow({
            content: "Esta es tu ubicación"
            });
            userInfoWindow.open(map, userMarker); // Abrir la InfoWindow inmediatamente


            // Obtener marcadores de PHP
            const marcadores = <?php echo json_encode($data); ?>;

            // Añadir cada marcador del array al mapa
            marcadores.forEach(marcador => {
            // Mostrar cada marcador en la consola para depuración
            console.log(marcador); // Cambié echo por console.log

            const lat = parseFloat(marcador.lat);
            const lng = parseFloat(marcador.lng);
            
            // Comprobar que lat y lng son números válidos
        if (isNaN(lat) || isNaN(lng)) {
        console.error(`Coordenadas inválidas: lat: ${marcador.lat}, lng: ${marcador.lng}`);
        return; // Salir del bucle si hay coordenadas inválidas
        }

        new google.maps.Marker({
            position: { lat: lat, lng: lng },
            map: map,
            title: marcador.farmaciaNombre
        });

    });

        } catch (error) {
            // Manejo de errores
            document.getElementById('location').innerHTML = `Error: ${error.message}`;
        }
    }

    // Esperamos a que Google Maps cargue y luego llamamos a initMap
    window.onload = function() {
        initMap();
    }
</script>

<!-- Cargar la API de Google Maps con tu clave API -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARReNuO0l6nVS1hWSdmVenhrkSyYI1AdE"></script>



    <ul>
	 <!-- Formulario de búsqueda -->
     <div class="search-container">
	 <form method="GET" action="index.php">
        <input type="hidden" name="action" value="search">
        <input type="text" name="keyword" placeholder="Buscar por nombre, tipo, Compuesto"  class="search-input">
        <input type="submit" value="Buscar" class="btn-custom">
    </form>
    <a href="index.php?>" class="link-custom">Regresar</a>
    </div>

    <div>
    
    </div>

    <h1>Busqueda de medicamentos</h1>
<div class = "container">


  <table class="styled-table">
    <thead>
      <th>Nombre Farmacia </th>
      <th>Nombre Medicamento</th>
      <th>Tipo</th>
      <th>Precio</th>
      <th>Servicio a Domicilio</th>
      <th>Costo a domicilio</th>
      <th>Calificacion</th> 
      <th>Detalle </th>
    </thead>
    <tbody>
    <?php if (count($data) > 0): 
      

        foreach ($data as $index => $data): 

         ?>
            <tr>
                <td><?= $data['farmaciaNombre']; ?></td>
                <td><?= $data['medicinasNombre']; ?></td>
                <td><?= $data['Tipo']; ?></td>
                <td><?= $data['Precio']; ?></td>
                <td><?php if($data['ServicioDomicilio'] == 1){
                             echo "Si";
                            } 
                                elseif ($data['ServicioDomicilio'] == 0){
                                    echo "No" ;   
                                } 
                             ?></td>
                <td><?= $data['CostoServDomicilio']; ?></td>
                
                <td>
                   <?php if($index == 0){
                   echo mostrarEstrellas(5); 
                  //echo "5";
                }  
                   elseif($index == 1){
                  echo mostrarEstrellas(4); 
                   //echo "4";   
                   }  
                   elseif($index == 2){
                    echo mostrarEstrellas(3); 
                     //echo "4";   
                     } 
                     elseif($index == 3){
                      echo mostrarEstrellas(2); 
                       //echo "4";   
                       }  
                       elseif($index == 4){
                        echo mostrarEstrellas(1); 
                         //echo "4";   
                         }   
                  ?>
                </td> 
                  
                
                <td>
            <a href="#" class="product-link" farmaciaId="<?= $data['farmaciaId']; ?>" medicinaId="<?= $data['medicinaId']; ?>">Ver Detalle
                </a>
                </td>
            </tr>

          <?php endforeach; ?>
        <?php else: ?>
            <li>No se encontraron resultados intenta con otra palabra </li>
        <?php endif; ?>

        <div class= "left-div">
        <img src="<?php echo $data['imagepath']; ?>" class="imgMedicinas">
        <a>Imagen Ilustrativa</a>
  </div>
</div>
</div>

    </tbody>
  </table>
</div>

    </ul>
</body>
</html>





