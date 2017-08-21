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

    def list(input) {
        System.out.println("adasdsadasdaaaaaaaaaaaa "+input)
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def docenteBusqueda = docenteService.buscar(input)
        render ([view: 'index', model:[docenteList: docenteBusqueda]])
        //[docenteList: docenteBusqueda, inputBusqueda: params.inputBusqueda]
    }


}
