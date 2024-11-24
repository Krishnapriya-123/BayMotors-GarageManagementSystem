package com.bean;

public class Mechanic extends Employee {
	public Mechanic() {
		super();
	}
	public Mechanic(int id, String username, String firstName, String lastName, String email, String mobileNumber,
            String role, String address, boolean isActive) {
		super(id, username, firstName, lastName, email, mobileNumber, role, address, isActive);
	}

    @Override
    public void performRoleSpecificTask() {
        System.out.println("Mechanic task: Working on assigned vehicle repairs.");
    }
}

