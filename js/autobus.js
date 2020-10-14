function registrar(){
	var placa = document.getElementById("placa").value;
	var modelo = document.getElementById("modelo").value;
	var n_motor = document.getElementById("n_motor").value;
	var color = document.getElementById("color").value;
	var cc = document.getElementById("cc").value;
	var n_chasis = document.getElementById("n_chasis").value;
	
    var paramentros = {
		"color" : color,
		"placa" : placa,
		"n_motor" : n_motor,
		"modelo" : modelo,
		"cc" : cc,
		"n_chasis" : n_chasis,
 		};
		$.ajax({
			data: paramentros,
			url: 'controlador/insertar_informacion.php',
			type: 'POST',
			success: function(response){
				$('.mensaje').html(response).fadeIn();
				setTimeout(function() {
       				$(".mensaje").fadeOut();           
  				},4000);
			}
		});
		
		$('input[type="text"]').val('');
		$('input[type="email"]').val('');
		$('input[type="date"]').val('');
}

function registrar_incidencia(){
	var placa = document.getElementById("placa").value;
	var incidencia = document.getElementById("incidencia").value;
	var coste = document.getElementById("coste").value;
	var descripcion = document.getElementById("descripcion").value;

	var paramentros = {
		"placa" : placa,
		"incidencia" : incidencia,
		"coste" : coste,
		"descripcion" : descripcion,
	};
	$.ajax({
		data: paramentros,
		url: 'controlador/registrar_incidencia.php',
		type: 'POST',
		success: function(response){
			$('.mensaje').html(response).fadeIn();
			setTimeout(function() {
       			$(".mensaje").fadeOut();           
  			},4000);
		}
	});
	$('input[type="text"]').val('');
	$('input[type="date"]').val('');
	$('textarea').val('');
}

function registrar_dispositivo(){
	var codigo = document.getElementById("codigo").value;
	var dispositivo = document.getElementById("dispositivo").value;
	var precio = document.getElementById("precio").value;
	var descripcion = document.getElementById("descripcion").value;

	var paramentros = {
		"codigo" : codigo,
		"dispositivo" : dispositivo,
		"precio" : precio,
		"descripcion" : descripcion,
	};
	$.ajax({
		data: paramentros,
		url: 'controlador/registrar_dispositivo.php',
		type: 'POST',
		success: function(response){
			$('.mensaje').html(response).fadeIn();
			setTimeout(function() {
       			$(".mensaje").fadeOut();           
  			},4000);
		}
	});
	$('input[type="text"]').val('');
	$('input[type="date"]').val('');
	$('textarea').val('');
}

function registrar_parada(){
	var placa = document.getElementById("placa").value;
	var calle = document.getElementById("calle").value;
	var zona = document.getElementById("zona").value;
	var llegada = document.getElementById("llegada").value;

	var paramentros = {
		"placa" : placa,
		"calle" : calle,
		"zona" : zona,
		"llegada" : llegada,
	};
	$.ajax({
		data: paramentros,
		url: 'controlador/registrar_parada.php',
		type: 'POST',
		success: function(response){
			$('.mensaje').html(response).fadeIn();
			$('#tabla').load('componentes/tabla.php');
			setTimeout(function() {
       			$(".mensaje").fadeOut();           
  			},4000);


		}
	});
	$('input[type="text"]').val('');
}

function eliminar_parada(id){
	if(confirm("Esta seguro de eliminar el registro?")){
		cadena="id=" + id;
		$.ajax({
			data : cadena,
			url : 'controlador/eliminar_parada.php',
			type : 'POST',
			success: function(response){
				$('.borrado').html(response).fadeIn();
				$('#tabla').load('componentes/tabla.php');
				setTimeout(function() {
       				$(".borrado").fadeOut();           
  				},4000);
			}
		})
	}
}