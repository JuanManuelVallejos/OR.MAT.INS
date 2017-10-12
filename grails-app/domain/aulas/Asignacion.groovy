package aulas

class Asignacion {

    Integer hora
    DiaSemana dia

    static belongsTo = [division: Division]

    static constraints = {
        hora inList: 0..24
    }
}
