<?php

		if (empty(htmlentities($_GET['aviso'])))
			$_SESSION['error'] = 0;
		elseif (htmlentities($_GET['aviso'] == 1))
			$_SESSION['error'] = 1;
		elseif (htmlentities($_GET['aviso'] == 2))
			$_SESSION['error'] = 2;
		elseif (htmlentities($_GET['aviso'] == 3))
			$_SESSION['error'] = 3;
		elseif (htmlentities($_GET['aviso'] == 4))
			$_SESSION['error'] = 4;
		
		include_once('publico.php');
?>