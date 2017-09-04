package aulas

class CursoService {

    def addDivision(Curso curso, Division division){
        if(curso.divisiones == null)
            curso.divisiones = new ArrayList<Division>()
        curso.divisiones.add division
        division.setCurso(curso)
        division.save flush:true
        curso.save flush:true
    }

    def getCursoById(id){
        Curso.get(id)
    }

}
