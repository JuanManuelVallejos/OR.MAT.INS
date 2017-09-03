<%@ page import="aulas.Curso" %>
<!DOCTYPE html>
<html>
	<head>
		<r:require modules="bootstrap"/>
		<meta name="layout" content="main">
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<h2> Cursos </h2>
			</div>
		</div>
		<div class="row">
			<table class="table">
				<thead>
				<tr>
					<td>Nombre</td>
				</tr>
				</thead>
				<tbody>
					<g:each in="${cursos}" var="curso">
						<tr>
							<td>
								<label id="nombre"><g:link action="show" id="${curso.id}">${curso.nombre}</g:link></label>
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
					<div class="panel panel-heading">Agregar curso</div>
					<div class="panel-body">
						<fieldset class="buttons">
							<g:form action="save">
								<g:textField id="inputNombre" name="nombre" placeholder="Nombre de curso" value="${cursoInstance?.nombre}"></g:textField>
								<g:actionSubmit class="btn btn-primary" name="save" value="save" />
							</g:form>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
