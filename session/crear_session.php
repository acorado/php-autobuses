<?php 
	session_start();

	$placa=$_POST['p'];

	$_SESSION['consulta']=$placa;

 ?>