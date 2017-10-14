package aulas

class AdministracionController {

    static allowedMethods = [finalizarPlazo: "POST"]
    def divisionService
    def parametroSistemaService

    def index() {
        render(view: 'index')
    }

    def finalizarPlazo(){
        if(!divisionService.estanCubiertasTodasLasDivisiones){
            render(view: 'index', model: [divisionesSinCubrir: divisionService.divisionesSinCubrir])
        }else{
            parametroSistemaService.setPlazoFinalizado()
            render(view: 'index')
        }
    }
}
