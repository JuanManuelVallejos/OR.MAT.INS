package aulas
import DTOs.TarjetaAsignacion

class AdministracionController {

    static allowedMethods = [finalizarPlazo: "POST"]
    def divisionService
    def parametroSistemaService
    def asignacionService
    def cursoService

    static tarjetaInstances = new ArrayList<TarjetaAsignacion>()
    static tarjetaActual = new TarjetaAsignacion()

    def index() {
        render(view: 'index', model:[finalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignaciones: parametroSistemaService.finalizoAsignacion])
    }

    def finalizarPlazo(){
        if(!divisionService.estanCubiertasTodasLasDivisiones){
            render(view: 'index', model: [divisionesSinCubrir: divisionService.divisionesSinCubrir, finalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignaciones: parametroSistemaService.finalizoAsignacion])
        }else{
            parametroSistemaService.setPlazoFinalizado()
            render(view: 'index', model:[finalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignaciones: parametroSistemaService.finalizoAsignacion])
        }
    }

    def extenderPlazo(){
        parametroSistemaService.setExtenderPlazo()
        render(view: 'index', model:[finalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignaciones: parametroSistemaService.finalizoAsignacion])
    }

    def extenderAsignacion(){
        parametroSistemaService.setExtenderAsignacion()
        render(view: 'index', model:[finalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignaciones: parametroSistemaService.finalizoAsignacion])
    }

    def finalizarAsignaciones(){
        if(!divisionService.seAsignaronTodasDivisiones){
            render(view: 'index', model: [divisionesSinAsignar: divisionService.divisionesSinAsignar, finalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignaciones: parametroSistemaService.finalizoAsignacion])
        }else{
            parametroSistemaService.setAsignacionesFinalizadas()
            render(view: 'index', model:[finalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignaciones: parametroSistemaService.finalizoAsignacion])
        }
    }

    def seleccionarAsignacionDivision(){
        render(view: 'seleccionarAsignacionDivision', model:[cursos: cursoService.allCursos])
    }

    def seleccionarResultadoDivision(){
        render(view: 'seleccionarResultadoDivision', model:[cursos: cursoService.allCursos])
    }

    def asignacionHorarios(){
        Division division = divisionService.getDivisionById(params.id)
        tarjetaInstances = division.tarjetasAsignacion
        render([view:'asignacionHorarios', model: [divisionInstance: division, tarjetas: tarjetaInstances]])
    }

    def setDroppableValue(){
        TarjetaAsignacion tar = tarjetaInstances.getAt(request.JSON.idTarjeta)
        tar.hora = request.JSON.hora
        tar.dia = (request.JSON.dia as DiaSemana)

        render(contentType: 'text/json') {[
                'status': "OK"
        ]}
    }

    def setTarjetaActual(){
        TarjetaAsignacion tar = tarjetaInstances.getAt(request.JSON.idTarjeta)
        tarjetaActual = tar

        render(contentType: 'text/json') {[
                'status': "OK"
        ]}
    }

    def docentePuedeEnHorario(){
        def puede = asignacionService.docenteTieneMateriaAsignadaEnDiaYHora(tarjetaActual.docente,(request.JSON.dia as DiaSemana),request.JSON.hora)
        render(contentType: 'text/json') {[
                'result': puede as boolean,
                'status': result ? "OK" : "Nothing present"
        ]}
    }

    def reiniciarTarjeta(){
        TarjetaAsignacion tar = tarjetaInstances.getAt(request.JSON.idTarjeta)
        tar.hora = null
        tar.dia = null
        render(contentType: 'text/json') {[
                'status': "OK"
        ]}
    }

    def getPuedeFinalizar(){
        return tarjetaInstances.findAll { it.hora == null}.empty
    }

    def getPuedeFinalizarForJS(){
        def puede = puedeFinalizar
        render(contentType: 'text/json') {[
                'result': puede as String,
                'status': result ? "OK" : "Nothing present"
        ]}
    }

    def finalizarAsignacionDivision(){
        Division division = divisionService.getDivisionById(params.divisionID)
        if(puedeFinalizar){
            asignacionService.asignarTarjetas(division, tarjetaInstances)
            render([view:'resultadoAsignacionDivision', model: [divisionInstance: division]])
        }
        else{
            render([view: 'asignacionHorarios', model: [divisionInstance: division, tarjetas: tarjetaInstances]])
        }
    }

    def viewResultadosAsignacion(){
        Division division = divisionService.getDivisionById(params.id)
        render([view:'resultadoAsignacionDivision', model: [divisionInstance: division]])
    }
}