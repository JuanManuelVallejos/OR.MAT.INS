package aulas

class MateriaPorDocenteController {

    static materiaPorDocenteService

    def index() { }

    def save(){
        Integer horas= params.int('horas')
        materiaPorDocenteService.agregarMateriaPorDocenteEnDivision(params.materiaId, params.docenteId, params.divisionId, horas)
    }
}
