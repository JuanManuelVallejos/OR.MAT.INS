package aulas

import grails.transaction.Transactional

@Transactional
class DisponibilidadService {

    def getDisponibilidadById(id) {
        Disponibilidad.findById(id)
    }

    def eliminarDisponibilidad(disponibilidad){
        disponibilidad.delete flush: true
    }
}
