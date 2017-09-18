package aulas

class CursoController extends EditableController{

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", addDivision: "POST"]
    static cursoService
    static divisionService
    static materiaService
    static docenteService

    def index() {
        super.index()
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
        if(guardarInstanciaValidando(cursoInstance))
            redirect(action: 'index')
    }

    def addDivision(){
        Curso cursoInstance = cursoService.getCursoById(params.cursoId)
        Division division = divisionService.saveDivision(params.nombreDivision, cursoInstance, params.int('horaInicial'), params.int('cantidadHoras'))
        //cursoService.addDivision(cursoInstance, division)
        cursoInstance.addToDivisiones(division)
        cursoService.saveCurso(cursoInstance)
        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes
        List<Division> divisionesOrdenadas = cursoService.getAllDivisiones cursoInstance

        render([view:'show',model:[cursoInstance: cursoInstance, materias:materiaList, docentes: docenteList, divisionesOrdenadas: divisionesOrdenadas]])
    }

    def edit(Curso cursoInstance) {
        respond cursoInstance
    }

    def saveInstancia(curso){
        cursoService.saveCurso(curso)
    }
    def getInstanciaById(id){
        cursoService.getCursoById(id)
    }

    def setCampoEditable(curso, nombreCurso){
        curso.nombre = nombreCurso
    }

    def allInstancias(){
        cursoService.allCursos
    }
}
