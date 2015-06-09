<?php

class rol {
	//Atributos
	private $idrol;
	private $nombre;
	private $idpermisos;
	
	

	public function	__construct ($idrol,$nombre,$idpermisos) {
		//Se crea activo el user
		$this->idrol = $idrol;
		$this->nombre = $nombre;
		$this->idpermisos = $idpermisos;
	
	}

	//id
	public function getIdrol(){
		return $this->idrol;
	}

	public function setIdrol($idrol){
		return $this->idrol = $idrol;
	}

	//nombre
	public function getNombre(){
		return $this->nombre;
	}

	public function setNombre($nombre){
		$this->nombre = $nombre;
		return $this;
	}

	//idpermisos
	public function getIdpermisos(){
		return $this->idpermisos;
	}

	public function setIdpermisos($idpermisos){
		$this->idpermisos = $idpermisos;
		return $this;
	}
}
?>