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

    def eliminarDisponibilidadesDeDocente(docente, disponibilidades){
        docente.disponibilidades.removeAll(disponibilidades)
        for(Disponibilidad disponibilidad in disponibilidades){
            disponibilidad.delete flush: true
        }
        docente.save flush: true
    }
}
