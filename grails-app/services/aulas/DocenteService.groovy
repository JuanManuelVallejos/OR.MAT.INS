package aulas

class DocenteService {


    def getDocenteById(id){
        return Docente.get(id)
    }

    def buscar(inputBusqueda) {
        def likeBusqueda = "%" + inputBusqueda + "%"
        return Docente.findAllByNombreLike(likeBusqueda,likeBusqueda)
    }

    def getAllDocentes(){
        Docente.getAll()
    }

    def saveDocente(Docente docente){
        docente.save flush:true
    }
}
