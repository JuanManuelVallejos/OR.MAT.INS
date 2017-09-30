package aulas

class MateriaService {

    def getMateriaById(id) {
        Materia.get(id)
    }

    def saveMateria(Materia materia){
        materia.save flush: true
    }

    def getAllMaterias(){
        Materia.all.sort { it.nombre }
    }
}
