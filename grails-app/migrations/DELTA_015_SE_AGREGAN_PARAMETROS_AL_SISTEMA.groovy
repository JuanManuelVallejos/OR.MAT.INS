databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1507921302441-1") {
		createTable(tableName: "parametro_sistema") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "parametro_sisPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "clave", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "valor", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1507921302441-2") {
		createIndex(indexName: "clave_uniq_1507921301184", tableName: "parametro_sistema", unique: "true") {
			column(name: "clave")
		}
	}
}
