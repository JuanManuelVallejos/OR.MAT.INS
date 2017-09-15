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
		<br />
		<g:if test="${flash.error}">
			<div class="alert alert-danger" role="alert">${flash.error}</div>
		</g:if>

		<div class="row">
			<div class="col-md-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h2 class="panel-title">Cursos registrados</h2>
					</div>
					<div class="panel-body">
						<table class="table table-striped">
							<thead>
							<tr>
								<th>Nombre</th>
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
					<div class="panel-footer">
						<g:hasErrors bean="${cursoInstance}">
							<ul>
								<g:eachError var="err" bean="${cursoInstance}">
									<li>${err}</li>
								</g:eachError>
							</ul>
						</g:hasErrors>
						<g:form action="save">
							<g:textField id="inputNombre" name="nombre" placeholder="Nombre de curso" value="${cursoInstance?.nombre}" required="required" maxlength="30"></g:textField>
							<g:submitButton class="btn btn-primary" name="save" value="Agregar" />
						</g:form>
					</div>
				</div>
			</div>
			<div class="col-md-4">

			</div>
		</div>
	</body>
</html>
