package aulas

class MateriaPorDocenteController {

    static materiaPorDocenteService
    static divisionService
    static materiaService
    static docenteService

    static allowedMethods = [save: "POST", deleteMateriaPorDocente: "POST"]

    def index() { }

    def save(){
        Integer horas= params.int('horas'+params.divisionId)
        Division divActual = divisionService.getDivisionById(params.divisionId)
        materiaPorDocenteService.agregarMateriaPorDocenteEnDivision(params.materiaId, params.docenteId, params.divisionId, horas)

        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes

        render([template: 'tabla',model:[division: divActual, materias:materiaList, docentes: docenteList, modoAdicion: false]])
    }

    def deleteMateriaPorDocente(){

        Division division = divisionService.getDivisionById(request.JSON.divisionId)
        MateriaPorDocente materiaPorDocente = materiaPorDocenteService.getMateriaPorDocenteById(request.JSON.materiaPorDocenteId)
        materiaPorDocenteService.eliminarMateriaPorDocente(materiaPorDocente)

        List<Materia> materiaList = materiaService.allMaterias
        List<Docente> docenteList = docenteService.allDocentes

        render([template: '/division/dataDivision',model:[divisionInstance: division, materias:materiaList, docentes: docenteList, idDivision: division.id]])
    }

    def filterDocentePorMateria(){
        Materia materia = materiaService.getMateriaById(request.JSON.materiaId)
        render(contentType: 'text/json') {[
                'results': getDocentesParaSelectDeMateria(materia),
                'status': results ? "OK" : "Nothing present"
        ]}
    }

    def getDocentesParaSelectDeMateria(Materia materia){
        String resultadoSelect = ""
        List<Docente> docentesParaMateria = docenteService.getDocentesQueDictenMateria(materia)
        if(docentesParaMateria.empty)
            resultadoSelect += buildOptionWith("null","La materia no tiene docente asignado")
        else
            resultadoSelect += buildOptionWith("null","Seleccione un docente")

        for(Docente docente in docentesParaMateria)
            resultadoSelect += buildOptionWith(docente.id,docente.apellido)
        return resultadoSelect
    }

    def buildOptionWith(key, value){
        "<option value=\"${key}\">${value}</option>"
    }

}
