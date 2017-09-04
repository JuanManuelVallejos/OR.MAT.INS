package aulas

class Division {
    String division
    List<Asignacion> asignaciones
    List<MateriaPorDocente> materiasPorDocente

    static belongsTo = [curso: Curso]

    static constraints = {
        asignaciones nullable: false
        materiasPorDocente nullable: false
    }

    Division(){
        asignaciones = new ArrayList<Asignacion>()
        materiasPorDocente = new ArrayList<MateriaPorDocente>()
    }
}
