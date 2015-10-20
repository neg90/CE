<?php

class contactoempresa {
	//Atributos
	private $id;
	private $idcontacto;
	private $idempresa;
	private $relacion;
	
	

	public function	__construct($id,$idcontacto,$idempresa,$relacion) {
	
		$this->id = $id;
		$this->idcontacto = $idcontacto;
		$this->idempresa = $idempresa;
		$this->relacion = $relacion;
		
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

	public function getRelacion(){
		return $this->relacion;
	}

	public function setRelacion($relacion){
		$this->relacion = $relacion;
	}

}
?>