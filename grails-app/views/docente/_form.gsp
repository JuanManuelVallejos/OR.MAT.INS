<g:hiddenField name="id" value="${docenteInstance?.id}"></g:hiddenField>
<g:hiddenField name="version" value="${docenteInstance?.version}"/>
<div class="row">
	<div class="col-md-5" align="center">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h2 class="panel-title">Información personal</h2>
			</div>
			<span class="panel-body">
				<g:if test="${hasErrors(bean: docenteInstance, field: 'nombre', 'error')}">
					<span style="color: red;">El nombre puede contener hasta 60 caracteres.</span>
				</g:if>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">Nombre</span>
					<g:textField name="nombre" class="form-control" disabled="${!modoEdicion}" placeholder="Nombre" aria-describedby="basic-addon1" required="" value="${docenteInstance?.nombre}"/>
				</div>
				<br/>
				<g:if test="${hasErrors(bean: docenteInstance, field: 'apellido', 'error')}">
					<span style="color: red;">El apellido puede contener hasta 60 caracteres.</span>
				</g:if>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">Apellido</span>
					<g:textField name="apellido" class="form-control" disabled="${!modoEdicion}" placeholder="Apellido" aria-describedby="basic-addon1" required="" value="${docenteInstance?.apellido}"/>
				</div>
				<br/>
				<g:if test="${hasErrors(bean: docenteInstance, field: 'email', 'error')}">
					<span style="color: red;">Verifique que el email tenga el formato adecuado.</span>
				</g:if>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon1">Email</span>
					<g:textField name="email" class="form-control" disabled="${!modoEdicion}" placeholder="ejemplo@gmail.com" aria-describedby="basic-addon1" required="" value="${docenteInstance?.email}"/>
				</div>
				<br/>
				<g:if test="${hasErrors(bean: docenteInstance, field: 'telefono', 'error')}">
					<span style="color: red;">Verifique que el telefono se conforme solo de números.</span>
				</g:if>
				<div class="input-group">
					<span class="input-group-addon" style="size: " id="basic-addon1">Teléfono</span>
					<g:textField name="telefono" class="form-control" disabled="${!modoEdicion}" placeholder="Telefono" aria-describedby="basic-addon1" required="" value="${docenteInstance?.telefono}"/>
				</div>
				<br/>
				<g:if test="${hasErrors(bean: docenteInstance, field: 'direccion', 'error')}">
					<span style="color: red;">La dirección puede contener hasta 60 caracteres.</span>
				</g:if>
				<div class="input-group">
					<span class="input-group-addon" style="size: " id="basic-addon1">Dirección</span>
					<g:textField name="direccion" class="form-control" disabled="${!modoEdicion}" placeholder="Calle falsa 123" aria-describedby="basic-addon1" required="" value="${docenteInstance?.direccion}"/>
				</div>
				<br/>
				<g:if test="${hasErrors(bean: docenteInstance, field: 'edad', 'error')}">
					<span style="color: red;">Verifique que la cantidad de años sea la correcta.</span>
				</g:if>
				<div class="input-group">
					<span class="input-group-addon" style="size: " id="basic-addon1">Edad</span>
					<g:textField name="edad" class="form-control" disabled="${!modoEdicion}" placeholder="edad" aria-describedby="basic-addon1" required="" value="${docenteInstance?.edad}"/>
				</div>
				<br/>
				<g:if test="${hasErrors(bean: docenteInstance, field: 'dni', 'error')}">
					<span style="color: red;">El dni solo se debe componer de numeros y tamaño de 8 digitos.</span>
				</g:if>
				<div class="input-group">
					<span class="input-group-addon" style="size: " id="basic-addon1">DNI</span>
					<g:textField name="dni" class="form-control" disabled="${!modoEdicion}" placeholder="dni" aria-describedby="basic-addon1" required="" value="${docenteInstance?.dni}"/>
				</div>
			</div>
		</div>
	</div>
</div>