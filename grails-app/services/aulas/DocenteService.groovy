package aulas

import grails.transaction.Transactional

@Transactional
class DocenteService {


    def getDocente(long id){
        return Docente.get(id)
    }

    def buscar(inputBusqueda) {
        def likeBusqueda = "%" + inputBusqueda + "%"
        return Docente.findAllByNombreLike(likeBusqueda,likeBusqueda)
    }

}
