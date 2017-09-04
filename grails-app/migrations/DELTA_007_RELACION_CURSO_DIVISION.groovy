databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1504453801214-1") {
		addColumn(tableName: "division") {
			column(name: "curso_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1504453801214-3") {
		createIndex(indexName: "FK15BD30AD319A3A16", tableName: "division") {
			column(name: "curso_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1504453801214-2") {
		addForeignKeyConstraint(baseColumnNames: "curso_id", baseTableName: "division", constraintName: "FK15BD30AD319A3A16", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "curso", referencesUniqueColumn: "false")
	}
}
