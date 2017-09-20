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

}
