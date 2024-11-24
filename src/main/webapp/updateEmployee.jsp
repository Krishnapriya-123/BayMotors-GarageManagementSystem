<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bean.Employee, java.util.List" %>
<%
    // Get the current userRole from the session
    String employeeRole = (String) session.getAttribute("employeeRole");
    String employeeIdParam = request.getParameter("employeeId");
    Employee employeeToUpdate = null;

    if (employeeIdParam != null) {
        int employeeId = Integer.parseInt(employeeIdParam);

        // Retrieve the employee details from the session or database
        List<Employee> employees = (List<Employee>) session.getAttribute("employeeList");
        if (employees != null) {
            for (Employee emp : employees) {
                if (emp.getId() == employeeId) {
                    employeeToUpdate = emp;
                    break;
                }
            }
        }
    }

    if (employeeToUpdate == null) {
    	request.getSession().setAttribute("error", "Employee not found");
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Bay Motors</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                	<li class="nav-item">
                        <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <% 
    	String message = (String) session.getAttribute("message");
    	if (message != null) { 
	%>
	    <div class="alert alert-success" role="alert">
	        <%= message %>
	    </div>
	    <%
	        session.removeAttribute("message"); // Clear the message after displaying
	    }
	%>
	
	<% 
	    String error = (String) session.getAttribute("error");
	    if (error != null) { 
	%>
	    <div class="alert alert-danger" role="alert">
	        <%= error %>
	    </div>
	    <%
	        session.removeAttribute("error"); // Clear the error after displaying
	    }
	%>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Update Employee</h1>

        <form action="UpdateEmployeeServlet" method="POST">
            <input type="hidden" name="id" value="<%= employeeToUpdate.getId() %>">

            <div class="mb-3">
                <label for="first_name" class="form-label">First Name</label>
                <input type="text" class="form-control" id="first_name" name="first_name" value="<%= employeeToUpdate.getFirstName() %>" required>
            </div>

            <div class="mb-3">
                <label for="last_name" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="last_name" name="last_name" value="<%= employeeToUpdate.getLastName() %>" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= employeeToUpdate.getEmail() %>" required>
            </div>

            <div class="mb-3">
                <label for="mobile_number" class="form-label">Mobile Number</label>
                <input type="tel" class="form-control" id="mobile_number" name="mobile_number" value="<%= employeeToUpdate.getMobileNumber() %>" required>
            </div>
    
            <input type="hidden" name="role" value="MECHANIC">

            <div class="row">
                <div class="col">
                    <button type="submit" class="btn btn-primary btn-block">Update Employee</button>
                </div>
                <div class="col">
                    <a href="javascript:history.back()" class="btn btn-secondary btn-block">Back</a>
                </div>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
