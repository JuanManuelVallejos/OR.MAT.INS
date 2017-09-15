package aulas

class MateriaPorDocenteController {

    static materiaPorDocenteService
    static divisionService
    static materiaService
    static docenteService

    static allowedMethods = [save: "POST", deleteMateriaPorDocente: "POST"]

    def index() { }

    def save(){
        Integer horas= params.int('horas')
        Division divActual = divisionService.getDivisionById(params.divisionId)
        materiaPorDocenteService.agregarMateriaPorDocenteEnDivision(params.materiaId, params.docenteId, params.divisionId, horas)

        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes

        render([template: 'tabla',model:[division: divActual, materias:materiaList, docentes: docenteList, modoAdicion: false]])
    }

    def deleteMateriaPorDocente(){
        
        Division division = divisionService.getDivisionById(params.divisionId)
        MateriaPorDocente materiaPorDocente = materiaPorDocenteService.getMateriaPorDocenteById(params.matXDocId)
        materiaPorDocenteService.eliminarMateriaPorDocente(materiaPorDocente)

        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes

        render([template: '/division/dataDivision',model:[divisionInstance: division, materias:materiaList, docentes: docenteList, idDivision: division.id]])
    }

}
