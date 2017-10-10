package aulas

import seguridad.User

class Docente {
    String nombre
    String apellido
    String email
    String telefono
    String direccion
    Integer edad
    Boolean titular
    String dni
    static belongsTo = [user: User]
    static hasMany = [materiasQueDicto: Materia, titulos: DocumentoRespaldatorio]

    static constraints = {
        materiasQueDicto nullable: false
        titulos nullable: false
        nombre size:1..60, maxSize: 60
        apellido size:1..60, maxSize: 60
        email email: true
        telefono validator: { tel -> tel.isInteger() }
        direccion maxSize: 50
        edad min:18, max: 99
        titular blank: true, nullable: true
        dni unique: true, maxSize: 8, validator: { dni -> dni.isInteger() }
    }

    Docente(){
        materiasQueDicto = new ArrayList<Materia>()
        titulos = new ArrayList<DocumentoRespaldatorio>()
    }

}
