<?php
	require '../conexion/conexion.php';
	$placa = $_POST["placa"];
	$calle = $_POST["calle"];
	$zona = $_POST["zona"];
	$llegada = $_POST["llegada"];

	
	$sql = "insert into parada_bus (cod_autobus,id_parada, hora_llegada, id_zona) values ($placa,$calle,'$llegada',$zona)";

	$query = mysqli_query($mysqli, $sql);

	if($query){
		?>
		<div class='alert alert-success alert-dismissible fade show'>
    		<button type='button' class='close' data-dismiss='alert'>&times;</button>
    		<strong>Éxito!</strong>Parada asignada con exito.
  		</div>
		<?php
	}else{
		?>
		<div class='alert alert-danger alert-dismissible fade show'>
    		<button type='button' class='close' data-dismiss='alert'>&times;</button>
    		<strong>Error!</strong>La parada no puede ser asignada.
  		</div>
		<?php
	}
?>