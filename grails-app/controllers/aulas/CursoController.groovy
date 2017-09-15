package aulas

class CursoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", addDivision: "POST"]
    static cursoService
    static divisionService
    static materiaService
    static docenteService

    def index() {
        [cursos: cursoService.allCursos, edicionCurso: -1]
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
        if(guardarCursoValidando(cursoInstance))
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

    def guardarCursoValidando(Curso curso){
        curso.validate()
        if (curso.hasErrors()) {
            flash.error = "El nombre ingresado del curso no debe exceder los 50 caracteres"
            redirect(action: 'index')
            false
        }
        else {
            cursoService.saveCurso(curso)
            true
        }
    }
    
    def modoEdicion(){
        Curso curso = cursoService.getCursoById(params.cursoId)
        int valorEdicion = params.int('valorEdicion')
        if(valorEdicion == curso.id){
            curso.nombre = params.nombreEditado
            if(guardarCursoValidando(curso))
                valorEdicion = -1
            else
                return
        }
        else
            valorEdicion = curso.id
        render([view:'index', model:[cursos: cursoService.allCursos, edicionCurso: valorEdicion]])
    }
}
