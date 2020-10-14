<?php
	require '../conexion/conexion.php';

	$codigo = $_POST["codigo"];
	$dispositivo = $_POST["dispositivo"];
	$precio = $_POST["precio"];
	$descripcion = $_POST["descripcion"];

	$sql = "insert into dispositivo (cod_dispositivo, nombre_dispositivo, precio, descripcion) values ($codigo,'$dispositivo',$precio,'$descripcion')";

	$query = mysqli_query($mysqli, $sql);

	if($query){
		?>
		<div class='alert alert-success alert-dismissible fade show'>
    		<button type='button' class='close' data-dismiss='alert'>&times;</button>
    		<strong>Éxito!</strong>Dispositivo registrado exitosamente.
  		</div>
		<?php
	}else{
		?>
		<div class='alert alert-danger alert-dismissible fade show'>
    		<button type='button' class='close' data-dismiss='alert'>&times;</button>
    		<strong>Error!</strong>El dispositivo no pudo ser registrado.
  		</div>
		<?php
	}
?>