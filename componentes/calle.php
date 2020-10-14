<?php 
	require "../conexion/conexion.php";

	$sql = "SELECT * from parada";

	$result = mysqli_query($mysqli, $sql);
 ?>
 
		<select id="calle" class="form-control input-sm">
			<option value="0">Calle</option>
			<?php
				while($ver=mysqli_fetch_row($result)): 
			 ?>
				<option value="<?php echo $ver[0] ?>">
					<?php echo $ver[1]?>
				</option>

			<?php endwhile; ?>

		</select>