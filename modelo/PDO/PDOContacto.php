<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/contacto.php';

class PDOcontacto extends contacto{
	

	public function __construct ($idcontacto,$nombre,$apellido,$telefono,$domicilio,$correo,$asociadosm,$tipodocumento,$documento){

		parent::__construct($idcontacto,$nombre,$apellido,$telefono,$domicilio,$correo,$asociadosm,$tipodocumento,$documento);
	}

	
	public static function listar(){
		try {$conexion = new conexion;}catch (PDOException $e){}
		$consulta = $conexion->prepare('SELECT * FROM contacto');
		$consulta->execute();
		$objeto = $consulta->fetchAll(PDO::FETCH_OBJ);
		
		return $objeto;
	}

   public function validarInsertar(){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM contacto WHERE (nombre = :nombre and apellido = :apellido and 
      telefono = :telefono and domicilio = :domicilio and tipodocumento = :tipodocumento and documento = :documento and correo = :correo)');
      
      
      $consulta->bindParam(':nombre', $this->getNombre());
      $consulta->bindParam(':apellido', $this->getApellido());
      $consulta->bindParam(':telefono', $this->getTelefono());
      $consulta->bindParam(':domicilio', $this->getDomicilio());
      $consulta->bindParam(':tipodocumento', $this->getTipodocumento());
      $consulta->bindParam(':documento', $this->getDocumento());
      $consulta->bindParam(':correo',$this->getCorreo());


      $consulta->execute();

      $objeto = $consulta->fetch(PDO::FETCH_OBJ);
      if ($objeto) {
         //Si el array de obejtos viene cargado
         return false;
      }else{
         return true;
      }

   }

	public function guardar(){
      try {$conexion = new conexion;}catch (PDOException $e){}
      
      if($this->getIdcontacto()) /*Si tiene id entonces existe y solo lo modifico*/ {
         $consulta = $conexion->prepare('UPDATE contacto SET nombre = :nombre, apellido = :apellido, 
         telefono = :telefono, domicilio = :domicilio, correo = :correo, asociadosm = :asociadosm, activo = :activo, tipodocumento = :tipodocumento, 
         documento = :documento WHERE idcontacto = :idcontacto');
         
         $consulta->bindParam(':nombre', $this->getNombre());
         $consulta->bindParam(':apellido', $this->getApellido());
         $consulta->bindParam(':telefono', $this->getTelefono());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':correo', $this->getCorreo());
         $consulta->bindParam(':asociadosm', $this->getAsociadosm());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->bindParam(':idcontacto', $this->getIdcontacto());
         $consulta->bindParam(':tipodocumento', $this->getTipodocumento());
         $consulta->bindParam(':documento', $this->getDocumento());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
         
         $consulta = $conexion->prepare('INSERT INTO contacto (nombre, apellido, telefono, domicilio, correo, asociadosm, activo,
         tipodocumento, documento) VALUES(:nombre,:apellido,:telefono,:domicilio,:correo,:asociadosm,:activo,:tipodocumento,:documento)');
         
         $consulta->bindParam(':nombre', $this->getNombre());
         $consulta->bindParam(':apellido', $this->getApellido());
         $consulta->bindParam(':telefono', $this->getTelefono());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':correo', $this->getCorreo());
         $consulta->bindParam(':asociadosm', $this->getAsociadosm());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->bindParam(':tipodocumento', $this->getTipodocumento());
         $consulta->bindParam(':documento', $this->getDocumento());

         $consulta->execute();
         
      }

      $conexion = null;
   }

   public function buscarContacto ($idcontacto){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('SELECT * FROM contacto WHERE (idcontacto = :idcontacto)');
      
      $consulta->bindParam(':idcontacto', $idcontacto);
    
      $consulta->execute();

      $resultado = $consulta->fetch();
     
      $objeto = new PDOcontacto($resultado['idcontacto'],$resultado['nombre'],$resultado['apellido'],$resultado['telefono'],
      $resultado['domicilio'],$resultado['correo'],$resultado['asociadosm'],$resultado['tipodocumento'],$resultado['documento']);
      
      return $objeto;

   }

   public function baja($idcontacto){
      try {$conexion = new conexion;}catch (PDOException $e){} 
      $consulta = $conexion->prepare('DELETE FROM contacto WHERE idcontacto =  :idcontacto');

      $consulta->bindParam(':idcontacto', $idcontacto);
    
      $consulta->execute();
      
   }
	
}
?>