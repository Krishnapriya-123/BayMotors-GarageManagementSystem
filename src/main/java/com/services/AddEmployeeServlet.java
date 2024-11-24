package com.services;

import com.dao.EmployeeDao;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("mobile_number");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); 
        
        boolean isSuccess = EmployeeDao.addEmployee(firstName, lastName, email, mobileNumber, address, username, password, role);
        
        if (isSuccess) {
            String successMessage = role + " added successfully!";
            request.getSession().setAttribute("message", "<h5 class='text-success'>" + successMessage + "</h5>");
            response.sendRedirect(request.getContextPath() + "/GetAllEmployees");
        } else {
            String errorMessage = "Error adding " + role + ". Please try again.";
            request.getSession().setAttribute("error", "<h5 class='text-danger'>" + errorMessage + "</h5>");
            response.sendRedirect("addEmployee.jsp");
        }


	}

}
