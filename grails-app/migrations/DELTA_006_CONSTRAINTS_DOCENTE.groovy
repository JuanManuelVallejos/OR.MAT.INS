databaseChangeLog = {

	changeSet(author: "juan (generated)", id: "1504316944531-1") {
		modifyDataType(columnName: "titular", newDataType: "bit", tableName: "docente")
	}

	changeSet(author: "juan (generated)", id: "1504316944531-2") {
		dropNotNullConstraint(columnDataType: "bit", columnName: "titular", tableName: "docente")
	}
}
