<?php

class contactoempresa {
	//Atributos
	private $id;
	private $idcontacto;
	private $idempresa;
	
	

	public function	__construct($id,$idcontacto,$idempresa) {
	
		$this->id = $id;
		$this->idmedidor = $idmedidor;
		$this->idempresa = $idempresa;
		
	}

	public function getId(){
		return $this->id;
	}

	public function getIdcontacto(){
		return $this->idcontacto;
	}

	public function setIdcontacto($idcontacto){
		$this->idcontacto = $idcontacto;
	}

	public function getIdempresa(){
		return $this->idempresa;
	}

	public function setIdempresa($idempresa){
		$this->idempresa = $idempresa;
	}

}
?>