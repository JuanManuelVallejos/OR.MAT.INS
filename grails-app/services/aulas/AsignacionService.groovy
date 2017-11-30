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
        def a = limpiarAsignacionesDeDivision(division)
        for (TarjetaAsignacion tarjeta in tarjetasAsignacion){
            Asignacion asignacion = Asignacion.findByHoraAndDiaAndDivision(tarjeta.hora, tarjeta.dia, division)
            asignacion.docente = tarjeta.docente
            asignacion.materia = tarjeta.materia
            asignacion.save flush: true
        }
    }

    def limpiarAsignacionesDeDivision(Division division){
        for(Asignacion asignacion in Asignacion.findAllByDivision(division)){
            asignacion.docente = null
            asignacion.materia = null
            asignacion.save flush: true
        }
    }

    def docenteTieneMateriaAsignadaEnDiaYHora(Division division, Docente docente, DiaSemana dia, int hora){
        def noPuede = allAsignaciones.findAll {
            it.docenteId == docente.id && it.dia == dia && it.hora == hora && it.division != division
        }.size() > 0
        return !noPuede
    }

}
