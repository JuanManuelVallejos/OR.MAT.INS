package aulas

import grails.transaction.Transactional

@Transactional
class CursoService {

    @Transactional(readOnly = true)
    def getCursoById(id){
        Curso.get(id)
    }

    @Transactional(readOnly = true)
    def getAllCursos(){
        Curso.all.sort{ it.nombre }
    }

    def getAllDivisiones(Curso curso){
        curso.divisiones.sort { it.division }
    }

    @Transactional
    def saveCurso(Curso curso){
        curso.save flush: true
    }

}
