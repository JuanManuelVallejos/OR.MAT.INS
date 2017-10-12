databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1507842175929-1") {
		addColumn(tableName: "disponibilidad") {
			column(name: "docente_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1507842175929-2") {
		dropForeignKeyConstraint(baseTableName: "docente_disponibilidad", baseTableSchemaName: "aulas", constraintName: "FKF2484C48E71E157E")
	}

	changeSet(author: "juan (generated)", id: "1507842175929-3") {
		dropForeignKeyConstraint(baseTableName: "docente_disponibilidad", baseTableSchemaName: "aulas", constraintName: "FKF2484C48C536B3F2")
	}

	changeSet(author: "juan (generated)", id: "1507842175929-5") {
		createIndex(indexName: "FKDD49C27BDD1AB756", tableName: "disponibilidad") {
			column(name: "docente_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1507842175929-6") {
		dropTable(tableName: "docente_disponibilidad")
	}

	changeSet(author: "juan (generated)", id: "1507842175929-4") {
		addForeignKeyConstraint(baseColumnNames: "docente_id", baseTableName: "disponibilidad", constraintName: "FKDD49C27BDD1AB756", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "docente", referencesUniqueColumn: "false")
	}
}
