<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/contacto.php';

class PDOcontacto extends contacto{
	

	public function __construct ($nombre,$apellido,$telefono,$domicilio,$correo,$asociadosm){

		parent::__construct($nombre,$apellido,$telefono,$domicilio,$correo,$asociadosm);
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
      telefono = :telefono and domicilio = :domicilio)');
      
      $consulta->bindParam(':nombre', $this->getNombre());
      $consulta->bindParam(':apellido', $this->getApellido());
      $consulta->bindParam(':telefono', $this->getTelefono());
      $consulta->bindParam(':domicilio', $this->getDomicilio());
      
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
         telefono = :telefono, domicilio = :domicilio, correo = :correo, asociadosm = :asociadosm, activo = :activo WHERE idcontacto = :idcontacto');
         
         $consulta->bindParam(':nombre', $this->getNombre());
         $consulta->bindParam(':apellido', $this->getApellido());
         $consulta->bindParam(':telefono', $this->getTelefono());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':correo', $this->getCorreo());
         $consulta->bindParam(':asociadosm', $this->getAsociadosm());
         $consulta->bindParam(':activo', $this->getActivo());
         $consulta->bindParam(':idcontacto', $this->getIdcontacto());
         $consulta->execute();

      }else /*si no tiene id es un campo mas apra la tabla.*/ {
      	
         $consulta = $conexion->prepare('INSERT INTO contacto (nombre, apellido, telefono, domicilio, correo, asociadosm, activo) 
         VALUES(:nombre,:apellido,:telefono,:domicilio,:correo,:asociadosm,:activo)');
         
         
         $consulta->bindParam(':nombre', $this->getNombre());
         $consulta->bindParam(':apellido', $this->getApellido());
         $consulta->bindParam(':telefono', $this->getTelefono());
         $consulta->bindParam(':domicilio', $this->getDomicilio());
         $consulta->bindParam(':correo', $this->getCorreo());
         $consulta->bindParam(':asociadosm', $this->getAsociadosm());
         $consulta->bindParam(':activo', $this->getActivo());

         $consulta->execute();
         
      }

      $conexion = null;
   }

	
}
?>