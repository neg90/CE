<?php

class categoria {
	//Atributos
	private $idcategoria;
	private $descripcion;
	
	public function	__construct($idcategoria,$descripcion) {
	
		$this->idcategoria = $idcategoria;
		$this->idmedidor = $idmedidor;
		
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