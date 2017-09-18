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
		<br />

		<g:if test="${flash.error}">
			<div class="alert alert-danger" role="alert">${flash.error}</div>
		</g:if>

		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h2 class="panel-title">Materias registradas</h2>
					</div>
					<div class="panel-body">
						<table class="table table-striped">
							<thead>
							<tr>
								<th>Nombre</th>
								<th>Acciones</th>
							</tr>
							</thead>
							<tbody>
								<g:each in="${instancias}" var="materia">
									<g:form name="upCambiarModo" action="modoEdicion">
										<div id="edit${materia.id}">
											<g:render template="nombreEditable" model="[edicionMateria: edicion, materia: materia]"></g:render>
										</div>
									</g:form>
								</g:each>
							</tbody>
						</table>
					</div>
					<div class="panel-footer">
						<g:form name="save" action="save">
							<g:textField id="inputNombre" name="nombre" placeholder="Nombre de materia" value="${materiaInstance?.nombre}" maxlength="50"></g:textField>
							<g:submitButton class="btn btn-primary" name="save" value="Agregar" />
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
