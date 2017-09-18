<tr>
    <td>
        <g:if test="${edicionMateria == materia.id}">
            <g:textField id="inputNombre" name="nombreEditado" value="${materia?.nombre}" maxlength="50 "></g:textField>
        </g:if>
        <g:else>
            <label id="nombre"><g:link action="index" id="${materia.id}">${materia.nombre}</g:link></label>
        </g:else>
    </td>
    <g:hiddenField name="instanciaId" value="${materia.id}"></g:hiddenField>
    <g:hiddenField name="valorEdicion" value="${edicionMateria}"></g:hiddenField>
    <g:if test="${edicionMateria == materia.id}">
        <td style="align-content: right">
            <div class="row">
                <g:submitButton class="btn btn-success" name="Grabar" value="Grabar" />
                <g:submitButton class="btn btn-default" onsubmit="break" name="Cancelar" />
            </div>
        </td>
    </g:if>
    <g:else>
        <td style="align-content: left">
            <g:submitButton class="btn btn-default" name="Edit" value="Editar"></g:submitButton>
        </td>
    </g:else>
</tr>