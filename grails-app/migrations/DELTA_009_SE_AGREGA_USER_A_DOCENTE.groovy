databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1505495908528-1") {
		addColumn(tableName: "docente") {
			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1505495908528-3") {
		createIndex(indexName: "FK6CFBBE1291DA65F8", tableName: "docente") {
			column(name: "user_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1505495908528-4") {
		createIndex(indexName: "dni_uniq_1505495907219", tableName: "docente", unique: "true") {
			column(name: "dni")
		}
	}

	changeSet(author: "juan (generated)", id: "1505495908528-2") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "docente", constraintName: "FK6CFBBE1291DA65F8", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}
}
