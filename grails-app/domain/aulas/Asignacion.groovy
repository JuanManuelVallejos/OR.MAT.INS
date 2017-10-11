package aulas

class Asignacion {

    Integer hora
    DayOfWeek dia

    static belongsTo = [division: Division]

    static constraints = {
        hora inList: 0..24
    }
}
