package aulas

abstract class EditableController {

    abstract def saveInstancia(instancia)
    abstract def getInstanciaById(id)
    abstract def setCampoEditable(instancia, campo)
    abstract def allInstancias()

    def index(){
        [instancias: allInstancias(), edicion: -1]
    }

    def guardarInstanciaValidando(instancia){
        instancia.validate()
        if (instancia.hasErrors()) {
            flash.error = instancia.errors
            redirect(action: 'index')
            false
        }
        else {
            saveInstancia(instancia)
            true
        }
    }

    def modoEdicion(){
        Object instancia = getInstanciaById(params.instanciaId)
        int valorEdicion = params.int('valorEdicion')
        if(valorEdicion == instancia.id){
             setCampoEditable(instancia, params.nombreEditado)
            if(guardarInstanciaValidando(instancia))
                valorEdicion = -1
            else
                return
        }
        else
            valorEdicion = instancia.id
        render([view:'index', model:[instancias: allInstancias(), edicion: valorEdicion]])
    }
}
