package aulas

class MateriaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", modoEdicion: "POST"]
    static materiaService

    def index() {
        [materias: materiaService.allMaterias, edicionMateria: -1]
    }

    def show(Materia materiaInstance) {
        respond materiaInstance
    }

    def create() {
        respond new Materia(params)
    }

    def save(Materia materiaInstance) {
        if(guardarMateriaValidando(materiaInstance))
            redirect(action: 'index')
    }

    def edit(Materia materiaInstance) {
        respond materiaInstance
    }

    def guardarMateriaValidando(Materia materia){
        materia.validate()
        if (materia.hasErrors()) {
            flash.error = "El nombre ingresado de la materia no debe exceder los 50 caracteres"
            redirect(action: 'index')
            false
        }
        else {
            materiaService.saveMateria(materia)
            true
        }
    }

    def modoEdicion(){
        Materia materia = materiaService.getMateriaById(params.materiaId)
        int valorEdicion = params.int('valorEdicion')
        if(valorEdicion == materia.id){
            materia.nombre = params.nombreEditado
            if(guardarMateriaValidando(materia))
                valorEdicion = -1
            else
                return
        }
        else
            valorEdicion = materia.id
        render([view:'index', model:[materias: materiaService.allMaterias, edicionMateria: valorEdicion]])
    }

}
