databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1506443652646-1") {
		createTable(tableName: "docente_materia") {
			column(name: "docente_materias_que_dicto_id", type: "bigint")

			column(name: "materia_id", type: "bigint")
		}
	}

	changeSet(author: "juan (generated)", id: "1506443652646-4") {
		createIndex(indexName: "FK37DCCAB81F6EE551", tableName: "docente_materia") {
			column(name: "docente_materias_que_dicto_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1506443652646-5") {
		createIndex(indexName: "FK37DCCAB89400276", tableName: "docente_materia") {
			column(name: "materia_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1506443652646-2") {
		addForeignKeyConstraint(baseColumnNames: "docente_materias_que_dicto_id", baseTableName: "docente_materia", constraintName: "FK37DCCAB81F6EE551", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "docente", referencesUniqueColumn: "false")
	}

	changeSet(author: "juan (generated)", id: "1506443652646-3") {
		addForeignKeyConstraint(baseColumnNames: "materia_id", baseTableName: "docente_materia", constraintName: "FK37DCCAB89400276", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "materia", referencesUniqueColumn: "false")
	}
}
