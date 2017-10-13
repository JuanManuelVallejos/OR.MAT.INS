package aulas

class AdministracionController {

    def index() {
        render(view: 'index', model: [titulo:"Congratulations"])
    }
}
