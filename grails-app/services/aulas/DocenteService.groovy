package aulas
import seguridad.Role
import seguridad.User
import seguridad.UserRole

class DocenteService {


    def getDocenteById(id){
        return Docente.get(id)
    }

    def buscar(inputBusqueda) {
        def likeBusqueda = "%" + inputBusqueda + "%"
        return Docente.findAllByNombreLike(likeBusqueda,likeBusqueda)
    }

    def getAllDocentes(){
        Docente.getAll()
    }

    def saveDocente(Docente docente){
        docente.save flush:true
    }

    def saveDocente(Docente docente, User user){
        Role role = Role.findByAuthority('ROLE_DOCENTE')
        user.save flush: true
        UserRole.create user, role, true
        docente.user = user
        docente.save flush:true
    }

    def getDocenteConUser(User user){
        Docente.findByUser(user)
    }
}
