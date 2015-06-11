<?php

class telefonoempresa {
	//Atributos
	private $id;
	private $idempresa;
	private $telefono;
	private $descripcion;
	
	public function	__construct($id,$idempresa,$telefono,$descripcion) {
	
		$this->id = $id;
		$this->idempresa = $idempresa;
		$this->telefono = $telefono;
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
		return $this->telefono;
	}

	public function setTelefono($telefono){
		$this->telefono = $telefono;
	}

	public function getDescripcion(){
		return $this->descripcion;
	}

	public function setDescripcion($descripcion){
		$this->descripcion = $descripcion;
	}

	
	
}

?>