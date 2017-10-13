package aulas

import grails.transaction.Transactional

@Transactional
class ParametroSistemaService {

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

}
