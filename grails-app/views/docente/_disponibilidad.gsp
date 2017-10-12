<div class="panel panel-success">
    <div class="panel-heading">
        <h2 class="panel-title">Disponibilidad horaria</h2>
    </div>
    <div id="errorDiaNoIngresado" style="display: none">
        <br />
        <div class="alert alert-danger" role="alert">
            <p id="msgErrorDias" style="font-size: 100%">Debe seleccionar el día</p>
        </div>
    </div>
    <div class="panel-body">
        <div class="panel panel-default">
            <div class="row">
                <form id="formNotSubmit">
                    <div class="col-md-3">
                        <g:select id="selectDia" class="selectpicker show-menu-arrow" name="dia" from="${aulas.DiaSemana.values()}" noSelection="${['null':'Seleccione un día']}" />
                    </div>
                    <div class="col-md-3">
                        <g:textField name="horaInicial" placeholder="Hora inicial" required="required"></g:textField>
                    </div>
                    <div class="col-md-3">
                        <g:textField name="horaFinal" placeholder="Hora final" required="required"></g:textField>
                    </div>
                    <div class="col-md-3">
                        <g:submitButton name="agregarDisponibilidad" class="btn btn-success" value="Agregar disponibilidad" onclick="javascript:addDisponibilidad(${docenteInstance.id})"></g:submitButton>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="panel panel-footer">
        <div id="tablaDisponibilidades">
            <g:render template="tablaDisponibilidades" model="[docenteInstance: docenteInstance]" />
        </div>
    </div>
</div>