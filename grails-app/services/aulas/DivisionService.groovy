package aulas

class DivisionService {

    static asignacionService

    def getDivisionById(id){
        Division.get(id)
    }

    def getAllDivisiones(){
        Division.all
    }

    def saveDivision(String nombreDivision, Curso curso, horaInicial, cantidadHoras) {
        Division newDivision = new Division(division: nombreDivision, curso: curso)
        newDivision.save flush: true
        generateAsignaciones(newDivision, horaInicial, cantidadHoras)
    }

    def generateAsignaciones(Division division,int horaInicial, int horas) {
        println horas
        def dia = DiaSemana.LUNES
        for(i in 1..5){
            addAsignacionesPorDia(division,horaInicial, horas, dia)
            dia++
        }
        division
    }

    def addAsignacionesPorDia(Division division, int horaInicial, int horas, DiaSemana dia){
        for (int hora = horaInicial; hora < horaInicial + horas; hora++) {
            addAsignacion(division, hora, dia)
        }
    }

    def addAsignacion(Division division, int hora, DiaSemana dia){
        Asignacion asignacion = asignacionService.crearAsignacion(hora, division, dia)
        asignacion
    }

    def eliminarDivision(Division division){
        division.curso.divisiones.remove(division)
        division.curso.save flush:true
        division.delete flush:true
    }

    def getDivisionesSinCubrir(){
        allDivisiones.findAll {!it.seCubrieronHorasAAsignar}
    }

    def getEstanCubiertasTodasLasDivisiones(){
        return divisionesSinCubrir.empty
    }
}
