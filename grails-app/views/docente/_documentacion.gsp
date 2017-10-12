<div class="panel panel-success">
    <div class="panel-heading">
        <h2 class="panel-title">Documentación respaldatoria</h2>
    </div>
    <div class="panel-body">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="panel-title">Títulos</h2>
            </div>
            <div class="panel-body">
                <g:uploadForm action="upload" method="post" enctype="multipart/form-data">
                    <fieldset class="form">
                        <input type="file" name="file" />
                    </fieldset>
                    <br />
                    <fieldset class="button">
                        <g:submitButton name="upload" class="btn btn-success" value="Upload"/>
                    </fieldset>
                </g:uploadForm>
                <br />
                <div class="panel-body">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>Documento</th>
                            <th>Acciones</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:form controller="docente">
                            <g:each in="${documentInstanceList}" status="i" var="documentInstance">
                                <g:hiddenField name="documentId" value="${documentInstance.id}" />
                                <tr class="${(i % 2) == 0 ? 'even':'odd'}">
                                    <th>
                                        <g:link action="downloadFile" id="${documentInstance.id}" style="color:green">${documentInstance.fileName}</g:link>
                                    </th>
                                    <th>
                                        <g:actionSubmit action="deleteFile" class="btn btn-danger" value="Eliminar" ></g:actionSubmit>
                                    </th>
                                </tr>
                            </g:each>
                        </g:form>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>