package aulas

class MateriaPorDocente {

    Materia materia
    Docente docente
    Integer horasACubrir
    static belongsTo = [division: Division]

    static constraints = {}
}
