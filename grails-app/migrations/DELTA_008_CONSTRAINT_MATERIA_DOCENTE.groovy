databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1504572340316-1") {
		addColumn(tableName: "asignacion") {
			column(name: "division_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1504572340316-2") {
		addColumn(tableName: "materia_por_docente") {
			column(name: "division_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1504572340316-5") {
		createIndex(indexName: "FKCFC98DC886AB1B3E", tableName: "asignacion") {
			column(name: "division_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1504572340316-6") {
		createIndex(indexName: "FK8A815ACC86AB1B3E", tableName: "materia_por_docente") {
			column(name: "division_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1504572340316-3") {
		addForeignKeyConstraint(baseColumnNames: "division_id", baseTableName: "asignacion", constraintName: "FKCFC98DC886AB1B3E", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "division", referencesUniqueColumn: "false")
	}

	changeSet(author: "juan (generated)", id: "1504572340316-4") {
		addForeignKeyConstraint(baseColumnNames: "division_id", baseTableName: "materia_por_docente", constraintName: "FK8A815ACC86AB1B3E", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "division", referencesUniqueColumn: "false")
	}
}
