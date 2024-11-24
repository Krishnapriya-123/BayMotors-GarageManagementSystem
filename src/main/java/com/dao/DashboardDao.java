package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnection;

public class DashboardDao {
	public static int getTotalTasks() {
        String query = "SELECT COUNT(*) FROM task WHERE is_active = true;";
        try {
        	Connection con = DBConnection.getCon();
    		PreparedStatement ps = con.prepareStatement(query);
    		ResultSet rs = ps.executeQuery();
    		if(rs.next()) {
    			System.out.println(rs.getInt(1));
    			return rs.getInt(1);
    		}
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return 0;
    }
	
	public static int getActiveMechanics() {
		String query = "SELECT COUNT(*) FROM employee WHERE role = 'MECHANIC' AND is_active = true;";
		try {
        	Connection con = DBConnection.getCon();
    		PreparedStatement ps = con.prepareStatement(query);
    		ResultSet rs = ps.executeQuery();
    		if(rs.next()) {
    			System.out.println(rs.getInt(1));
    			return rs.getInt(1);
    		}
        }
        catch(Exception e){
            e.printStackTrace();
        }
				
		return 0;
	}
	
	public static int getActiveVehicles() {
		String query = "SELECT COUNT(DISTINCT vehicle_id) FROM task WHERE status IN ('PENDING', 'IN PROGRESS') AND is_active = true;";
		try {
        	Connection con = DBConnection.getCon();
    		PreparedStatement ps = con.prepareStatement(query);
    		ResultSet rs = ps.executeQuery();
    		if(rs.next()) {
    			System.out.println(rs.getInt(1));
    			return rs.getInt(1);
    		}
        }
        catch(Exception e){
            e.printStackTrace();
        }

		return 0;
	}
	
	public static int getPendingTasks() {
		String query = "SELECT COUNT(*) FROM task WHERE status IN ('PENDING', 'IN PROGRESS') AND is_active = true;";
		try {
        	Connection con = DBConnection.getCon();
    		PreparedStatement ps = con.prepareStatement(query);
    		ResultSet rs = ps.executeQuery();
    		if(rs.next()) {
    			System.out.println(rs.getInt(1));
    			return rs.getInt(1);
    		}
        }
        catch(Exception e){
            e.printStackTrace();
        }

		return 0;

	}
}
