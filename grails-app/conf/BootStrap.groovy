import aulas.*
import com.aulas.*
class BootStrap {

    def init = { servletContext ->
        new Docente(message: 'Launch day').save()

        def userRole = new Role('ROLE_USER').save()

        def me = new User('jumava', 'macrigato').save()

        UserRole.create me, userRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }

    }

    def destroy = {
    }

}
