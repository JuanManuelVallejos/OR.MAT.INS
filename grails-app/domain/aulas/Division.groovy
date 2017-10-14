package aulas

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
}
