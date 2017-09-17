package aulas
import seguridad.User

class DocenteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]
    def docenteService
    def springSecurityService

    def index() {
        [docenteList: docenteService.getAllDocentes()]
    }


    def show(Docente docente){
        User user = (User) springSecurityService.getCurrentUser()
        [docenteInstance: docenteService.getDocenteConUser(user)]
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

}
