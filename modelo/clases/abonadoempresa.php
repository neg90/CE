<?php

class abonadoempresa {
	//Atributos
	private $id;
	private $numabonado;
	private $idempresa;

	
	public function	__construct($id,$numabonado,$idempresa) {
		$this->id = $id;
		$this->numabonado = $numabonado;
		$this->idempresa = $idempresa;
	}

	public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getNumabonado(){
		return $this->numabonado;
	}

	public function setNumabonado($numabonado){
		$this->numabonado = $numabonado;
	}

	public function getIdempresa(){
		return $this->idempresa;
	}

	public function setIdempresa($idempresa){
		$this->idempresa = $idempresa;
	}


}
?>