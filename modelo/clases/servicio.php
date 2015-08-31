<?php

class servicio {
	//Atributos
	private $id;
	private $idempresarecibe;
	private $idempresaofrece;

	
	public function	__construct($id,$idempresarecibe,$idempresaofrece) {
	
		$this->id = $id;
		$this->idempresarecibe = $idempresarecibe;
		$this->idempresaofrece = $idempresaofrece;
		
	}

	public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getIdempresarecibe(){
		return $this->idempresarecibe;
	}

	public function setIdempresarecibe($idempresarecibe){
		$this->idempresarecibe = $idempresarecibe;
	}

	public function getIdempresaofrece(){
		return $this->idempresaofrece;
	}

	public function setIdempresaofrece($idempresaofrece){
		$this->idempresaofrece = $idempresaofrece;
	}
	
}

?>