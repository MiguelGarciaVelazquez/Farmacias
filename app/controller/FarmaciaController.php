<?php
require_once 'app/model/Farmacia.php';

class FarmaciaController {
    private $MedicinaModel;

    public function __construct() {
        $this->MedicinaModel = new User();
    }

    public function index() {
        $data = $this->MedicinaModel->getMedicamentosTOP();
        require 'app/views/index.php';
    }

    public function search() {
        $keyword = isset($_GET['keyword']) ?  $_GET['keyword'] : '';
        $data = $this->MedicinaModel->searchMedicamento($keyword);
        require 'app/views/busqueda.php';
    }

        public function detalleFarmacia() {
            $farmaciaId = $_GET['farmaciaId'] ?? null;
            $medicinaId = $_GET['medicinaId'] ?? null;

            
    
            // Validación básica de los IDs
            if ($farmaciaId && $medicinaId) {
                //$detalle = $this->MedicinaModel->obtenerDetalleFarmacia($farmaciaId, $medicinaId);
                $detalle = User::obtenerDetalle($farmaciaId, $medicinaId);
                if ($detalle) {
                    // Cargar una vista parcial con el detalle del producto
                    require 'app/views/detalle.php';
                } else {
                    echo "Medicamento no encontrado.";
                }
            } else {
                echo "ID de farmacia o medicina no especificado.";
            }
        }

            public function detail() {
                $farmaciaId = $_GET['farmaciaId'] ?? null;
                $medicinaId = $_GET['medicinaId'] ?? null;
                
                if ($farmaciaId === null || $medicinaId === null) {
                    echo "Parámetros inválidos.";
                    return; // Salir del método si los parámetros no son válidos
                }
                // Obtener los detalles del producto desde el modelo
                $detalle = $this->MedicinaModel->getProductDetail($farmaciaId, $medicinaId);
                
                if (!$detalle) {
                    echo "No se encontraron detalles para el producto.";
                    return; // Salir si no se encontró el producto
                }
                // Cargar la vista con los detalles del producto
                require 'app/views/detalle.php';
            }        


    public function create() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $this->MedicinaModel->createUser($_POST['name'], $_POST['email']);
            header("Location: index.php");
        }
        require 'app/views/create.php';
    }

    public function edit($id, $data) {
        $this->MedicinaModel->id = $id;
        $this->MedicinaModel->name = $data['name'];
        $this->MedicinaModel->description = $data['description'];
        $this->MedicinaModel->price = $data['price'];
        $this->MedicinaModel->update();
        header("Location: /public/index.php");
    }

    public function delete($id) {
        $this->MedicinaModel->id = $id;
        $this->MedicinaModel->delete();
        header("Location: /public/index.php");
    }
}
?>


