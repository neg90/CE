<?php

require_once '../modelo/clases/usuario.php';
require_once '../modelo/clases/PDOusuario.php';


static function listar(){
		$NombreUsuario=$_SESSION['user'];
  		$rol=($_SESSION['rol']);
		Twig_Autoloader::register();
		$loader = new Twig_Loader_Filesystem('../vista');
		$twig = new Twig_Environment($loader, array(
		//'cache' => '../cache','
		'debug' => 'false'
		));

		$Usuarios=PDOusuario::listarUsuarios();

		if (!empty($Usuarios)) {
			for ($i=0; $i<count($Usuarios);$i++){
				$NombreRol=PDOrol::obtenerNombreRol($Usuarios[$i][5]);
				$Persona=PDOpersona::buscarPersonaPorID($Usuarios[$i][6]);

				/*var_dump($Persona);
				die (
					'Usuario: ' . $Usuarios[$i][0] . '</br>' .
					'Nombre: ' . $Persona[1] . '</br>' .
					'Apellido: ' . $Persona[2] . '</br>' .
					'DNI: ' . $Persona[3] . '</br>' .
					'Email: ' . $Usuarios[$i][1] . '</br>' .
					'NombreRol: ' . $NombreRol . '</br>' .
					'Activo: ' . $Usuarios[$i][3]
					);
				*/
			

				$ListaUsuarios[$i]=Array('id'=>$Usuarios[$i][4],'Usuario'=>$Usuarios[$i][0],'Nombre'=>$Persona[1],
										'Apellido'=>$Persona[2],'DNI'=>$Persona[3],
										'Email'=>$Usuarios[$i][1],'NombreRol'=>$NombreRol[0],
										'Activo'=>$Usuarios[$i][3]);
			}
		}
		else {
			$Usuarios=null;
		}



		$template = $twig->loadTemplate('Usuario/listar.html.twig');
		echo $template->render(array('rol'=>$rol,'NombreUsuario'=>$NombreUsuario,'ListaUsuarios'=>$ListaUsuarios));	
	}

?>