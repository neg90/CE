<?php

require_once '../modelo/conexionDB.php';
require_once '../modelo/clases/categoria.php';

class PDORol extends categoria{
	

	public function	__construct ($idcategoria,$descripcion){
		
		parent::__construct($idcategoria,$descripciono);
	
	}