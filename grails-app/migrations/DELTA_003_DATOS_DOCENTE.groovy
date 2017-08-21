databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1503323683108-1") {
		addColumn(tableName: "docente") {
			column(name: "apellido", type: "varchar(30)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503323683108-2") {
		addColumn(tableName: "docente") {
			column(name: "direccion", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503323683108-3") {
		addColumn(tableName: "docente") {
			column(name: "edad", type: "integer") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503323683108-4") {
		addColumn(tableName: "docente") {
			column(name: "email", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503323683108-5") {
		addColumn(tableName: "docente") {
			column(name: "nombre", type: "varchar(30)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503323683108-6") {
		addColumn(tableName: "docente") {
			column(name: "telefono", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503323683108-7") {
		dropColumn(columnName: "date_created", tableName: "docente")
	}

	changeSet(author: "juan (generated)", id: "1503323683108-8") {
		dropColumn(columnName: "message", tableName: "docente")
	}
}
