package aulas

class Disponibilidad {

    DiaSemana dia
    Integer horaInicial
    Integer horaFinal

    static belongsTo = [docente: Docente]

    static constraints = {
        dia nullable: false
        horaInicial nullable: false
        horaFinal nullable: false
    }

}