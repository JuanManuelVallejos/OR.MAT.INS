package aulas

class DivisionController {

    static scaffold = true
    private cursoService

    def index() { }

    def save(Curso curso, Division division) {
        curso.divisiones = new ArrayList<Division>()
        curso.divisiones.add(division)
        curso.save flush:true

        division.save flush:true

        render ([view: "/curso/show", model:[cursoInstance: curso]])
    }

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
