package aulas

class DivisionService {

    def saveDivision(String nombreDivision) {
        Division newDivision = new Division(division: nombreDivision)
        newDivision.save flush: true
        newDivision
    }
}
