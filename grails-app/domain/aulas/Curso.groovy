package aulas

class Curso {
    String nombre

    static hasMany = [divisiones: Division]

    static constraints = {
        divisiones nullable: false
        nombre validator: { val, obj, errors ->
            if (val == "")
            {
                return errors.rejectValue('nombre', 'El campo nombre no debe ser vacio')
            }
            if(val?.size() > 50){
                return errors.rejectValue('nombre', 'El campo nombre no debe superar los 50 caracteres')
            }
        }
    }

    Curso(){
        divisiones = new ArrayList<Division>()
    }
}
