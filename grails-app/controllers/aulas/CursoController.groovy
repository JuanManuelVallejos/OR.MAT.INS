package aulas



import static org.springframework.http.HttpStatus.*

class CursoController {

    static scaffold = true

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        [cursos: Curso.all]
    }

    def show(Curso cursoInstance) {
        respond cursoInstance
    }

    def create(Curso cursoCreado) {
        respond new Curso(nombre: cursoCreado.nombre)
    }

    def save(Curso cursoInstance) {
        if (cursoInstance.hasErrors()) {
            respond cursoInstance.errors, view:'index'
            return
        }
        cursoInstance.save flush:true
        //redirect docenteInstance: cursoInstance
        render ([view: 'index', model:[cursos: Curso.all]])
    }

    def edit(Curso cursoInstance) {
        respond cursoInstance
    }

    def update(Curso cursoInstance) {
        if (cursoInstance == null) {
            notFound()
            return
        }

        if (cursoInstance.hasErrors()) {
            respond cursoInstance.errors, view:'edit'
            return
        }

        cursoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Curso.label', default: 'Curso'), cursoInstance.id])
                redirect cursoInstance
            }
            '*'{ respond cursoInstance, [status: OK] }
        }
    }

    def delete(Curso cursoInstance) {

        if (cursoInstance == null) {
            notFound()
            return
        }

        cursoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Curso.label', default: 'Curso'), cursoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
