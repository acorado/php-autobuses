<?php 
	require "../conexion/conexion.php";

	$sql = "select id_modelo, modelo from modelo";

	$result = mysqli_query($mysqli, $sql);
 ?>
 
		<select id="modelo" class="form-control input-sm">
			<option value="0">Selecionar Modelo</option>
			<?php
				while($ver=mysqli_fetch_row($result)): 
			 ?>
				<option value="<?php echo $ver[0] ?>">
					<?php echo $ver[1]?>
				</option>

			<?php endwhile; ?>

		</select>