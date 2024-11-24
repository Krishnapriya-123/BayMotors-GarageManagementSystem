package com.dao;

import java.util.List;
import java.util.ArrayList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.Employee;
import com.bean.Manager;
import com.bean.Mechanic;
import com.db.DBConnection;


public class EmployeeDao {
	public static int validateEmployee(String username, String password, String role) {
		int empId = -1;

		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM EMPLOYEE WHERE username=? AND password = ? AND role = ? AND is_active = true");
            ps.setString(1,username);
            ps.setString(2,password);
            ps.setString(3, role);

            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
            	empId = rs.getInt("ID");
            }
		}
		catch(Exception e){
            e.printStackTrace();
        }

        return empId;
	}

	public static Employee getEmployee(int userId, String role) {
		Employee employee = null;
		if ("MANAGER".equals(role)) {
			employee = new Manager();
		} else if ("MECHANIC".equals(role)) {
            employee = new Mechanic();
        }
		
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM EMPLOYEE WHERE ID = ? AND is_active = true");
	        ps.setInt(1, userId);
	        
	        ResultSet rs = ps.executeQuery();
	        if(rs.next()) {
	        	employee.setId(rs.getInt("ID"));
	        	employee.setFirstName(rs.getString("first_name"));
	        	employee.setLastName(rs.getString("last_name"));
	        	employee.setEmail(rs.getString("email"));
	        	employee.setMobileNumber(rs.getString("mobile_number"));
	        	employee.setRole(rs.getString("role"));
	        	employee.setAddress(rs.getString("address"));
	        	employee.setIsActive(rs.getBoolean("is_active"));
	        }
		}
		catch(Exception e){
	        e.printStackTrace();
	    }
		
		return employee;
	}
	
	public static boolean addEmployee(String firstName, String lastName, String email, String mobileNumber, String address, String username, String password, String role) {
        boolean isAdded = false;

        try {
            Connection con = DBConnection.getCon();
            String query = "INSERT INTO EMPLOYEE (first_name, last_name, email, mobile_number, address, username, password, role) " +
                           "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, mobileNumber);
            ps.setString(5, address);
            ps.setString(6, username);
            ps.setString(7, password);
            ps.setString(8, role);

            int rowsAffected = ps.executeUpdate();
            isAdded = rowsAffected > 0;

            con.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                DBConnection.getCon().rollback();
            } catch (Exception rollbackException) {
                rollbackException.printStackTrace();
            }
        }

        return isAdded;
    }
	
	public static List<Employee> getAllEmployees(){
		List<Employee> employeeList = new ArrayList<>();
		
		try {
            Connection con = DBConnection.getCon();
            String query = "SELECT * FROM EMPLOYEE WHERE role = 'MECHANIC' AND is_active = true";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Employee employee = new Mechanic();

                employee.setId(rs.getInt("id"));
                employee.setFirstName(rs.getString("first_name"));
                employee.setLastName(rs.getString("last_name"));
                employee.setEmail(rs.getString("email"));
                employee.setMobileNumber(rs.getString("mobile_number"));
                employee.setRole(rs.getString("role"));
                employee.setAddress(rs.getString("address"));

                employeeList.add(employee);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return employeeList;
	}
	
	public static boolean updateEmployee(int id, String firstName, String lastName, String email, String mobileNumber, String role) {
        boolean isUpdated = false;

        try {
            Connection con = DBConnection.getCon();
            String query = "UPDATE EMPLOYEE SET first_name = ?, last_name = ?, email = ?, mobile_number = ?, role = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, mobileNumber);
            ps.setString(5, role);
            ps.setInt(6, id);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
            
            con.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
            try {
                DBConnection.getCon().rollback();
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }

        }

        return isUpdated;
    }

	
	public static boolean deleteEmployeeById(int employeeId) {
        boolean isDeleted = false;

        try {
            Connection con = DBConnection.getCon();
            String query = "UPDATE EMPLOYEE SET is_active = false WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, employeeId);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
            con.commit();

        } catch (Exception e) {
            e.printStackTrace();
            try {
                DBConnection.getCon().rollback();
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }

        }

        return isDeleted;
    }

	
	
}
