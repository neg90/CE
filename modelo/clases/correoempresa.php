<?php

class correoempresa {
	//Atributos
	private $id;
	private $idempresa;
	private $correo;
	private $descripcion;
	
	public function	__construct($id,$idempresa,$correo,$descripcion) {
	
		$this->id = $id;
		$this->idempresa = $idempresa;
		$this->correo = $correo;
		$this->descripcion = $descripcion;
		
	}

	public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getIdempresa(){
		return $this->idempresa;
	}

	public function setIdempresa($idempresa){
		$this->idempresa = $idempresa;
	}

	public function getTelefono(){
		return $this->correo;
	}

	public function setTelefono($correo){
		$this->correo = $correo;
	}

	public function getDescripcion(){
		return $this->descripcion;
	}

	public function setDescripcion($descripcion){
		$this->descripcion = $descripcion;
	}
	
}

?>