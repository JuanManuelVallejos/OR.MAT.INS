package aulas

class Asignacion {

    Integer hora
    DiaSemana dia
    Docente docente

    static belongsTo = [division: Division]

    static constraints = {
        hora inList: 0..24
        docente nullable: true
    }
}
