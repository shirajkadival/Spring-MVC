package com.crud;

import java.util.List;

public interface empDao {
	void saveData(empEntity emp);

	void updateData(empEntity emp);

	empEntity getEmpById(int id);

	List<empEntity> getEmpAll();

	void deleteEmp(int id);
}
