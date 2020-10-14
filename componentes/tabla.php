<?php 
	session_start();
	require "../conexion/conexion.php";

 ?>
<div class="container row">
	<div class="col-sm-12">
	<h4 class="display-8">Paradas Asignadas</h4>
	<div class="table-responsive-sm">
		<table class="table">
		
		<thead class="thead-light">
			<tr>
				<td>No Placa</td>
				<td>Calle</td>
				<td>Zona</td>
				<td>Hora Llegada</td>
				<td>Editar</td>
				<td>Eliminar</td>
			</tr>
		</thead>
			

			<?php 
			$placa = $_SESSION['consulta'];

				
					$sql = "call listado_paradas($placa)";

				$result=mysqli_query($mysqli,$sql);
				while($ver=mysqli_fetch_row($result)){ 

					$datos=$ver[0]."||".
						   $ver[1]."||".
						   $ver[2]."||".
						   $ver[3]."||".
						   $ver[4];
			 ?>

			<tr>
				<td><?php echo $ver[1] ?></td>
				<td><?php echo $ver[2] ?></td>
				<td><?php echo $ver[3] ?></td>
				<td><?php echo $ver[4] ?></td>
				<td>
					<button class="btn btn-warning btn-sm glyphicon glyphicon-pencil" data-toggle="modal" data-target="#modalEdicion" onclick="agregaform('<?php echo $datos ?>')">Editar
						
					</button>
				</td>
				<td>
					<button class="btn btn-danger btn-sm glyphicon glyphicon-remove" 
					onclick="eliminar_parada('<?php echo $ver[0] ?>')">Eliminar
						
					</button>
				</td>
			</tr>
			<?php 
		}
			 ?>
		</table>
	</div>
	</div>
</div>




