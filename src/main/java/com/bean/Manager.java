package com.bean;

public class Manager extends Employee{
	public Manager() {
		super();
	}
	public Manager(int id, String username, String firstName, String lastName, String email, String mobileNumber,
            String role, String address, boolean isActive) {
		super(id, username, firstName, lastName, email, mobileNumber, role, address, isActive);
	}
	
	@Override
    public void performRoleSpecificTask() {
        System.out.println("Manager task: Overseeing operations and assigning tasks.");
    }

}
