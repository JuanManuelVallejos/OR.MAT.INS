package aulas

class AsignacionService {

    def crearAsignacion(int hora, Division division, DiaSemana dia){
        Asignacion asignacion = new Asignacion(hora: hora, division: division, dia: dia)
        asignacion.save flush:true
        asignacion
    }
}
