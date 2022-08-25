<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mantenedor contactos</title>
<script type="text/javascript">
	var idSeleccionado = 0;
	function submitFormAction(action, method) {
		document.getElementById("frmAcciones").action = action; // /contactManager/addContact
		document.getElementById("frmAcciones").method = method; // 'post'
		document.getElementById("frmAcciones").submit(); // hacer un submit al formulario que tiene el id="frmAcciones"
	}
	function setIdSeleccionado(id) {
		idSeleccionado = id;
	}
	function borrarFila() {
		window.location.href = "/contactManager/deleteContact/?id=" + idSeleccionado;
	}
</script>
</head>
<body>
	<!-- formulario para agregar contactos -->
	<form:form id="frmAcciones" modelAttribute="contactoVista"
		action="/addContact">
		<div>
			<fieldset>
				<legend>Mantenedor de Contactos</legend>
				<table border="1">
					<tr>
						<td>Nombre:</td>
						<td><input type="text" id="idNombre" name="nombre" /></td>
						<td>Apellido Paterno:</td>
						<td><input type="text" id="idApellidoPaterno"
							name="apellidoPaterno" /></td>
					</tr>
					<tr>
						<td>Dirección:</td>
						<td><input type="text" id="idDireccion" name="direccion" /></td>
						<td>Teléfono:</td>
						<td><input type="text" id="idTelefono" name="telefono" /></td>
					</tr>
					<tr>
						<td colspan="4"><input type="button" value="Buscar" /> <input
							type="button" value="Agregar"
							onclick="submitFormAction('/contactManager/addContact', 'post')" />
							<input type="button" value="Eliminar" onclick="borrarFila()" /></td>
					</tr>
				</table>
			</fieldset>
		</div>
	</form:form>
	<br>
	<br>
	<!-- tabla que muestra listado de contactos -->
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nombre</th>
					<th>Apellido Paterno</th>
					<th>Apellido Materno</th>
					<th>Dirección</th>
					<th>Teléfono</th>
					<!--  <th></th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listaContactos}" var="contactoTemp">
					<tr>
						<!-- acá irán los atributos del objeto contacto -->
						<td>${contactoTemp.idContacto}</td>
						<td>${contactoTemp.nombre}</td>
						<td>${contactoTemp.apellidoPaterno}</td>
						<td>${contactoTemp.apellidoMaterno}</td>
						<td>${contactoTemp.direccion}</td>
						<td>${contactoTemp.telefono}</td>
						<td><input type="radio" name="optSelectRow"
							onclick="setIdSeleccionado(${contactoTemp.idContacto})" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>