package aulas


class DocenteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def docenteService

    def index() {
        [docenteList: Docente.all]
    }

    def list(){
        [docenteList: Docente.all]
    }

    def create() {
        Docente docente = new Docente()
        [docenteInstance: docente]
        //render ([view: 'create', model:[docenteInstance: docente]])
    }

    def save(Docente docenteInstance) {
        if (docenteInstance.hasErrors()) {
            respond docenteInstance.errors, view:'create'
            return
        }
        docenteInstance.save flush:true
    }
}
