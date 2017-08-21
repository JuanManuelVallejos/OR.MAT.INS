<%@ page import="aulas.Docente" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<r:require modules="bootstrap"/>
	<g:set var="entityName" value="${message(code: 'docente.label', default: 'Docente')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div id="edit-docente" class="content scaffold-edit" role="main">
	<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${docenteInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${docenteInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
	</g:hasErrors>
	<g:form url="[resource:docenteInstance, action:'update']" method="PUT" >
		<g:hiddenField name="version" value="${docenteInstance?.version}" />
		<fieldset class="form">
			<g:render template="form" model="[modoEdicion: true]"/>
		</fieldset>
		<fieldset class="buttons">
			<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
		</fieldset>
	</g:form>
</div>
</body>
</html>