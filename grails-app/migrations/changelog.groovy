databaseChangeLog = {
    include file: "DELTA_001_SE_INICIALIZA_APP.groovy"
    include file: "DELTA_002_SE_AGREGA_USER_ROLE.groovy"
    include file: "DELTA_003_DATOS_DOCENTE.groovy"
    include file: "DELTA_004_DATOS_CURSO.groovy"
    include file: "DELTA_005_NOMBRE_CURSO.groovy"
    include file: "DELTA_006_CONSTRAINTS_DOCENTE.groovy"
    include file: "DELTA_007_RELACION_CURSO_DIVISION.groovy"
    include file: "DELTA_008_CONSTRAINT_MATERIA_DOCENTE.groovy"
    include file: "DELTA_009_SE_AGREGA_USER_A_DOCENTE.groovy"
    include file: "DELTA_010_SE_AGREGAN_MATERIAS_A_DOCENTE.groovy"
    include file: "DELTA_011_SE_AGREGAN_TITULOS_A_DOCENTE.groovy"
    include file: "DELTA_012_SE_AGREGAN_DIAS_A_ASIGNACION.groovy"
}
