package aulas

class MateriaController extends EditableController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", modoEdicion: "POST"]
    static materiaService

    def index() {
        super.index()
    }

    def show(Materia materiaInstance) {
        respond materiaInstance
    }

    def create() {
        respond new Materia(params)
    }

    def save(Materia materiaInstance) {
        actualizar(materiaInstance)
    }

    def edit(Materia materiaInstance) {
        respond materiaInstance
    }

    def saveInstancia(materia){
        materiaService.saveMateria(materia)
    }
    def getInstanciaById(id){
        materiaService.getMateriaById(id)
    }

    def setCampoEditable(materia, nombreMateria){
        materia.nombre = nombreMateria
    }

    def allInstancias(){
        materiaService.allMaterias
    }

    def getTitulo(){
        "Materia"
    }

    def getLink(){
        "index"
    }

}
