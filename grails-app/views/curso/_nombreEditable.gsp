<tr>
    <td>
        <g:if test="${edicionCurso == curso.id}">
            <g:textField id="inputNombre" name="nombreEditado" value="${curso?.nombre}" maxlength="50 "></g:textField>
        </g:if>
        <g:else>
            <label id="nombre"><g:link action="show" id="${curso.id}">${curso.nombre}</g:link></label>
        </g:else>
    </td>
    <td>
        <g:hiddenField name="instanciaId" value="${curso.id}"></g:hiddenField>
        <g:hiddenField name="valorEdicion" value="${edicionCurso}"></g:hiddenField>
        <g:submitButton name="Edit" value="Editar"></g:submitButton>
    </td>
</tr>