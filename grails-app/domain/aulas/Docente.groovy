package aulas

import seguridad.User

class Docente {
    String nombre
    String apellido
    String email
    String telefono
    String direccion
    Integer edad
    Boolean titular
    String dni
    static belongsTo = [user: User]
    static hasMany = [materiasQueDicto: Materia, titulos: DocumentoRespaldatorio, disponibilidades: Disponibilidad]

    static constraints = {
        materiasQueDicto nullable: false
        titulos nullable: false
        nombre size:1..60, maxSize: 60
        apellido size:1..60, maxSize: 60
        email email: true
        telefono validator: { tel -> tel.isInteger() }
        direccion maxSize: 50
        edad min:18, max: 99
        titular blank: true, nullable: true
        dni unique: true, maxSize: 8, validator: { dni -> dni.isInteger() }
    }

    Docente(){
        materiasQueDicto = new ArrayList<Materia>()
        titulos = new ArrayList<DocumentoRespaldatorio>()
    }

    def getHorariosDeDia(DiaSemana dia){
        String horarios = ""
        List<Disponibilidad> disponibilidadesOrdenadas = disponibilidades.findAll {it.dia.equals(dia)}.sort {it.horaInicial}
        for(Disponibilidad disponibilidad in disponibilidadesOrdenadas){
            horarios += disponibilidad.horaInicial+"-"+disponibilidad.horaFinal+";"
        }
        if(horarios.isEmpty())
            return "Todo el día"
        horarios
    }

    def getDisponibilidadParaTarjeta(){
        String disponibilidad = "<b>Disponibilidad</b> <br/>"
        def dia = DiaSemana.LUNES
        for(i in 1..5){
            disponibilidad += dia.toString().take(2)+": "+getHorariosDeDia(dia)+"<br/>"
            dia++
        }
        disponibilidad
    }

}
