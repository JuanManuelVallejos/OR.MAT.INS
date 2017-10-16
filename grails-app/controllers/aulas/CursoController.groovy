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

        [cursoInstance: cursoInstance, materias:materiaList, docentes: docenteList, divisionesOrdenadas: divisionesOrdenadas, horasCubiertas: false,finalizoPlazo: parametroSistemaService.finalizoPlazo]
    }

    def save(Curso cursoInstance) {
        actualizar(cursoInstance)
    }

    def addDivision(){
        def horaInicialTemporal = params.int('horaInicial')
        def cantidadHoras = params.int('cantidadHoras')
        Curso cursoInstance = cursoService.getCursoById(params.cursoId)
        Division division = divisionService.saveDivision(params.nombreDivision, cursoInstance, horaInicialTemporal, cantidadHoras)
        cursoInstance.addToDivisiones(division)
        cursoService.saveCurso(cursoInstance)
        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes
        def divisionesOrdenadas  = cursoService.getAllDivisiones cursoInstance
        def horaFinalTemporal = horaInicialTemporal + cantidadHoras - 1
        render([template:'/division/allDivisiones', model: [divisionesOrdenadas: divisionesOrdenadas, docentes: docenteList, materias: materiaList, horaInicialTemporal: horaInicialTemporal,horaFinalTemporal: horaFinalTemporal]])
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
