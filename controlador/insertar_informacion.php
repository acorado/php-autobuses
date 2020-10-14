<?php
	require '../conexion/conexion.php';
	$color = $_POST['color'];
	$placa = $_POST['placa'];
	$n_motor = $_POST['n_motor'];
	$modelo = $_POST['modelo'];
	$cc = $_POST['cc'];
	$n_chasis = $_POST['n_chasis'];


	$sql = "INSERT into autobus (No_Placa,Id_Modelo,Id_color,no_motor,no_chasis,cc) VALUES('$placa',$modelo,$color,$n_motor,$n_chasis,$cc)";

	$query = mysqli_query($mysqli, $sql);
	if($query){
		?>
		<div class='alert alert-success alert-dismissible fade show'>
    		<button type='button' class='close' data-dismiss='alert'>&times;</button>
    		<strong>Éxito!</strong>Almacenado correctamente.
  		</div>
  		<?php
	}else{
		?>
		<div class='alert alert-danger alert-dismissible fade show'>
    		<button type='button' class='close' data-dismiss='alert'>&times;</button>
    		<strong>Error!</strong>La información no puede ser registrada.
  		</div>
  		<?php
	}

?>