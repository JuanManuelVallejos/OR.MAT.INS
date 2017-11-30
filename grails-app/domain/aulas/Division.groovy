package aulas

import DTOs.TarjetaAsignacion

class Division {

    String division
    static hasMany = [
            asignaciones: Asignacion,
            materiasPorDocente: MateriaPorDocente
    ]
    static belongsTo = [curso: Curso]

    static constraints = {
        asignaciones nullable: false
        materiasPorDocente nullable: false
    }

    Division(){
        asignaciones = new ArrayList<Asignacion>()
        materiasPorDocente = new ArrayList<MateriaPorDocente>()
    }

    def validate(){
        if(this.division)
            this.errors.reject("El nombre de la division no puede ser nula")
    }

    def getTotalHorasAsignacion(){
        asignaciones.size()
    }

    def getHorasAAsignarCubiertas(){
        if(materiasPorDocente.size() == 0) return 0
        materiasPorDocente.sum { it.horasACubrir }
    }

    def getHorasAAsignarSinCubrir(){
        totalHorasAsignacion - horasAAsignarCubiertas
    }

    def getSeCubrieronHorasAAsignar(){
        totalHorasAsignacion - horasAAsignarCubiertas == 0
    }

    def sobrepasaHorasAAsignar(cantidadHoras){
        horasAAsignarCubiertas + cantidadHoras > totalHorasAsignacion
    }

    def getPrimerHora(){
        asignaciones.min{it.hora}?.hora
    }

    def getUltimaHora(){
        asignaciones.max {it.hora}?.hora
    }

    def getCantidadAsignacionesHechasDe(MateriaPorDocente matXDoc){
        asignaciones.findAll {it.docente == matXDoc.docente && it.materia == matXDoc.materia}.size()
    }

    def getTarjetasAsignacion(){
        def idTarjeta = 0
        List<TarjetaAsignacion> tarjetas = new ArrayList<TarjetaAsignacion>()
        for (MateriaPorDocente matXDoc in materiasPorDocente){
            for (i in 1..matXDoc.horasACubrir){
                TarjetaAsignacion tarjeta = new TarjetaAsignacion()
                tarjeta.materia = matXDoc.materia
                tarjeta.docente = matXDoc.docente
                tarjeta.idMateriaPorDocente = matXDoc.id
                tarjeta.disponibilidad = matXDoc.docente.disponibilidadParaTarjeta
                tarjeta.id = idTarjeta
                idTarjeta++
                tarjetas.add(tarjeta)
            }
        }
        return tarjetas
    }

    def getTarjetasSinAsignar(){
        def idTarjeta = 0
        List<TarjetaAsignacion> tarjetas = new ArrayList<TarjetaAsignacion>()
        for (MateriaPorDocente matXDoc in materiasPorDocente){
            (matXDoc.horasACubrir - getCantidadAsignacionesHechasDe(matXDoc)).times{
                // TODO: Unificar con el metodo
                TarjetaAsignacion tarjeta = new TarjetaAsignacion()
                tarjeta.materia = matXDoc.materia
                tarjeta.docente = matXDoc.docente
                tarjeta.idMateriaPorDocente = matXDoc.id
                tarjeta.disponibilidad = matXDoc.docente.disponibilidadParaTarjeta
                tarjeta.id = idTarjeta
                idTarjeta++
                tarjetas.add(tarjeta)
            }
        }
        return tarjetas
    }

    def getTarjetasAsignadas(){
        def idTarjeta = 1000
        List<TarjetaAsignacion> tarjetas = new ArrayList<TarjetaAsignacion>()
        for(Asignacion asignacion in asignaciones){
            if(asignacion.docente != null){
                TarjetaAsignacion tarjeta = new TarjetaAsignacion()
                tarjeta.materia = asignacion.materia
                tarjeta.docente = asignacion.docente
                tarjeta.hora = asignacion.hora
                tarjeta.dia = asignacion.dia
                tarjeta.disponibilidad = asignacion.docente.getDisponibilidadParaTarjeta()
                tarjeta.id = idTarjeta
                idTarjeta++
                tarjetas.add(tarjeta)
            }
        }
        return tarjetas
    }

    def getAsignacionHecha(){
        asignaciones.first().docente != null
    }

    def getAsignacionesIncompletas(){
        asignaciones.findAll { it.docente == null }
    }

    def getAsignacionesFueronCompletas(){
        asignacionesIncompletas.size() == 0
    }

}
