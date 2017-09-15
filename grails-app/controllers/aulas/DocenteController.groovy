package aulas

class DocenteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]
    def docenteService

    def index() {
        [docenteList: docenteService.getAllDocentes()]
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
        docenteInstance.validate()
        if (docenteInstance.hasErrors()){
            render view: 'create', model: [docenteInstance: docenteInstance]
            return
        }
        else{
            redirect(action:"create")
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

}
