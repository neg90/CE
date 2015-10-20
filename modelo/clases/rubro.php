<?php

class rubro {
	//Atributos
	private $idrubro;
	private $descripcion;
	
	public function	__construct($idrubro,$descripcion) {
	
		$this->idrubro = $idrubro;
		$this->descripcion = $descripcion;
		
	}

	public function getIdrubro(){
		return $this->idrubro;
	}

	public function getDescripcion(){
		return $this->descripcion;
	}

	public function setDescripcion($descripcion){
		$this->descripcion = $descripcion;
	}

}
?>