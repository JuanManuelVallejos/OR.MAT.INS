<%@ page import="aulas.Materia" %>
<!DOCTYPE html>
<html>
<head>
    <r:script>
        function setHiddens(valueA, valueB){
            jQuery('#instanciaId').val(valueA);
            jQuery('#seQuiereEditar').val(valueB);
        }
    </r:script>
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
<div class="row">
    <div class="col-md-6">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h2 class="panel-title">${titulo}s registradas</h2>
            </div>
            <g:formRemote name="upCambiarModo" url="[action:'SetEditableOActualizar']" update="allTabla">
                <div id="allTabla">
                    <g:render template="/editable/tablaEditable" model="[instancias: instancias, accionLink: accionLink, instanciaEdicion: instanciaEdicion, instancia: instancia]" />
                </div>
            </g:formRemote>
            <div class="panel-footer">
                <g:formRemote name="agregarInstancia" url="[action:'save']" action="save" update="allTabla">
                    <g:textField id="inputNombre" name="nombre" placeholder="Nombre de ${titulo}" value="${instanciaNueva?.nombre}" maxlength="50"></g:textField>
                    <g:submitButton class="btn btn-success" name="save" value="Agregar" />
                </g:formRemote>
            </div>
        </div>
    </div>
</div>
</body>
</html>
