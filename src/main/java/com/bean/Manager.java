package com.bean;

import java.util.List;

import com.dao.TaskDao;

public class Manager extends Employee{
	public Manager() {
		super();
	}
	public Manager(int id, String username, String firstName, String lastName, String email, String mobileNumber,
            String role, String address, boolean isActive) {
		super(id, username, firstName, lastName, email, mobileNumber, role, address, isActive);
	}
	
	@Override
    public String performRoleSpecificTask() {
        return "Manager task: Overseeing operations and assigning tasks.";
    }
	
	@Override
    public List<Task> viewTasks() {
        return TaskDao.getAllTasks(); // Retrieve all tasks from the DAO
    }
	
	// Manager-specific method
    public boolean assignTask(int taskId, int mechanicId) {
        return TaskDao.assignTaskToMechanic(taskId, mechanicId);
    }

}
