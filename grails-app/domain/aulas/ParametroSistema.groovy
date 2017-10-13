package aulas


class ParametroSistema {

    String clave
    String valor

    static constraints ={
        clave unique: true, nullable: false
        valor nullable: false
    }

}
