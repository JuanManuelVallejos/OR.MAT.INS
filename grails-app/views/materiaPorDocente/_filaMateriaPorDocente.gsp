<tr>
    <g:hiddenField name="divisionId" value="${division.id}"></g:hiddenField>
    <g:hiddenField name="matXDocId" value="${materiaPorDocente.id}"></g:hiddenField>
    <td>
        ${materiaPorDocente.materia.nombre}
    </td>
    <td>
        ${materiaPorDocente.horasACubrir}
    </td>
    <td>
        ${materiaPorDocente.docente.apellido}
    </td>
    <td>
        <g:actionSubmit value="Eliminar" class="btn btn-danger btn-sm"
                        onclick="return confirm('Esta acción eliminará la materia seleccionada. ¿Estas seguro?')" />
    </td>
</tr>