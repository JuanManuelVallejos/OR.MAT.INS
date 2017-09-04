<%@ page import="aulas.Materia" %>
<!DOCTYPE html>
<html>
<head>
	<r:require modules="bootstrap"/>
	<meta name="layout" content="main">
</head>
<body>
<div class="row">
	<div class="col-md-12">
		<h2> Materias </h2>
	</div>
</div>
<div class="row">
	<table class="table">
		<thead>
		<tr>
			<td>Materia</td>
		</tr>
		</thead>
		<tbody>
		<g:each in="${materias}" var="materia">
			<tr>
				<td>
					<label id="nombre"><g:link action="edit" id="${materia.id}">${materia.nombre}</g:link></label>
				</td>
			</tr>
		</g:each>
		</tbody>
	</table>
</div>
<br/>
<div class="row">
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel panel-heading">Agregar materia</div>
			<div class="panel-body">
				<g:uploadForm action="save">
					<g:textField id="inputNombre" name="nombre" placeholder="Nombre de materia" value="${materiaInstance?.nombre}"></g:textField>
					<g:actionSubmit class="btn btn-primary" name="save" value="save" />
				</g:uploadForm>
			</div>
		</div>
	</div>
</div>
</body>
</html>
