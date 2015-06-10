<?php
	require_once ('../modelo/conexionDB.php');
	require_once ('../modelo/PDO/PDOcategoria.php');
	
	// Alta de categoria
	

	if (isset($_POST['var1'])) {
		$descripcion = $_POST['var1'];
		if ($descripcion == 'aldorico') {
			# code...
		
		$neg = $_POST['var2'];

		//el 1 al cohete
		if (!empty($descripcion)) {
			$unaCategoria = new PDOcategoria (0,$neg);
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
	}
		
	
?>	