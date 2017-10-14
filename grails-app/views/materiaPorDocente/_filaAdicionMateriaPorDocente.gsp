<tr>
    <td>
        <g:select id="selectMaterias${divisionId}" class="btn btn-default dropdown-toggle" onchange="injectDocentes('selectDocentes${divisionId}','selectMaterias${divisionId}')" name="materiaId" from="${materias}" noSelection="${['null':'Seleccione una materia']}" optionKey="id" optionValue="nombre"></g:select>
    </td>
    <td>
        <g:if test="${flash.error}">
            <div class="alert alert-danger" role="alert">${flash.error}</div>
        </g:if>
        <g:field type="number" name="horas${divisionId}" required="required" typeof="Integer"></g:field>
    </td>
    <td>
        <g:select id="selectDocentes${divisionId}" class="btn btn-default dropdown-toggle" name="docenteId" from="${null}" noSelection="${['null':'Seleccione una materia']}" optionKey="id" optionValue="apellido" ></g:select>
    </td>
</tr>