package aulas

class CursoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", addDivision: "POST"]
    static cursoService
    static divisionService

    def index() {
        [cursos: Curso.all]
    }

    def show(Curso cursoInstance) {
        Division division = new Division()
        [cursoInstance: cursoInstance, divisionInstance: division]
    }

    def create(Curso cursoCreado) {
        respond new Curso(nombre: cursoCreado.nombre)
    }

    def save(Curso cursoInstance) {
        if (cursoInstance.hasErrors()) {
            respond cursoInstance.errors, view:'index'
            return
        }
        cursoInstance.save flush:true
        //redirect docenteInstance: cursoInstance
        render ([view: 'index', model:[cursos: Curso.all]])
    }

    def addDivision(){
        Curso cursoInstance = cursoService.getCursoById(params.cursoId)
        Division division = divisionService.saveDivision(params.nombreDivision)
        cursoService.addDivision(cursoInstance, division)
        render([view:'show',model:[cursoInstance: cursoInstance]])
    }

    def edit(Curso cursoInstance) {
        respond cursoInstance
    }
}
