package aulas


class DocenteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def docenteService

    def index() {
        if(params.inputBusqueda? params.inputBusqueda == null : true)
            [docenteList: Docente.all]
        else
            [docenteList: docenteService.buscar(params.inputBusqueda)]
    }

    def create() {
        Docente docente = new Docente()
        [docenteInstance: docente]
        //render ([view: 'create', model:[docenteInstance: docente]])
    }

    def edit() {
        Docente docente = Docente.get(params.id)
        List<Docente> listaDocentes = Docente.getAll()
        render ([view: 'create', model:[docenteInstance: docente, docenteList: Docente.all]])
    }

    def save(Docente docenteInstance) {
        if (docenteInstance.hasErrors()) {
            respond docenteInstance.errors, view:'create'
            return
        }
        docenteInstance.save flush:true
        redirect docenteInstance: docenteInstance
    }

    def show(long id) {
        def docente = docenteService.getDocente(id)
        [docenteInstance: docente]
    }

    def update(Docente docenteInstance) {

        if (docenteInstance.hasErrors()) {
            respond docenteInstance.errors, view: 'edit'
            return
        }

        docenteInstance.save flush: true
    }

}
