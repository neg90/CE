<?php

class categoria {
	//Atributos
	private $idcategoria;
	private $descripcion;
	
	public function	__construct($descripcion) {
	
	
		$this->descripcion = $descripcion;
		
	}

	public function getIdcategoria(){
		return $this->idcategoria;
	}

	public function getDescripcion(){
		return $this->descripcion;
	}

	public function setDescripcion($descripcion){
		$this->descripcion = $descripcion;
	}
	
}

?>