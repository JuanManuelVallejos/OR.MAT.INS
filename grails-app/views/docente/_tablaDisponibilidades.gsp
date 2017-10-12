<div class="panel-body">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Dia</th>
            <th>Hora Inicial</th>
            <th>Hora Final</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${docenteInstance.disponibilidades}" var="disponibilidad">
            <tr>
                <th>
                    ${disponibilidad.dia}
                </th>
                <th>
                    ${disponibilidad.horaInicial}
                </th>
                <th>
                    ${disponibilidad.horaFinal}
                </th>
                <th>
                    <g:submitButton class="btn btn-danger" name="delete" value="Eliminar" onclick="javascript:eliminarDisponibilidad(${disponibilidad.id}, ${docenteInstance.id})" />
                </th>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>