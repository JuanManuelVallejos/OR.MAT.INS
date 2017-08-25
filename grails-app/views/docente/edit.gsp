<%@ page import="aulas.Docente" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<r:require modules="bootstrap"/>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<h2>Edición docente</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div id="datosDocente">
				<g:render template="form" model="[docenteInstance: docenteInstance, modoEdicion: true]"/>
			</div>
			<fieldset class="buttons">
				<g:form action="update">
					<g:actionSubmit class="btn btn-primary"  value="Actualizar" />
				</g:form>
			</fieldset>
		</div>
	</div>
</body>
</html>
