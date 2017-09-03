package aulas

class CursoService {

    def getCursoOfDivision(Division division) {
        Curso cursoConDivision = null
        Curso.all.each {
            curso ->
            if(curso.divisiones.contains(division))
                cursoConDivision = curso
        }
        cursoConDivision
    }

    def getAllCursos(){
        Curso.getAll()
    }

}
