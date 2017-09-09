package aulas

class DivisionController {

    static materiaService
    static docenteService

    def index() { }

    def show(long id) {
        Division division = Division.findById(id)
        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes

        [cursoInstance: division.curso, divisionInstance: division, materias:materiaList, docentes: docenteList]
    }
}
