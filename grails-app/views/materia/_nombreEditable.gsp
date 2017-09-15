<tr>
    <td>
        <g:if test="${edicionMateria == materia.id}">
            <g:textField id="inputNombre" name="nombreEditado" value="${materia?.nombre}" maxlength="50 "></g:textField>
        </g:if>
        <g:else>
            <label id="nombre"><g:link action="index" id="${materia.id}">${materia.nombre}</g:link></label>
        </g:else>
    </td>
    <td>
        <g:hiddenField name="materiaId" value="${materia.id}"></g:hiddenField>
        <g:hiddenField name="valorEdicion" value="${edicionMateria}"></g:hiddenField>
        <g:submitButton name="Edit" value="Editar"></g:submitButton>
    </td>
</tr>