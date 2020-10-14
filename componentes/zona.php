<?php 
	require "../conexion/conexion.php";

	$sql = "SELECT id_zona, zona from zona";

	$result = mysqli_query($mysqli, $sql);
 ?>
 
		<select id="zona" class="form-control input-sm">
			<option value="0">Zona</option>
			<?php
				while($ver=mysqli_fetch_row($result)): 
			 ?>
				<option value="<?php echo $ver[0] ?>">
					<?php echo $ver[1]?>
				</option>

			<?php endwhile; ?>

		</select>