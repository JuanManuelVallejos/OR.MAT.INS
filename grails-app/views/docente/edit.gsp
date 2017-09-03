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
			<g:uploadForm controller="docente" action="update">
				<g:render template="form" model="[docenteInstance: docenteInstance, modoEdicion: true]"></g:render>
				<g:submitButton name="btnUpload" class="btn btn-primary"  value="Actualizar" />
			</g:uploadForm>
		</div>
	</div>
</body>
</html>
