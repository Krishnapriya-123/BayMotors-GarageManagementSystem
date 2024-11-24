package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Task;

public class TaskDao {
	public static List<Task> getAllTasks(){
		List<Task> tasks = new ArrayList<Task>();
		
		return tasks;
	}
	
	public static List<Task> getTasksAssignedToMechanic(int mechanicId) {
        List<Task> tasks = new ArrayList<Task>();
        
        return tasks;
    }
	
	public static boolean assignTaskToMechanic(int taskId, int mechanicId) {
		return true;
    }
	
	public static boolean markTaskAsCompleted(int taskId, int mechanicId) {
		return false;
    }

}
