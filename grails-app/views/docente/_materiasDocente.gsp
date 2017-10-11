<div class="panel-body">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Nombre</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
            <g:each in="${materiasDeDocente}" var="materiaAsignada">
                <tr>
                    <th>
                        ${materiaAsignada.nombre}
                    </th>
                    <th>
                        <g:submitButton class="btn btn-danger" name="delete" value="Eliminar" onclick="javascript:callEliminar(${materiaAsignada.id},${docenteInstance.id})" />
                    </th>
                </tr>
            </g:each>
        </tbody>
    </table>
</div>