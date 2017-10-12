databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1507815124238-1") {
		createTable(tableName: "disponibilidad") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "disponibilidaPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "dia", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "hora_final", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "hora_inicial", type: "integer") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1507815124238-2") {
		createTable(tableName: "docente_disponibilidad") {
			column(name: "docente_disponibilidades_id", type: "bigint")

			column(name: "disponibilidad_id", type: "bigint")
		}
	}

	changeSet(author: "juan (generated)", id: "1507815124238-5") {
		createIndex(indexName: "FKF2484C48C536B3F2", tableName: "docente_disponibilidad") {
			column(name: "docente_disponibilidades_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1507815124238-6") {
		createIndex(indexName: "FKF2484C48E71E157E", tableName: "docente_disponibilidad") {
			column(name: "disponibilidad_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1507815124238-3") {
		addForeignKeyConstraint(baseColumnNames: "disponibilidad_id", baseTableName: "docente_disponibilidad", constraintName: "FKF2484C48E71E157E", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "disponibilidad", referencesUniqueColumn: "false")
	}

	changeSet(author: "juan (generated)", id: "1507815124238-4") {
		addForeignKeyConstraint(baseColumnNames: "docente_disponibilidades_id", baseTableName: "docente_disponibilidad", constraintName: "FKF2484C48C536B3F2", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "docente", referencesUniqueColumn: "false")
	}
}
