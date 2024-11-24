package com.bean;

import java.util.List;

public abstract class Employee {
	private int id;
    private String username;
    private String firstName;
    private String lastName;
    private String email;
    private String mobileNumber;
    private String role;
    private String address;
    private boolean isActive; 
    
    public Employee() {
    	
    }
        
    public Employee(int id, String username, String firstName, String lastName, String email, String mobileNumber,
			String role, String address, boolean isActive) {
		super();
		this.id = id;
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.role = role;
		this.address = address;
		this.isActive = isActive;
	}
    
    // Abstract methods
    public abstract String performRoleSpecificTask(); // Returns a message about the task performed
    public abstract List<Task> viewTasks(); // Returns a list of tasks
    
    // Shared methods
    public void sendNotification(String message) {
        System.out.println("Notification to " + this.username + ": " + message);
    }


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMobileNumber() {
		return mobileNumber;
	}


	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public boolean getIsActive() {
		return isActive;
	}


	public void setIsActive(boolean isActive) {
		this.isActive = isActive;
	}

}
