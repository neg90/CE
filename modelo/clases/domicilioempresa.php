<?php

class domicilioempresa {
	//Atributos
	private $id;
	private $idempresa;
	private $domicilio;
	private $descripcion;
	
	public function	__construct($id,$idempresa,$domicilio,$descripcion) {
	
		$this->id = $id;
		$this->idempresa = $idempresa;
		$this->domicilio = $domicilio;
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
		return $this->domicilio;
	}

	public function setTelefono($domicilio){
		$this->domicilio = $domicilio;
	}

	public function getDescripcion(){
		return $this->descripcion;
	}

	public function setDescripcion($descripcion){
		$this->descripcion = $descripcion;
	}
	
}

?>