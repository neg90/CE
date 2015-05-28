<?php

class rol {
	//Atributos
	private $id;
	private $nombre;
	private $idpermiso;
	
	

	public function	__construct ($id,$nombre,$idpermiso) {
		//Se crea activo el user
		$this->id = $id;
		$this->nombre = $nombre;
		$this->idpermiso = $idpermiso;
	
	}

	//id
	public function getId(){
		return $this->id;
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
		return $this->idpermisos;
	}

	public function setIdpermiso($idpermiso){
		$this->idpermiso = $idpermiso;
		return $this;
	}
}
?>