databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1506617234788-1") {
		createTable(tableName: "docente_documento_respaldatorio") {
			column(name: "docente_titulos_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "documento_respaldatorio_id", type: "bigint")
		}
	}

	changeSet(author: "juan (generated)", id: "1506617234788-2") {
		createTable(tableName: "documento_respaldatorio") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "documento_resPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "file_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "full_path", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1506617234788-3") {
		addNotNullConstraint(columnDataType: "bigint", columnName: "docente_materias_que_dicto_id", tableName: "docente_materia")
	}

	changeSet(author: "juan (generated)", id: "1506617234788-6") {
		createIndex(indexName: "FKBF7B808D9E21BD15", tableName: "docente_documento_respaldatorio") {
			column(name: "documento_respaldatorio_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1506617234788-7") {
		createIndex(indexName: "FKBF7B808DB5028CDB", tableName: "docente_documento_respaldatorio") {
			column(name: "docente_titulos_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1506617234788-4") {
		addForeignKeyConstraint(baseColumnNames: "docente_titulos_id", baseTableName: "docente_documento_respaldatorio", constraintName: "FKBF7B808DB5028CDB", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "docente", referencesUniqueColumn: "false")
	}

	changeSet(author: "juan (generated)", id: "1506617234788-5") {
		addForeignKeyConstraint(baseColumnNames: "documento_respaldatorio_id", baseTableName: "docente_documento_respaldatorio", constraintName: "FKBF7B808D9E21BD15", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "documento_respaldatorio", referencesUniqueColumn: "false")
	}
}
