<tr>
    <td>
        <g:if test="${edicion == instancia?.id}">
            <g:textField id="inputNombre" name="nombreEditado" value="${instancia?.nombre}" maxlength="50 "></g:textField>
        </g:if>
        <g:else>
            <label id="nombre">
                <g:link action="${accionLink}" id="${instancia?.id}" style="color:green">${instancia?.nombre}</g:link>
            </label>
        </g:else>
    </td>
    <g:hiddenField name="instanciaId" value="${instancia?.id}"></g:hiddenField>
    <g:hiddenField name="valorEdicion" value="${edicion}"></g:hiddenField>
    <g:if test="${edicion == instancia?.id}">
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