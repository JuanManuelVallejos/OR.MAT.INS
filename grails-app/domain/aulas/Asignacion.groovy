package aulas

class Asignacion {

    Integer hora
    DiaSemana dia
    Docente docente
    Materia materia

    static belongsTo = [division: Division]

    static constraints = {
        hora inList: 0..24
        docente nullable: true
        materia nullable: true
    }
}
