package aulas

class Materia {
    String nombre

    static constraints = {
        nombre validator: { val, obj, errors ->
            if (val == "")
            {
                return errors.rejectValue('nombre', 'El campo nombre no debe ser vacio')
            }
            else{
                if(val?.size() > 50){
                    return errors.rejectValue('nombre', 'El campo nombre no debe superar los 50 caracteres')
                }
                return false
            }
        }
        //nombre blank: false, maxSize: 50, validator: {value, object ->
            //if(nombre) return 'validation.idStartsWith77'
    }
}
