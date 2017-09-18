<tr>
    <td>
        <g:select class="btn btn-default dropdown-toggle" name="materiaId" from="${materias}" noSelection="${['null':'Seleccione una materia']}" optionKey="id" optionValue="nombre"></g:select>
    </td>
    <td>
        <g:if test="${flash.error}">
            <div class="alert alert-danger" role="alert">${flash.error}</div>
        </g:if>
        <g:textField name="horas" required="required" typeof="Integer"></g:textField>
    </td>
    <td>
        <g:select class="btn btn-default dropdown-toggle" name="docenteId" from="${docentes}" noSelection="${['null':'Seleccione un docente']}" optionKey="id" optionValue="apellido" ></g:select>
    </td>
</tr>