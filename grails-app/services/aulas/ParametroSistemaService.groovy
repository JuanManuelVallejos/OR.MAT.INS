package aulas

import grails.transaction.Transactional

@Transactional
class ParametroSistemaService {

    static CONSTANTE_FINALIZACION = "PLAZO_INICIALIZACION_FINALIZADO"
    static CONSTANTE_ASIGNACION_FINALIZADA = "ASIGNACION_FINALIZADA"
    ParametroSistema getParametro(clave){
        ParametroSistema.findByClave(clave)
    }

    def existeParametro(clave){
        return getParametro(clave) != null
    }

    def saveOrUpdate(clave, valor){
        ParametroSistema parametro = new ParametroSistema(clave: clave, valor: valor)
        if(existeParametro(clave)){
            parametro = getParametro(clave)
            parametro.valor = valor
        }
        parametro.save flush: true
    }

    def setPlazoFinalizado(){
        saveOrUpdate(CONSTANTE_FINALIZACION, true)
    }

    def setExtenderPlazo(){
        saveOrUpdate(CONSTANTE_FINALIZACION, false)
    }

    def getFinalizoPlazo(){
        getParametro(CONSTANTE_FINALIZACION).valor.toBoolean()
    }

    def setAsignacionesFinalizadas(){
        saveOrUpdate(CONSTANTE_ASIGNACION_FINALIZADA, true)
    }

    def getFinalizoAsignacion(){
        getParametro(CONSTANTE_ASIGNACION_FINALIZADA).valor.toBoolean()
    }

    def setExtenderAsignacion(){
        saveOrUpdate(CONSTANTE_ASIGNACION_FINALIZADA, false)
    }
}
