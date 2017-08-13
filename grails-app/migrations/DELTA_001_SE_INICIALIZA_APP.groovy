databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1502064852691-1") {
		createTable(tableName: "docente") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "docentePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "message", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}
}
