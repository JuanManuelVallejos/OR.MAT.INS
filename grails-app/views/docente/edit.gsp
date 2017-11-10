<!DOCTYPE html>
<html>
<head>
	<g:set var="seFinalizoPlazo" value="${finalizoPlazo}" scope="request"/>
	<g:set var="finalizoAsignacion" value="${finalizoAsignacion}" scope="request"/>
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
		<div class="col-md-6">
			<g:uploadForm controller="docente" action="update">
				<g:render template="form" model="[docenteInstance: docenteInstance, modoEdicion: true]"></g:render>
				<g:submitButton name="btnUpload" class="btn btn-success"  value="Actualizar" />
			</g:uploadForm>
		</div>
	</div>
</body>
</html>
