<?php 
	require "../conexion/conexion.php";

	$sql = "SELECT cod_autobus, No_Placa from autobus";

	$result = mysqli_query($mysqli, $sql);
 ?>
 
		<select id="placa" style="text-transform: uppercase;" class="form-control input-sm">
			<option value="0">Numero de Placa</option>
			<?php
				while($ver=mysqli_fetch_row($result)): 
			 ?>
				<option value="<?php echo $ver[0] ?>">
					<?php echo $ver[1]?>
				</option>

			<?php endwhile; ?>

		</select>

<script type="text/javascript">
	$(document).ready(function(){
			$('#placa').change(function(){
				/*var placa = document.getElementById("placa").value;
				
				var parametros = {
					"placa" : placa,
				};*/
				$.ajax({
					data: 'p=' + $('#placa').val(),
					url:'session/crear_session.php',
					type:'POST',
					success:function(r){
						$('#tabla').load('componentes/tabla.php');
					}
				});
			});
		});

			
	</script>		