databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1504231528493-1") {
		addColumn(tableName: "curso") {
			column(name: "nombre", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}
}
