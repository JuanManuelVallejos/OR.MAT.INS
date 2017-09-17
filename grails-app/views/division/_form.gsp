<table class="table table-striped">
	<thead>
	<tr>
		<th>Nombre division</th>
		<th>Horario inicial</th>
		<th>Cantidad de horas</th>
	</tr>
	</thead>
	<tbody>
		<td>
			<g:textField id="inputDivision" name="nombreDivision" placeholder="Nombre de division" required="required" maxlength="30"></g:textField>
		</td>
		<td>
			<g:field type="number" id="inputHoraInicial" name="horaInicial" placeholder="12" max="23" required="required"></g:field>
		</td>
		<td>
			<g:field type="number" name="cantidadHoras" placeholder="4" max="56" required="required"></g:field>
		</td>
	</tbody>
</table>