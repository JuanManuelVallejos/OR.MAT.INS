package aulas

class MateriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        [materias: Materia.all]
    }

    def show(Materia materiaInstance) {
        respond materiaInstance
    }

    def create() {
        respond new Materia(params)
    }

    def save(Materia materiaInstance) {
        if (materiaInstance.hasErrors()) {
            respond materiaInstance.errors, view:'index'
            return
        }
        materiaInstance.save flush:true
        render ([view: 'index', model:[materias: Materia.all]])
    }

    def edit(Materia materiaInstance) {
        respond materiaInstance
    }

}
