
<?php 
	require "../conexion/conexion.php";

 ?>
<div class="row">
	<div class="col-sm-12">
	<h2>Listado de Buses</h2>
	<div class="table-responsive-sm">
		<table class="table">
		<caption>
			<button class="btn btn-primary" data-toggle="modal" data-target="#modalNuevo">
				Agregar nuevo 
				<span class="glyphicon glyphicon-plus"></span>
			</button>
		</caption>
		<thead class="thead-light">
			<tr>
				<th>No Placa</th>
				<th>CC</th>
				<th>Color</th>
				<th>Modelo</th>
				<th>Capacidad</th>
				<th>Editar</th>
				<th>Eliminar</th>
			</tr>
		</thead>
			

			<?php 

				
					$sql = "SELECT autobus.cod_autobus, autobus.No_Placa, autobus.cc, color.color, modelo.Modelo, capacidad.cantidad\n"

    . "			from autobus inner join color on color.id_color = autobus.Id_color inner join modelo on modelo.Id_Modelo = autobus.Id_Modelo INNER JOIN capacidad on capacidad.id_capacidad = modelo.id_capacidad";

				$result=mysqli_query($mysqli,$sql);
				while($ver=mysqli_fetch_row($result)){ 

					$datos=$ver[0]."||".
						   $ver[1]."||".
						   $ver[2]."||".
						   $ver[3]."||".
						   $ver[4]."||".
						   $ver[5];
			 ?>

			<tr>
				<td><?php echo $ver[1] ?></td>
				<td><?php echo $ver[2] ?></td>
				<td><?php echo $ver[3] ?></td>
				<td><?php echo $ver[4] ?></td>
				<td><?php echo $ver[5] ?></td>
				<td>
					<button class="btn btn-warning glyphicon glyphicon-pencil" data-toggle="modal" data-target="#modalEdicion" onclick="agregaform('<?php echo $datos ?>')">
						
					</button>
				</td>
				<td>
					<button class="btn btn-danger glyphicon glyphicon-remove" 
					onclick="preguntarSiNo('<?php echo $ver[0] ?>')">
						
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