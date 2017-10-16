package aulas

class AdministracionController {

    static allowedMethods = [finalizarPlazo: "POST"]
    def divisionService
    def parametroSistemaService
    def materiaPorDocenteService
    def cursoService

    def index() {
        render(view: 'index', model:[finalizoPlazo: parametroSistemaService.finalizoPlazo])
    }

    def finalizarPlazo(){
        if(!divisionService.estanCubiertasTodasLasDivisiones){
            render(view: 'index', model: [divisionesSinCubrir: divisionService.divisionesSinCubrir, finalizarPlazo: parametroSistemaService.finalizoPlazo])
        }else{
            parametroSistemaService.setPlazoFinalizado()
            render(view: 'index', model:[finalizoPlazo: parametroSistemaService.finalizoPlazo])
        }
    }

    def extenderPlazo(){
        parametroSistemaService.setExtenderPlazo()
        render(view: 'index', model:[finalizoPlazo: parametroSistemaService.finalizoPlazo])
    }

    def seleccionarAsignacionDivision(){
        render(view: 'seleccionarAsignacionDivision', model:[cursos: cursoService.allCursos])
    }

    def asignacionHorarios(){
        Division division = divisionService.getDivisionById(params.id)
        render([view:'asignacionHorarios', model: [divisionInstance: division, tarjetas: division.tarjetasAsignacion]])
    }

    def setDroppableValue(){
        def materiaPorDocente = materiaPorDocenteService.getMateriaPorDocenteById(request.JSON.idMatXDoc)
        render(contentType: 'text/json') {[
                'result': "Docente: "+materiaPorDocente.docente.apellido+"<br/> Materia: "+materiaPorDocente.materia.nombre,
                'status': result ? "OK" : "Nothing present"
        ]}
    }
}
