package aulas

class Asignacion {

    Integer hora
    static belongsTo = [division: Division]

    static constraints = {
        hora inList: 0..24
    }
}
