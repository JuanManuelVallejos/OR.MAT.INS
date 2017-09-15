package aulas

class CursoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", addDivision: "POST"]
    static cursoService
    static divisionService
    static materiaService
    static docenteService

    def index() {
        [cursos: cursoService.allCursos]
    }

    def show(Curso cursoInstance) {
        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes

        List<Division> divisionesOrdenadas = cursoService.getAllDivisiones cursoInstance

        [cursoInstance: cursoInstance, materias:materiaList, docentes: docenteList, divisionesOrdenadas: divisionesOrdenadas]
    }

    def create(Curso cursoCreado) {
        respond new Curso(nombre: cursoCreado.nombre)
    }

    def save(Curso cursoInstance) {
        cursoInstance.validate()

        if (cursoInstance.hasErrors())
            flash.error = "El nombre ingresado del curso no debe exceder los 30 caracteres"
        else
            cursoService.saveCurso(cursoInstance)

        redirect(action: 'index')
    }

    def addDivision(){
        Curso cursoInstance = cursoService.getCursoById(params.cursoId)
        Division division = divisionService.saveDivision(params.nombreDivision, cursoInstance)
        cursoService.addDivision(cursoInstance, division)

        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes
        List<Division> divisionesOrdenadas = cursoService.getAllDivisiones cursoInstance

        render([view:'show',model:[cursoInstance: cursoInstance, materias:materiaList, docentes: docenteList, divisionesOrdenadas: divisionesOrdenadas]])
    }

    def edit(Curso cursoInstance) {
        respond cursoInstance
    }
}
