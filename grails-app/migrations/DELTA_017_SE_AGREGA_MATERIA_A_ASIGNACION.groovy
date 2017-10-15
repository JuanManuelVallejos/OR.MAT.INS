databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1508105211509-1") {
		addColumn(tableName: "asignacion") {
			column(name: "materia_id", type: "bigint")
		}
	}

	changeSet(author: "juan (generated)", id: "1508105211509-3") {
		createIndex(indexName: "FKCFC98DC89400276", tableName: "asignacion") {
			column(name: "materia_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1508105211509-2") {
		addForeignKeyConstraint(baseColumnNames: "materia_id", baseTableName: "asignacion", constraintName: "FKCFC98DC89400276", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "materia", referencesUniqueColumn: "false")
	}
}
