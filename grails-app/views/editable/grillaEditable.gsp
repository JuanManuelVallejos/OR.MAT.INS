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
        <h2> ${titulo}s </h2>
    </div>
</div>
<br />
<g:if test="${flash.error}">
    <div class="alert alert-danger" role="alert">${flash.error}</div>
</g:if>
<div class="row">
    <div class="col-md-6">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h2 class="panel-title">${titulo}s registradas</h2>
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
                    <g:each in="${instancias}" var="instancia">
                        <g:form name="upCambiarModo" action="modoEdicion">
                            <div id="edit${instancia?.id}">
                                <g:render template="/editable/nombreEditable" model="[edicion: edicion, instancia: instancia, accionLink: accionLink]"></g:render>
                            </div>
                        </g:form>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="panel-footer">
                <g:form name="save" action="save">
                    <g:textField id="inputNombre" name="nombre" placeholder="Nombre de ${titulo}" value="${materiaInstance?.nombre}" maxlength="50"></g:textField>
                    <g:submitButton class="btn btn-success" name="save" value="Agregar" />
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
