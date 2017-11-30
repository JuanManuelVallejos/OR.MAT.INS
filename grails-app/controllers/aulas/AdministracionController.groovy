package aulas
import DTOs.TarjetaAsignacion

class AdministracionController {

    static allowedMethods = [finalizarPlazo: "POST"]
    def divisionService
    def parametroSistemaService
    def asignacionService
    def cursoService

    static List<TarjetaAsignacion> tarjetasAsignadas = new ArrayList<TarjetaAsignacion>()
    static List<TarjetaAsignacion> tarjetasSinAsignar = new ArrayList<TarjetaAsignacion>()
    static TarjetaAsignacion tarjetaActual = new TarjetaAsignacion()

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
        tarjetasAsignadas = division.tarjetasAsignadas
        tarjetasSinAsignar= division.tarjetasSinAsignar

        render([view:'asignacionHorarios', model: [divisionInstance: division,tarjetas: tarjetasSinAsignar, tarjetasAsignadas: tarjetasAsignadas]])
    }

    def getTarjetaById(id){
        def tarjeta = tarjetasAsignadas.find {it.id == id}
        if(tarjeta == null)
            tarjeta = tarjetasSinAsignar.find {it.id == id}
        return tarjeta
    }

    def setDroppableValue(){
        TarjetaAsignacion tar = getTarjetaById(request.JSON.idTarjeta)
        tar.hora = request.JSON.hora
        tar.dia = (request.JSON.dia as DiaSemana)
        tarjetasSinAsignar.remove(tar)
        tarjetasAsignadas.remove(tar)
        tarjetasAsignadas.add(tar)
        render(contentType: 'text/json') {[
                'status': "OK"
        ]}
    }

    def setTarjetaActual(){
        tarjetaActual = getTarjetaById(request.JSON.idTarjeta)
        render(contentType: 'text/json') {[
                'status': "OK"
        ]}
    }

    def docentePuedeEnHorario(){
        def puede = true
        Division division = divisionService.getDivisionById(request.JSON.divisionID)
        if(tarjetaActual && tarjetaActual.docente){
            puede = asignacionService.docenteTieneMateriaAsignadaEnDiaYHora(division, tarjetaActual.docente,(request.JSON.dia as DiaSemana),request.JSON.hora)
        }
        render(contentType: 'text/json') {[
                'result': puede as boolean,
                'status': result ? "OK" : "Nothing present"
        ]}
    }

    def reiniciarTarjeta(){
        TarjetaAsignacion tar = getTarjetaById(request.JSON.idTarjeta)
        tar.hora = null
        tar.dia = null
        tarjetasAsignadas.remove(tar)
        tarjetasSinAsignar.add(tar)
        render(contentType: 'text/json') {[
                'status': "OK"
        ]}
    }

    def guardarAsignacionesDivision(){
        Division division = divisionService.getDivisionById(params.divisionID)
        asignacionService.asignarTarjetas(division, tarjetasAsignadas)
        render([view: 'asignacionHorarios', model: [divisionInstance: division, tarjetas: tarjetasSinAsignar, tarjetasAsignadas: tarjetasAsignadas]])
    }

    def viewResultadosAsignacion(){
        Division division = divisionService.getDivisionById(params.id)
        render([view:'resultadoAsignacionDivision', model: [divisionInstance: division, finalizoPlazo: parametroSistemaService.finalizoPlazo, finalizoAsignacion: parametroSistemaService.finalizoAsignacion]])
    }

}