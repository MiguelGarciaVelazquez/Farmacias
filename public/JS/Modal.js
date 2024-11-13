document.addEventListener('DOMContentLoaded', function() {
    // Declarar popup fuera del event listener para mantener su referencia
    let popup = null;

    document.querySelectorAll('.product-link').forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            var farmaciaId = this.getAttribute('farmaciaId');
            var medicinaId = this.getAttribute('medicinaId');

            // Cerrar el popup actual si está abierto
            if (popup && !popup.closed) {
                popup.close();
            }

            // Hacer la solicitud para obtener los detalles del producto
            fetch(`index.php?controller=FarmaciaController&action=detail&farmaciaId=${farmaciaId}&medicinaId=${medicinaId}`)
                .then(response => response.text())
                .then(data => {
                    // Abrir un nuevo popup y escribir el contenido recibido
                    popup = window.open("", "Product Detail", "width=600,height=500");
                    popup.document.write(data);
                    popup.document.close(); // Necesario para cargar correctamente el contenido
                })
                .catch(error => console.error('Error:', error));
        });
    });
});
