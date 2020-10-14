<?php
	require '../conexion/conexion.php';

	$placa = $_POST["placa"];
	$incidencia = $_POST["incidencia"];
	$coste = $_POST["coste"];
	$descripcion = $_POST["descripcion"];

	$sql = "insert into incidencia_autobus (cod_autobus, id_incidencia, fecha, coste, descripcion) values ($placa,$incidencia,curdate(),$coste,'$descripcion')";

	$query = mysqli_query($mysqli, $sql);

	if($query){
		?>
		<div class='alert alert-success alert-dismissible fade show'>
    		<button type='button' class='close' data-dismiss='alert'>&times;</button>
    		<strong>Éxito!</strong>Incidencia registrada exitosamente.
  		</div>
		<?php
	}else{
		?>
		<div class='alert alert-danger alert-dismissible fade show'>
    		<button type='button' class='close' data-dismiss='alert'>&times;</button>
    		<strong>Error!</strong>La incidencia no pudo ser registrada.
  		</div>
		<?php
	}
?>