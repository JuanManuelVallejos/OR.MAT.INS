databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1507927393910-1") {
		addForeignKeyConstraint(baseColumnNames: "docente_id", baseTableName: "asignacion", constraintName: "FKCFC98DC8DD1AB756", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "docente", referencesUniqueColumn: "false")
	}
}
