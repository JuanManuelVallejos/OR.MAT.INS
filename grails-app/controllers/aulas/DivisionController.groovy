package aulas

class DivisionController {

    static materiaService
    static docenteService
    static divisionService
    static cursoService

    static allowedMethods = [eliminar: "POST"]

    def index() { }

    def show(long id) {
        Division division = divisionService.getDivisionById id
        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes

        [cursoInstance: division.curso, divisionInstance: division, materias:materiaList, docentes: docenteList]
    }

    def eliminar(){
        Division division = divisionService.getDivisionById(params.divisionID)
        Curso curso = division.curso
        divisionService.eliminarDivision(division)

        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes
        List<Division> divisionesOrdenadas = cursoService.getAllDivisiones curso

        render([view: '/curso/show',model:[cursoInstance: curso, materias:materiaList, docentes: docenteList, divisionesOrdenadas:divisionesOrdenadas]])
    }

    def getHorasAAsignarCubiertas(){
        Division division = divisionService.getDivisionById(request.JSON.divisionID)
        render(contentType: 'text/json') {[
                'result': division.horasAAsignarCubiertas,
                'status': result ? "OK" : "Nothing present"
        ]}
    }

    def getTotalHorasAsignacion(){
        Division division = divisionService.getDivisionById(request.JSON.divisionID)
        render(contentType: 'text/json') {[
                'result': division.totalHorasAsignacion,
                'status': result ? "OK" : "Nothing present"
        ]}
    }

}
