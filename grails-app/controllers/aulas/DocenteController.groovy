package aulas

import grails.plugin.springsecurity.annotation.Secured

class DocenteController {

    @Secured('ROLE_USER')
    def index() {

        def announcements = Docente.createCriteria().list {
            order("dateCreated", "desc")
            maxResults(1)
        }
        render announcements.first()?.message
    }
}
