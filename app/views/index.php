<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        #map {
            height: 350px;
            width: 100%;
        }
    </style>


</head>
<body>
    <!--  <h1>Usuarios</h1>
    <a href="index.php?action=create"></a>
   -->


   <h2>Mapa de tu ubicación actual</h2>
<p id="location">Cargando ubicación...</p>
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
            const lat = position.coords.latitude;
            const lng = position.coords.longitude;

            // Mostramos las coordenadas en la página
           // document.getElementById('location').innerHTML = `Latitud: ${lat}, Longitud: ${lng}`;

            // Inicializamos el mapa de Google con las coordenadas
            const location = { lat, lng };
            const map = new google.maps.Map(document.getElementById('map'), {
                zoom: 14,
                center: location
            });

            // Añadir un marcador en la ubicación del usuario
            new google.maps.Marker({
                position: location,
                map: map
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


<!-- Cargar la API de Google Maps con tu clave API 

<script>
  (g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
    key: "AIzaSyARReNuO0l6nVS1hWSdmVenhrkSyYI1AdE",
    v: "weekly",
    // Use the 'v' parameter to indicate the version to use (weekly, beta, alpha, etc.).
    // Add other bootstrap parameters as needed, using camel case.
  });
</script>-->

    <ul>

    <!-- Formulario de búsqueda -->
    <div class="search-container">
    <form method="GET" action="index.php">
        <input type="hidden" name="action" value="search">
        <input type="text" name="keyword" placeholder="Buscar por nombre, tipo o compuesto" class="search-input">
        <input type="submit" value="Buscar"  class="btn-custom">
    </form>
    </div>

    <h1>Medicamentos Top</h1>
    <link rel="stylesheet" type="text/css" href="http://localhost/mvc/public/css/tableStyles.css">
  <table class="styled-table">
    <thead>
      <th>id</th>
      <th>Nombre</th>
      <th>Descripcion</th>
      <th>Tipo</th>
      <th>Receta</th>
    </thead>
    <tbody>

    <?php if (count($data) > 0): ?>
      <?php foreach ($data as $data): ?>
            <tr>
                <td><?= $data['Id']; ?></td>
                <td><?= $data['Nombre']; ?></td>
                <td><?= $data['Descripcion']; ?></td>
                <td><?= $data['Tipo']; ?></td>
                <td>
                    <?php if($data['Receta'] == 1){ 
                    echo "Si";
                }  
                   elseif($data['Receta'] ==  0){
                    echo "No";   
                   }  
                   ?>
                </td>
            </tr>
          <?php endforeach; ?>
        <?php else: ?>
            <li>No se encontraron resultados.</li>
        <?php endif; ?>

    </tbody>
  </table>
    </ul>
</body>
</html>
