<tr>
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
                        onclick="javascript:eliminarMateriaPorDocente(${division.id},${materiaPorDocente.id})" />
    </td>
</tr>