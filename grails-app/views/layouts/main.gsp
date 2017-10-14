<!DOCTYPE html>
	<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
	<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
	<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
	<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<r:require modules="bootstrap"/>
	<title><g:layoutTitle default="Ormatins"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
	<g:layoutHead/>
	<g:javascript library="jquery" plugin="jquery"/>
	<g:javascript library="application"/>
	<r:layoutResources />
</head>
<body background="${resource(dir: 'images',file: 'fondoEscolar.jpg')}" style="background-repeat: no-repeat;background-position: center; background-attachment: fixed; background-size: cover">
<div class="container">
	<nav class="navbar navbar-inverse">
		<ul class="nav navbar-nav">
			<li class="active"><a href="/aulas/">Ormatins <span class="sr-only">(current)</span></a></li>
			<sec:ifNotLoggedIn>
				<li><g:link controller="login" action="index">Iniciar sesion</g:link></li>
			</sec:ifNotLoggedIn>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<li><g:link controller="docente" action="create">Registrar docente</g:link></li>
			</sec:ifAllGranted>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<li><g:link controller="docente" action="index">Docentes registrados</g:link></li>
			</sec:ifAllGranted>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<li><g:link controller="curso" action="index">Cursos</g:link></li>
			</sec:ifAllGranted>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<li><g:link controller="materia" action="index">Materias</g:link></li>
			</sec:ifAllGranted>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<li><g:link url="/aulas/administracion/index" >Administración</g:link></li>
			</sec:ifAllGranted>
			<sec:ifAllGranted roles="ROLE_DOCENTE">
				<li><g:link controller="docente" action="show">Mi informacion</g:link></li>
			</sec:ifAllGranted>
			<sec:ifLoggedIn>
				<li><g:link controller="logout" action="index">Cerrar sesion</g:link></li>
			</sec:ifLoggedIn>
		</ul>
	</nav>
	<div class="jumbotron" style="opacity: 0.9">
		<div class="row">
			<div class="col-md-12">
				<g:layoutBody/>
			</div>
		</div>
	</div>
</div>
<div class="footer" role="contentinfo"></div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources />
</body>
</html>
