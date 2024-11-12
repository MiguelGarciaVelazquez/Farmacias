<?php
require_once 'app/controller/FarmaciaController.php';

$controller = new FarmaciaController();

$action = isset($_GET['action']) ? $_GET['action'] : 'index';
//$id = isset($_GET['id']) ? $_GET['id'] : null;
//$action = isset($_GET['action']) ? $_GET['action'] : 'detail';

switch ($action) {
    case 'create':
        $controller->create();
        break;
    case 'edit':
        $controller->edit($id);
        break;
    case 'delete':
        $controller->delete($id);
        break;
    case 'search': // Acción de búsqueda
        $controller->search();
        break;
    case 'detail': // Acción de búsqueda
        $controller->detail();
        break;
    default:
        $controller->index();
        break;        
    }
?>

