databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1503661577500-1") {
		createTable(tableName: "asignacion") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "asignacionPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "hora", type: "integer") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503661577500-2") {
		createTable(tableName: "curso") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "cursoPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503661577500-3") {
		createTable(tableName: "division") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "divisionPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "division", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503661577500-4") {
		createTable(tableName: "materia") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "materiaPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "nombre", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503661577500-5") {
		createTable(tableName: "materia_por_docente") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "materia_por_dPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "docente_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "horasacubrir", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "materia_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503661577500-6") {
		addColumn(tableName: "docente") {
			column(name: "dni", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503661577500-7") {
		addColumn(tableName: "docente") {
			column(name: "titular", type: "bit") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "juan (generated)", id: "1503661577500-10") {
		createIndex(indexName: "FK8A815ACC9400276", tableName: "materia_por_docente") {
			column(name: "materia_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1503661577500-11") {
		createIndex(indexName: "FK8A815ACCDD1AB756", tableName: "materia_por_docente") {
			column(name: "docente_id")
		}
	}

	changeSet(author: "juan (generated)", id: "1503661577500-8") {
		addForeignKeyConstraint(baseColumnNames: "docente_id", baseTableName: "materia_por_docente", constraintName: "FK8A815ACCDD1AB756", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "docente", referencesUniqueColumn: "false")
	}

	changeSet(author: "juan (generated)", id: "1503661577500-9") {
		addForeignKeyConstraint(baseColumnNames: "materia_id", baseTableName: "materia_por_docente", constraintName: "FK8A815ACC9400276", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "materia", referencesUniqueColumn: "false")
	}
}
