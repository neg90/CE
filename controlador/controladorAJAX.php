<?php
	require_once ('../modelo/conexionDB.php');
	require_once ('../modelo/PDO/PDOcategoria.php');
	
	// Alta de categoria
	if (isset($_POST['accion'])) {
		$descripcion = $_POST['accion'];
		//el 1 al cohete
		if (!empty($descripcion)) {
			$unaCategoria = new PDOcategoria (0,$descripcion);
			$unaCategoria->guardar();
			$arreglo = [1=>$unaCategoria->getDescripcion(),2=>$unaCategoria->getIdcategoria()];
			if($unaCategoria){
				//$obj = json_encode($unaCategoria->getDescripcion());
				$mensaje = json_encode($arreglo);
				print $mensaje; 
			}
		}else{
			$arreglo = [1=>'vacio'];
			$mensaje = json_encode($arreglo);
			print $mensaje; 
		}
		
	}
		
	
?>	