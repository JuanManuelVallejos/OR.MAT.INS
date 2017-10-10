<g:hasErrors bean="${instanciaEdicion}">
    <div class="alert alert-danger" role="alert">
        <g:renderErrors bean="${instanciaEdicion}" as="list" />
    </div>
</g:hasErrors>
<div class="panel-body">
    <g:hiddenField name="instanciaId" value="${instancia?.id}"></g:hiddenField>
    <g:hiddenField name="seQuiereEditar" value="${instanciaEdicion}"></g:hiddenField>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Nombre</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${instancias}" var="instancia">
            <g:render template="/editable/nombreEditable" model="[instancia: instancia, accionLink: accionLink, instanciaEdicion: instanciaEdicion]"></g:render>
        </g:each>
        </tbody>
    </table>
</div>