package aulas

class AsignacionService {

    def crearAsignacion(int hora, Division division){
        Asignacion asignacion = new Asignacion(hora: hora, division: division)
        asignacion.save flush:true
        asignacion
    }
}
