package aulas

import seguridad.User

class DivisionService {

    static asignacionService

    def getDivisionById(id){
        Division.get(id)
    }

    def saveDivision(String nombreDivision, Curso curso, horaInicial, cantidadHoras) {
        Division newDivision = new Division(division: nombreDivision, curso: curso)
        newDivision.save flush: true
        generateAsignaciones(newDivision, horaInicial, cantidadHoras)
        newDivision
    }

    def generateAsignaciones(Division division, horaInicial, horas) {
        for (int hora = horaInicial; hora < horaInicial + horas; hora++) {
            addAsignacion(division, hora)
        }
    }

    def addAsignacion(Division division, hora){
        Asignacion asignacion = asignacionService.crearAsignacion(hora, division)
        asignacion
    }

    def eliminarDivision(Division division){
        division.curso.divisiones.remove(division)
        division.curso.save flush:true
        division.delete flush:true
    }

}
