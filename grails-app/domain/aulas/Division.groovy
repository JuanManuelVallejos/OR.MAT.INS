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

    def getTarjetasAsignacion(){
        def idTarjeta = 0
        List<TarjetaAsignacion> tarjetas = new ArrayList<TarjetaAsignacion>()
        for (MateriaPorDocente matXDoc in materiasPorDocente){
            for (i in 1..matXDoc.horasACubrir){
                TarjetaAsignacion tarjeta = new TarjetaAsignacion()
                tarjeta.materia = matXDoc.materia
                tarjeta.docente = matXDoc.docente
                tarjeta.idMateriaPorDocente = matXDoc.id
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
}
