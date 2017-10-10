package aulas

class Materia {
    String nombre

    static constraints = {
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
}
