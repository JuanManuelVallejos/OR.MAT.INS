package aulas

class AsignacionService {

    def crearAsignacion(int hora, Division division, DayOfWeek dia){
        Asignacion asignacion = new Asignacion(hora: hora, division: division, dia: dia)
        asignacion.save flush:true
        asignacion
    }
}
