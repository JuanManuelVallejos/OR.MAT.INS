package aulas
import seguridad.User

class DocenteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE", agregarMateria: "POST", uploadTitulo: "POST", downloadFile: "GET"]
    def docenteService
    def materiaService
    def disponibilidadService
    def springSecurityService

    def index() {
        [docenteList: docenteService.getAllDocentes()]
    }

    def show(Docente docente){
        renderShow()
    }

    def renderShow(){
        Docente docenteLogueado = getDocenteLogueado()
        def materiaList = materiaService.allMaterias

        [docenteInstance: docenteLogueado, materias: materiaList.minus(docenteLogueado.materiasQueDicto), materiasDeDocente: docenteLogueado.materiasQueDicto, materiasCount: docenteLogueado.materiasQueDicto.size(), documentInstanceList: docenteLogueado.titulos]
    }

    def getDocenteLogueado(){
        User user = (User) springSecurityService.getCurrentUser()
        docenteService.getDocenteConUser(user)
    }

    def create() {
        Docente docente = new Docente()
        [docenteInstance: docente]
    }

    def edit() {
        Docente docente = docenteService.getDocenteById(params.id)
        [docenteInstance: docente]
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

    def agregarDisponibilidad(){
        def dia = request.JSON.diaSemana
        def horaInicio = request.JSON.horaInicio
        def horaFinal = request.JSON.horaFinal
        Docente docente = docenteService.getDocenteById(request.JSON.docenteID)
        docenteService.agregarDisponibilidad(docente, dia, horaInicio, horaFinal)
        render(template: 'disponibilidad', model:[docenteInstance: docente])
    }

    def eliminarDisponibilidad(){
        Docente docente = docenteService.getDocenteById(request.JSON.docenteID)
        Disponibilidad disponibilidad = disponibilidadService.getDisponibilidadById(request.JSON.disponibilidadID)
        docenteService.eliminarDisponibilidad(docente, disponibilidad)

        render(template: 'disponibilidad', model:[docenteInstance: docente])
    }
}

