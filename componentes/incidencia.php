<?php 
	require "../conexion/conexion.php";

	$sql = "SELECT* from incidencias";

	$result = mysqli_query($mysqli, $sql);
 ?>
 
		<select id="incidencia" class="form-control input-sm">
			<option value="0">Seleccionar incidencia</option>
			<?php
				while($ver=mysqli_fetch_row($result)): 
			 ?>
				<option value="<?php echo $ver[0] ?>">
					<?php echo $ver[1]?>
				</option>

			<?php endwhile; ?>

		</select>