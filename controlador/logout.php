<?php
	session_start();
	session_destroy();

	//require_once('admin.php');
	header("Location:../index.php");
?>