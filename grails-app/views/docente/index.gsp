<%@ page import="aulas.Docente" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
</head>
<body>
<g:hiddenField id="hdnDocentes" name="hdnDocentes"></g:hiddenField>
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
	</div>
</div>
</body>
</html>