package aulas

abstract class EditableController {

    abstract def saveInstancia(instancia)

    abstract def getInstanciaById(id)

    abstract def setCampoEditable(instancia, campo)

    abstract def allInstancias()

    abstract def getTitulo()

    abstract def getLink()

    def index() {
        render([view: '/editable/grillaEditable', model:
                [instancias: allInstancias(),
                 titulo    : getTitulo(), accionLink: getLink()]])
    }

    def SetEditableOActualizar() {
        def instancia = getInstanciaById(params.instanciaId)
        if (params.seQuiereEditar && params.seQuiereEditar == params.instanciaId) {
            params.instanciaEdicion = null
            params.nombre = params.nombre ?: params.nombreEditado
            bindData(instancia, params)
            actualizar(instancia)
        } else {
            renderTabla(instancia)
        }
    }

    def actualizar(instancia) {
        instancia.validate()
        if (!instancia.hasErrors()) {
            saveInstancia(instancia)
            renderTabla(null)
            return
        }
        renderTabla(instancia)
    }

    def renderTabla(instancia){
        render([template: '/editable/tablaEditable',
                model   : [instancias: allInstancias(), accionLink: getLink(),
                           instanciaEdicion: instancia]])
    }
}
