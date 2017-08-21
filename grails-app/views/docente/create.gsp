<html>
<head>
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
<div class="row">
	<div class="col-md-12">
		<g:uploadForm controller="docente" action="save">
			<g:render template="form" model="[docenteInstance: docenteInstance, modoEdicion:true]"></g:render>
			<g:submitButton name="crearBtn" class="btn btn-primary" value="Crear docente"></g:submitButton>
		</g:uploadForm>
	</div>
</div>
</body>
</html>