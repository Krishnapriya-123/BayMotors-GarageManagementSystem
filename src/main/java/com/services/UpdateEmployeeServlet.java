package com.services;

import com.dao.EmployeeDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            // Retrieve form data
            int id = Integer.parseInt(request.getParameter("id"));
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String email = request.getParameter("email");
            String mobileNumber = request.getParameter("mobile_number");
            String role = request.getParameter("role");

            boolean isUpdated = EmployeeDao.updateEmployee(id, firstName, lastName, email, mobileNumber, role);

            if (isUpdated) {
            	request.getSession().setAttribute("message", "Employee updated successfully");
            	response.sendRedirect(request.getContextPath() + "/GetAllEmployees");
            } else {
            	request.getSession().setAttribute("error", "Failed to update employee");
                response.sendRedirect("updateEmployee.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Invalid Input");
            response.sendRedirect("updateEmployee.jsp");
        }
    }
}
