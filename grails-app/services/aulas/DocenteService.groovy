package aulas
import seguridad.Role
import seguridad.User
import seguridad.UserRole

class DocenteService {

    def disponibilidadService

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

    def getDisponibilidadASolapar(Docente docente, Disponibilidad disp){
        List<Disponibilidad> disponibilidades = new ArrayList<Disponibilidad>()
        for (Disponibilidad dispDoc in docente.disponibilidades) {
            if(dispDoc.dia == disp.dia){
                if( disp.horaInicial >= dispDoc.horaInicial && disp.horaInicial <= dispDoc.horaFinal ||
                    disp.horaInicial <= dispDoc.horaInicial && disp.horaFinal >= dispDoc.horaInicial ||
                    disp.horaInicial <= dispDoc.horaInicial && disp.horaFinal >= dispDoc.horaFinal ||
                    disp.horaFinal == dispDoc.horaInicial || disp.horaInicial == dispDoc.horaFinal){
                    disponibilidades.add(dispDoc)
                }
            }
        }
        return disponibilidades
    }

    def agregarDisponibilidad(Docente docente, dia, horaInicio, horaFinal){
        Disponibilidad disponibilidad = new Disponibilidad(dia: dia, horaInicial: horaInicio, horaFinal: horaFinal)
        List<Disponibilidad> disponibilidadesExistentes = getDisponibilidadASolapar(docente,disponibilidad)
        if(disponibilidadesExistentes.size() != 0){
            def primerDisponibilidadExistente = disponibilidadesExistentes.first()
            def horaInicialExistente = disponibilidadesExistentes.min { it.horaInicial }.horaInicial
            def horaFinalExistente = disponibilidadesExistentes.max { it.horaFinal }.horaFinal
            primerDisponibilidadExistente.horaInicial = Math.min(disponibilidad.horaInicial, horaInicialExistente)
            primerDisponibilidadExistente.horaFinal = Math.max(disponibilidad.horaFinal, horaFinalExistente)
            primerDisponibilidadExistente.save flush: true
            disponibilidadesExistentes.remove(primerDisponibilidadExistente)
            disponibilidadService.eliminarDisponibilidadesDeDocente(docente, disponibilidadesExistentes)
        }
        else{
            disponibilidad.save flush: true
            docente.addToDisponibilidades(disponibilidad)
            docente.save flush: true
        }
    }

    def eliminarDisponibilidad(Docente docente, Disponibilidad disponibilidad){
        disponibilidadService.eliminarDisponibilidad(disponibilidad)
        docente.save flush: true
    }

}
