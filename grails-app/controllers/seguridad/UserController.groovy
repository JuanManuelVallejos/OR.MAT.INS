package seguridad

import aulas.*
import grails.plugin.springsecurity.annotation.Secured

class UserController {

    @Secured('ROLE_USER')
    def index() {


    }

    @Secured('ROLE_USER')
    def show(){
        Docente docente = new Docente()
        render docente: docente
    }
}
