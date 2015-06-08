<?php

class rol {
	//Atributos
	private $idrol;
	private $nombre;
	private $idpermiso;
	
	

	public function	__construct ($idrol,$nombre,$idpermiso) {
		//Se crea activo el user
		$this->idrol = $idrol;
		$this->nombre = $nombre;
		$this->idpermiso = $idpermiso;
	
	}

	//id
	public function getIdrol(){
		return $this->idrol;
	}

	//nombre
	public function getNombre(){
		return $this->nombre;
	}

	public function setNombre($nombre){
		$this->nombre = $nombre;
		return $this;
	}

	//idpermiso
	public function getIdpermiso(){
		return $this->idpermiso;
	}

	public function setIdpermiso($idpermiso){
		$this->idpermiso = $idpermiso;
		return $this;
	}
}
?>