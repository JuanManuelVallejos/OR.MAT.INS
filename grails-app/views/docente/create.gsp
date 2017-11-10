<html>
	<head>
		<g:set var="seFinalizoPlazo" value="${seFinalizoPlazo}" scope="request"/>
		<g:set var="finalizoAsignacion" value="${finalizoAsignacion}" scope="request"/>
		<meta name="layout" content="main"/>
		<r:require modules="bootstrap"/>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<h2> Crear perfil docente </h2>
			</div>
		</div>
		<br/>
		<g:if test="${flash.error}">
			<div class="alert alert-danger" role="alert">${flash.error}</div>
		</g:if>
		<div class="row">
			<div class="col-md-6">
				<g:uploadForm controller="docente" action="save">
					<g:render template="form" model="[docenteInstance: docenteInstance, modoEdicion:true, errors:errors]"></g:render>
					<g:submitButton name="crearBtn" class="btn btn-success" value="Crear docente"></g:submitButton>
				</g:uploadForm>
			</div>
		</div>
	</body>
</html>