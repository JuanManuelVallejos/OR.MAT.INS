package aulas

class CursoController extends EditableController{

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", addDivision: "POST", SetEditableOActualizar: "POST"]
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

        [cursoInstance: cursoInstance, materias:materiaList, docentes: docenteList, divisionesOrdenadas: divisionesOrdenadas, horasCubiertas: false]
    }

    def save(Curso cursoInstance) {
        actualizar(cursoInstance)
    }

    def addDivision(){
        Curso cursoInstance = cursoService.getCursoById(params.cursoId)
        Division division = divisionService.saveDivision(params.nombreDivision, cursoInstance, params.int('horaInicial'), params.int('cantidadHoras'))
        cursoInstance.addToDivisiones(division)
        cursoService.saveCurso(cursoInstance)
        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes
        List<Division> divisionesOrdenadas = cursoService.getAllDivisiones cursoInstance

        render([template:'/division/allDivisiones', model: [divisionesOrdenadas: divisionesOrdenadas, docentes: docenteList, materias: materiaList, horasCubiertas: true]])
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

    def getTitulo(){
        "Curso"
    }

    def getLink(){
        "show"
    }
}
