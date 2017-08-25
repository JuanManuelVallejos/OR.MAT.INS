package aulas

import grails.converters.JSON

import javax.swing.text.html.HTML


class DocenteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def docenteService

    def index() {
        [docenteList: Docente.all]
    }

    def create() {
        Docente docente = new Docente()
        [docenteInstance: docente]
    }

    def edit() {
        Docente docente = Docente.get(params.id)
        [docenteInstance: docente]
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

        render ([view: 'index', model:[docenteList: docenteService.findAll()]])
    }

    def buscarDocentePorNombre() {
        def docentes = docenteService.buscar(request.JSON.nombre)
        def responseData = [
                'docenteList': docentes,
                'status': docentes ? "OK" : "Nothing present"
        ]
        render(template: 'tabla', model: [docentes: docentes])//responseData as JSON
    }

}
