package aulas

class DivisionController {

    static scaffold = true

    def index() { }

    def show(long id) {
        Division division = Division.findById(id)
        Curso cursoActual = null

        Curso.all.each{c ->
            if(c.divisiones.contains(division))
                cursoActual = c
        }

        [cursoInstance: cursoActual, divisionInstance: division]
    }
}
