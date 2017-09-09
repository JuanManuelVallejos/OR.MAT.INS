package aulas

class MateriaService {

    def getMateriaById(id) {
        Materia.get(id)
    }

    def getAllMaterias(){
        Materia.getAll()
    }
}
