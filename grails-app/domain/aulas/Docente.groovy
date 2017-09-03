package aulas

class Docente {
    String nombre
    String apellido
    String email
    String telefono
    String direccion
    Integer edad
    Boolean titular
    String dni

    static constraints = {
        nombre size:1..60
        apellido size:1..60
        edad max: 99
        email email: true
        titular blank: true, nullable: true
    }
}
