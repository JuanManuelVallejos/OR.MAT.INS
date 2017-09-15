package aulas

class Curso {
    static hasMany = [divisiones: Division]
    String nombre

    static constraints = {
        divisiones nullable: false
        nombre size: 1..30, maxSize: 30
    }

    Curso(){
        divisiones = new ArrayList<Division>()
    }
}
