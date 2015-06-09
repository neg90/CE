<?php

	require_once ('../modelo/conexionDB.php');
	require_once ('../modelo/PDO/PDOcategoria.php');
	
	
	$descripcion = $_POST['categoriaAJAX'];
	//el 1 al cohete
	$unaCategoria = new PDOcategoria ($descripcion);
	$unaCategoria->guardar();

	$arreglo = [1=>$unaCategoria->getDescripcion(),2=>$unaCategoria->getIdcategoria()];

	if($unaCategoria){

		//$obj = json_encode($unaCategoria->getDescripcion());
		$obj = json_encode($arreglo);
		print $obj; 

	}
?>	