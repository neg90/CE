<?php
	session_start();
	if (htmlentities(isset($_GET['aviso']))){
		if (empty(htmlentities($_GET['aviso'])))
			$_SESSION['error'] = 0;
		elseif (htmlentities($_GET['aviso'] == 1)){
			$_SESSION['error'] = 1;
		}
		elseif (htmlentities($_GET['aviso'] == 2))
			$_SESSION['error'] = 2;
		elseif (htmlentities($_GET['aviso'] == 3))
			$_SESSION['error'] = 3;
		elseif (htmlentities($_GET['aviso'] == 4))
			$_SESSION['error'] = 4;
		elseif (htmlentities($_GET['aviso'] == 5))
			$_SESSION['error'] = 5;
	}
	else {
		$_SESSION['error'] = 0;
	}

	if (isset($_SESSION['user'])) {
		header("Location:privado.php?c=inicio&a=inicio");
	}

	include_once('publico.php');
?>