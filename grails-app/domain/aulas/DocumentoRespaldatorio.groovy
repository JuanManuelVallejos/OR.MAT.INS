package aulas

class DocumentoRespaldatorio {
    String fileName

    String fullPath

    Date dateCreated

    static constraints = {

        fileName(blank: false, nullable: false)
        fullPath(blank: false, nullable: false)
        dateCreated()
    }
}
