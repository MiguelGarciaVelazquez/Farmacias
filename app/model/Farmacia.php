<?php

require_once 'config/database.php';

class User {
    private $conn;
    private $table_name = "farmacia";
    private $table_Medicamentos = "medicinas";

    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();
    }

    //ontener los medicamentos top
        public function getMedicamentosTOP() {   ///productos TOP mas buscados
        $query = "SELECT * FROM  " . $this->table_Medicamentos. " LIMIT 10" ;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
   // Buscar medicamento por nombre tipo o descripcion
    public function searchMedicamento($keyword) {
        $query = "SELECT farmacia.id as farmaciaId,medicinas.Id as medicinaId,farmacia.Nombre as farmaciaNombre,medicinas.Nombre as medicinasNombre,
        medicinas.Tipo,medicinas.Precio,farmacia.ServicioDomicilio,farmacia.CostoServDomicilio,medicina_image.path as imagepath, 
        farmacia.Latitude as lat,farmacia.Longitude as lng
        FROM " . $this->table_name . " 
        LEFT JOIN medicinas ON farmacia.Id = medicinas.Id_Farmacia 
        LEFT JOIN medicina_image ON medicinas.Id_image = medicina_image.Id
        WHERE medicinas.Nombre LIKE ?  OR medicinas.Tipo LIKE ?
        order by farmacia.ServicioDomicilio DESC,farmacia.CostoServDomicilio ASC,medicinas.Precio ASC   LIMIT 5";
        $stmt = $this->conn->prepare($query);
        $keyword = "%" . $keyword . "%";
        $stmt->execute([$keyword, $keyword]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
        //Obtener el detalle de farmacia, el medicamento buscado
        public function getProductDetail($farmaciaId, $medicinaId) {
     
            $stmt = $this->conn->prepare("SELECT 
            farmacia.Nombre as farmaciaNombre,farmacia.Direccion as farmaciaDireccion,farmacia.Telefono as farmaciaTelefono,
            farmacia.NombreEncargado as farmaciaNombreEncargado,farmacia.Correo as farmaciaCorreo,medicinas.Nombre as medicinasNombre,
            medicinas.Existencias as medicinasExistencias,medicinas.Tipo as medicinasTipo,medicinas.Receta as medicinasReceta,  farmacia_logo.Path as logopath  
            FROM `farmacia`
            INNER JOIN medicinas ON medicinas.Id_Farmacia = farmacia.Id
            LEFT JOIN bancarios AS banco ON banco.Id_Farmacia = farmacia.Id
            INNER JOIN farmacia_logo on farmacia_logo.Id = farmacia.Id_Logo
            WHERE medicinas.Id_Farmacia = :farmaciaId AND medicinas.Id = :medicinaId");
    
        // Vincular los parámetros
        $stmt->bindParam(':farmaciaId', $farmaciaId, PDO::PARAM_INT);
        $stmt->bindParam(':medicinaId', $medicinaId, PDO::PARAM_INT); 
    
        // Ejecutar la consulta
        $stmt->execute();
    
        // Retornar el resultado como un objeto
        return $stmt->fetch(PDO::FETCH_OBJ);
    
    }

}
