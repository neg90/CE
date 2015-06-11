<?php

class medidor {
	//Atributos
	private $idmedidor;
	private $nomyap;
	private $telefono;
	private $domicilio;
	private $importepago;
	private $numusuario;
	private $numsuministro;
	private $activo;
	

	public function	__construct($id,$idcontacto,$nomyap,$telefono,$domicilio,$importepago,$numusuario,$numsuministro,$activo) {
	
		$this->idcontacto = $idcontacto;
		
		$this->nomyap = $nomyap;
		$this->telefono = $telefono;
		$this->domicilio = $domicilio;
		$this->importepago = $importepago;
		$this->numusuario = $numusuario;
		$this->numsuministro = $numsuministro;
		$this->activo = $activo;
	
	}

	public function getIdmedidor(){
		return $this->idmedidor;
	}

	public function getNomyap(){
		return $this->nomyap;
	}

	public function setNomyap($nomyap){
		$this->nomyap = $nomyap;
	}

	public function getTelefono(){
		return $this->telefono;
	}

	public function setTelefono($telefono){
		$this->telefono = $telefono;
	}

	public function getDomicilio(){
		return $this->domicilio;
	}

	public function setDomicilio($domicilio){
		$this->domicilio = $domicilio;
	}

	public function getImportepago(){
		return $this->importepago;
	}

	public function setImportepago($importepago){
		$this->importepago = $importepago;
	}

	public function getNumusuario(){
		return $this->numusuario;
	}

	public function setNumusuario($numusuario){
		$this->numusuario = $numusuario;
	}

	public function getNumsuministro(){
		return $this->numsuministro;
	}

	public function setNumsuministro($numsuministro){
		$this->numsuministro = $numsuministro;
	}

	public function getActivo(){
		return $this->activo;
	}

	public function setActivo($activo){
		$this->activo = $activo;
	}

	

}
?>