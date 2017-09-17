package aulas

class Curso {
    String nombre

    static hasMany = [divisiones: Division]

    static constraints = {
        divisiones nullable: false
        nombre size: 1..30, maxSize: 30
    }

    Curso(){
        divisiones = new ArrayList<Division>()
    }

//    void validar() {
//        if (!nombre) {
//            reject
//        }
//    }
}
