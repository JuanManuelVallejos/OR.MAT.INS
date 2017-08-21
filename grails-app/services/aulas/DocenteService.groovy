package aulas

import grails.transaction.Transactional

@Transactional
class DocenteService {


    def getDocente(long id){
        return Docente.get(id)
    }

}
