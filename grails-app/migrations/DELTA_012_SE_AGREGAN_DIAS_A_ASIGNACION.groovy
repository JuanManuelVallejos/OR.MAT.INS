databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1507723964092-1") {
		addColumn(tableName: "asignacion") {
			column(name: "dia", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}
}
