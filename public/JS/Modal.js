        
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.product-link').forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            var farmaciaId = this.getAttribute('farmaciaId');
            var medicinaId = this.getAttribute('medicinaId');
            var popup;
            
            fetch(`index.php?controller=FarmaciaController&action=detail&farmaciaId=${farmaciaId}&medicinaId=${medicinaId}`)
                .then(response => response.text())
                .then(data => {
                    // Mostrar los detalles en una ventana emergente
                    if (popup && !popup.closed) {
                        popup.close();
                    }
                    popup = window.open("", "Product Detail", "width=600,height=400");
                    popup.document.write(data);
                    
                });
        });
    });
});
