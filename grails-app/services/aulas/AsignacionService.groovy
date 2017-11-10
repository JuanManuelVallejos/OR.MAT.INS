package aulas
import DTOs.TarjetaAsignacion

class AsignacionService {

    def getAllAsignaciones(){
        Asignacion.all
    }

    def crearAsignacion(int hora, Division division, DiaSemana dia){
        Asignacion asignacion = new Asignacion(hora: hora, division: division, dia: dia)
        asignacion.save flush:true
        asignacion
    }

    def asignarTarjetas(Division division, List<TarjetaAsignacion> tarjetasAsignacion){
        for (TarjetaAsignacion tarjeta in tarjetasAsignacion){
            Asignacion asignacion = Asignacion.findByHoraAndDiaAndDivision(tarjeta.hora, tarjeta.dia, division)
            asignacion.docente = tarjeta.docente
            asignacion.materia = tarjeta.materia
            asignacion.save flush: true
        }
    }

    def docenteTieneMateriaAsignadaEnDiaYHora(Docente docente, DiaSemana dia, int hora){
        def noPuede = allAsignaciones.findAll {
            it.docenteId == docente.id && it.dia == dia && it.hora == hora
        }.size() > 0
        return !noPuede
    }

}
