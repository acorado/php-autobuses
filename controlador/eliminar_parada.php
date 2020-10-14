<?php
	require "../conexion/conexion.php";
	$id = $_POST['id'];

	$sql = "delete from parada_bus where id_paradaB = $id";

	$result = mysqli_query($mysqli, $sql);

	if($result){
		?>
		<div class='alert alert-danger alert-dismissible fade show'>
    		<button type='button' class='close' data-dismiss='alert'>&times;</button>
    		<strong>Eliminado!</strong>Eliminado exitosamente.
  		</div>
		<?php
	}else{
		?>
		<div class='alert alert-warning alert-dismissible fade show'>
    		<button type='button' class='close' data-dismiss='alert'>&times;</button>
    		<strong>Error!</strong>Hubo problemas al intentar eliminar el registro.
  		</div>
		<?php
	}
?>