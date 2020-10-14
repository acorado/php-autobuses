<?php

	$servidor = "localhost:3306";
	$usuario = "root";
	$password = "root";
	$database = "parabus";


	try {
		$mysqli = new MySQLi ($servidor, $usuario, $password, $database);
		
	} catch (Exception $e) {
		die("Fallo la conexion a la base de datos".mysqli_connect_error());
		
	}

		//servidor, usuario, contraseña, base de datos.
		//localhost,root,"",clinica
?>