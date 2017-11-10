package aulas

import seguridad.User

class DocenteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE", agregarMateria: "POST", uploadTitulo: "POST", downloadFile: "GET"]
    def docenteService
    def materiaService
    def disponibilidadService
    def springSecurityService
    def parametroSistemaService

    def index() {
        [docenteList: docenteService.getAllDocentes(), seFinalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignacion: parametroSistemaService.finalizoAsignacion]
    }

    def show(Docente docente){
        renderShow()
    }

    def renderShow(){
        Docente docenteLogueado = getDocenteLogueado()
        def materiaList = materiaService.allMaterias

        [docenteInstance: docenteLogueado, materias: materiaList.minus(docenteLogueado.materiasQueDicto), materiasDeDocente: docenteLogueado.materiasQueDicto, materiasCount: docenteLogueado.materiasQueDicto.size(), documentInstanceList: docenteLogueado.titulos,
        seFinalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignacion: parametroSistemaService.finalizoAsignacion]
    }

    def getDocenteLogueado(){
        User user = (User) springSecurityService.getCurrentUser()
        docenteService.getDocenteConUser(user)
    }

    def create() {
        Docente docente = new Docente()
        [docenteInstance: docente, seFinalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignacion: parametroSistemaService.finalizoAsignacion]
    }

    def edit() {
        Docente docente = docenteService.getDocenteById(params.id)
        [docenteInstance: docente, finalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignacion: parametroSistemaService.finalizoAsignacion]
    }

    def save(Docente docenteInstance){
        def user = new User(username: params.username, enabled: true, password: params.password)
        docenteInstance.user = user
        docenteInstance.validate()
        if (docenteInstance.hasErrors()){
            render view: 'create', model: [docenteInstance: docenteInstance]
            return
        }
        else{
            docenteService.saveDocente(docenteInstance,user)
            redirect(action:"index")
        }
    }

    def update(Docente docenteInstance) {
        if (docenteInstance.hasErrors()) {
            respond docenteInstance.errors, view: 'edit'
            return
        }
        docenteService.saveDocente(docenteInstance)
        render ([view: 'index', model:[docenteList: docenteService.getAllDocentes()]])
    }

    def buscarDocentePorNombre() {
        def docentes = docenteService.buscar(request.JSON.nombre)
        render(template: 'tabla', model: [docentes: docentes])
    }

    def agregarMateria(){
        Materia materia = materiaService.getMateriaById(request.JSON.materiaId)
        Docente docente = docenteService.getDocenteById(request.JSON.docenteId)
        docenteService.agregarMateria(docente, materia)

        render([template: 'materiasDocente', model: [docenteInstance: docente, materiasDeDocente: docente.materiasQueDicto]])
    }

    def eliminarMateria(){
        Materia materia = materiaService.getMateriaById(request.JSON.materiaId)
        Docente docente = docenteService.getDocenteById(request.JSON.docenteId)
        docenteService.eliminarMateria(docente, materia)
        render([template: 'materiasDocente', model: [docenteInstance: docente, materiasDeDocente: docente.materiasQueDicto]])
    }

    def upload() {
        def file = request.getFile('file')
        if(file.empty) {
            redirect (action:'show')
            return
        }
        String path = 'Documentacion/'+ file.fileItem.fileName
        docenteService.addTituloToDocente(getDocenteLogueado(), file.fileItem.fileName, path)
        file.transferTo(new File(path))
        redirect (action:'show')
    }

    def downloadFile(){
        def doc = DocumentoRespaldatorio.get(params.id)
        def file = new File("${doc.fullPath}")
        if (file.exists())
        {
            response.setContentType("application/octet-stream") // or or image/JPEG or text/xml or whatever type the file is
            response.setHeader("Content-disposition", "attachment;filename=\"${file.name}\"")
            response.outputStream << file.bytes
        }
        else render "Error!" // appropriate error handling
    }

    def deleteFile(){
        def doc = DocumentoRespaldatorio.get(params.documentId)
        def file = new File(doc.fullPath)
        docenteService.removeTituloToDocente(getDocenteLogueado(), doc)
        file.delete()
        redirect (action:'show')
    }

    def validarDisponibilidad(horaInicio, horaFinal){
        if(horaInicio < 0 || horaFinal > 24)
            return "La hora inicial debe estar entre 0 y 24"
        if(horaFinal < 0 || horaFinal > 24)
            return "La hora final debe estar entre 0 y 24"
        if(horaInicio >= horaFinal)
            return "El horario inicial no puede ser mayor o igual que el horario final"
        return null
    }

    def agregarDisponibilidad(){
        def dia = request.JSON.diaSemana
        def horaInicio = request.JSON.horaInicio as int
        def horaFinal = request.JSON.horaFinal as int

        //No deberia pasar ya que el js lo evita
        def validacion = validarDisponibilidad(horaInicio, horaFinal)
        if(validacion != null){
            render(status:500, text: validacion ,contentType: 'application/json')
        }
        else{
            Docente docente = docenteService.getDocenteById(request.JSON.docenteID)
            docenteService.agregarDisponibilidad(docente, dia, horaInicio, horaFinal)
            render(template: 'disponibilidad', model:[docenteInstance: docente])
        }
    }

    def eliminarDisponibilidad(){
        Docente docente = docenteService.getDocenteById(request.JSON.docenteID)
        Disponibilidad disponibilidad = disponibilidadService.getDisponibilidadById(request.JSON.disponibilidadID)
        docenteService.eliminarDisponibilidad(docente, disponibilidad)

        render(template: 'disponibilidad', model:[docenteInstance: docente])
    }
}

