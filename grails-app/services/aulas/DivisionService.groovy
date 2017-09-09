package aulas

class DivisionService {

    def getDivisionById(id){
        Division.get(id)
    }

    def saveDivision(String nombreDivision) {
        Division newDivision = new Division(division: nombreDivision)
        newDivision.save flush: true
        newDivision
    }
}
