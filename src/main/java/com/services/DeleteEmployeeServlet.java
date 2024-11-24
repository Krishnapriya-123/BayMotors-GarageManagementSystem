package com.services;

import com.dao.EmployeeDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class DeleteEmployeeServlet
 */
@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String employeeIdStr = request.getParameter("employeeId");
        try {
            int employeeId = Integer.parseInt(employeeIdStr);

            // Call the DAO to delete the employee
            boolean isDeleted = EmployeeDao.deleteEmployeeById(employeeId);

            if (isDeleted) {
            	request.getSession().setAttribute("message", "Employee Deleted Successfully");                
            } else {
            	request.getSession().setAttribute("error", "Failed to Delete Employee");
            }
            response.sendRedirect(request.getContextPath() + "/GetAllEmployees");
            
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect with error message
            request.getSession().setAttribute("error", "Invalid Employee ID");
            response.sendRedirect(request.getContextPath() + "/GetAllEmployees");
//            request.getRequestDispatcher("/GetAllEmployees").forward(request, response);
        }

	}

}
