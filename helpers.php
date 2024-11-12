
<?php
function mostrarEstrellas($calificacion) {
    $html = '';
    for ($i = 1; $i <= 5; $i++) {
        if ($i <= $calificacion) {
            $html .= '<img src="http://localhost/mvc/public/images/estrella.png" alt="Estrella llena" width="20">';
        } else {
            $html .= '<img src="http://localhost/mvc/public/images/starempty.png" alt="Estrella vacía" width="20">';
        }
    }
    return $html;
}