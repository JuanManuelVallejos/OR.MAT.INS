package aulas

import grails.transaction.Transactional

@Transactional
class ParametroSistemaService {

    static CONSTANTE_FINALIZACION = "PLAZO_INICIALIZACION_FINALIZADO"

    def getParametro(clave){
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

    def getFinalizoPlazo(){
        getParametro(CONSTANTE_FINALIZACION)
    }

}
