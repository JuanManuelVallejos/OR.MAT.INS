package aulas

class Materia {
    String nombre

    static constraints = {
        nombre size: 1..50
    }
}
