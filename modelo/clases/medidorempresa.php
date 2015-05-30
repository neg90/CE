<?php

class medidorempresa {
	//Atributos
	private $id;
	private $idmedidor;
	private $idempresa;
	
	

	public function	__construct($id,$idmedidor,$idempresa) {
	
		$this->id = $id;
		$this->idmedidor = $idmedidor;
		$this->idempresa = $idempresa;
		
	}

	public function getId(){
		return $this->id;
	}

	public function getIdmedidor(){
		return $this->idmedidor;
	}

	public function setIdmedidor($idmedidor){
		$this->idmedidor = $idmedidor;
	}

	public function getIdempresa(){
		return $this->idempresa;
	}

	public function setIdempresa($idempresa){
		$this->idempresa = $idempresa;
	}

}
?>