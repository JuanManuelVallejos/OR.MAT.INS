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

    def agregarMateria(Docente docente, materia){
        docente.materiasQueDicto.add(materia)
        docente.save()
    }

    def eliminarMateria(Docente docente, materia){
        docente.materiasQueDicto.remove(materia)
        docente.save()
    }

    def addTituloToDocente(docente, fileName, filePath){
        DocumentoRespaldatorio docRes = new DocumentoRespaldatorio()
        docRes.fileName = fileName
        docRes.fullPath = filePath
        docente.addToTitulos(docRes)
        docente.save flush: true
    }

    def removeTituloToDocente(docente, titulo){
        docente.titulos.remove(titulo)
        docente.save flush: true
    }

    def getDocentesQueDictenMateria(Materia materia){
        return allDocentes.findAll{ it.materiasQueDicto.contains(materia) }
    }

}
