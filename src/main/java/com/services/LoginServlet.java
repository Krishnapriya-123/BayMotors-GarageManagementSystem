package com.services;

import com.bean.Employee;
import com.dao.EmployeeDao;
import com.dao.DashboardDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve login parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Validate employee credentials
        int empId = EmployeeDao.validateEmployee(username, password, role);

        if (empId != -1) {
            // Valid credentials: fetch employee details
            Employee employee = EmployeeDao.getEmployee(empId, role);
            int totalTasks = DashboardDao.getTotalTasks();
            int activeMechanics = DashboardDao.getActiveMechanics();
            int activeVehicles = DashboardDao.getActiveVehicles();
            int pendingTasks = DashboardDao.getPendingTasks();


            // Set session attributes
            request.getSession().setAttribute("employee", employee);
            request.getSession().setAttribute("employeeRole", role);
            request.getSession().setAttribute("totalTasks", totalTasks);
            request.getSession().setAttribute("activeMechanics", activeMechanics);
            request.getSession().setAttribute("activeVehicles", activeVehicles);
            request.getSession().setAttribute("pendingTasks", pendingTasks);


            // Redirect to dashboard
            response.sendRedirect("dashboard.jsp");
        } else {
            // Invalid credentials: set error message and redirect to login
            String errorMessage = "Invalid " + (role != null ? role : "User") + " Credentials";
            request.getSession().setAttribute("invalidLogin", "<center><h5>" + errorMessage + "</h5></center>");
            response.sendRedirect("index.jsp");
        }
    }
}
