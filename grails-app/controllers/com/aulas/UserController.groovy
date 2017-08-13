package com.aulas

import grails.plugin.springsecurity.annotation.Secured

class UserController {

    @Secured('ROLE_USER')
    def index() { }
}
