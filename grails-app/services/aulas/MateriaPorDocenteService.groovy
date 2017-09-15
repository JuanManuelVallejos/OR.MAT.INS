package aulas


class MateriaPorDocenteService {

    static materiaService
    static docenteService
    static divisionService

    def getMateriaPorDocenteById(idMateriaPorDocente){
        MateriaPorDocente.get(idMateriaPorDocente)
    }

    def agregarMateriaPorDocenteEnDivision(idMateria,idDocente,idDivision, horas) {
        Division division = divisionService.getDivisionById(idDivision)
        Materia materia = materiaService.getMateriaById(idMateria)
        Docente docente = docenteService.getDocenteById(idDocente)
        MateriaPorDocente materiaXDocente = new MateriaPorDocente()
        materiaXDocente.division = division
        materiaXDocente.docente = docente
        materiaXDocente.materia = materia
        materiaXDocente.horasACubrir = horas
        materiaXDocente.save flush:true
    }

    def eliminarMateriaPorDocente(MateriaPorDocente materiaPorDocente){
        materiaPorDocente.delete flush: true
    }

}
