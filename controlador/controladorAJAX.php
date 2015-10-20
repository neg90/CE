<?php
	require_once ('../modelo/conexionDB.php');
	require_once ('../modelo/PDO/PDOcategoria.php');
	require_once ('../modelo/PDO/PDOrubro.php');
	

	//Ajax
	$entidad = htmlEntities(@$_POST['entidad']);
	$accion = htmlEntities(@$_POST['accion']);
	//Lo dejo aca por que es mismo campo para rubro o categoria
	$descripcion = htmlentities(@$_POST['descripcion']);

	if( $entidad == 'categoria'){
		if($accion == 'insertar'){
			if (!empty($descripcion)){
				//valido que no exista una igual
				$unaCategoria = new PDOcategoria (0,$descripcion);
				if($unaCategoria->validarInsertar()){
					$unaCategoria->guardar();
					//Busco id
					$unaCategoria = PDOcategoria::buscarID($descripcion);
					//Guardo en el array
					$arreglo = [1=>$unaCategoria->getDescripcion(),2=>$unaCategoria->getIdcategoria(),3=>'ok',4=>'categoria'];
					//json a la vista
					$mensaje = json_encode($arreglo);
					print $mensaje; 
				}else{
					//ya existe la entidad
					$arreglo = [3=>'existe',4=>'categoria'];
					$mensaje = json_encode($arreglo);
					print $mensaje; 
				}
			}else{
				//Esta vacio el campo :/
				$arreglo = [3=>'vacio',4=>'categoria'];
				$mensaje = json_encode($arreglo);
				print $mensaje; 
			}
			
		}
	}elseif ($entidad == 'rubro') {
		if($accion == 'insertar'){
			if (!empty($descripcion)){
				//valido que no exista una igual
				$unRubro = new PDOrubro (0,$descripcion);
				if($unRubro->validarInsertar()){
					$unRubro->guardar();
					//Busco id
					$unRubro = PDOrubro::buscarID($descripcion);
					//Guardo en el array
					$arreglo = [1=>$unRubro->getDescripcion(),2=>$unRubro->getIdrubro(),3=>'ok',4=>'rubro'];
					//json a la vista
					$mensaje = json_encode($arreglo);
					print $mensaje; 
				}else{
					//ya existe la entidad
					$arreglo = [3=>'existe',4=>'rubro'];
					$mensaje = json_encode($arreglo);
					print $mensaje; 
				}
			}else{
				//Esta vacio el campo :/
				$arreglo = [3=>'vacio',4=>'rubro'];
				$mensaje = json_encode($arreglo);
				print $mensaje; 
			}
			
		}
	}

		
	
?>	