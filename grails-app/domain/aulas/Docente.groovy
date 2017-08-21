package aulas

class Docente {
    String nombre
    String apellido
    String email
    String telefono
    String direccion
    Integer edad

    static constraints = {
        nombre(size:1..30)
        apellido(size:1..30)
        edad(max: 99)
    }
}
