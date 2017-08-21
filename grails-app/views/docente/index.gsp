<%@ page import="aulas.Docente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<r:require module="jquery"></r:require>
		<r:require modules="bootstrap"/>
	</head>
	<body>
	<form name="list">
		<div class="row">
			<div class="col-md-12">
				<h2> Docentes registrados </h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div id="tablaDocentes">
					<g:render id="temp" template="tabla" model="[docentes: docenteList]"></g:render>
				</div>
				<g:form action="index">
					<g:textField name="inputBusqueda" value="${inputBusqueda}"/>
					<g:submitButton name="buscar" class="btn btn-primary" value="Buscar"></g:submitButton>
				</g:form>
			</div>
		</div>
	</form>
	</body>
</html>