<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bean.Employee, java.util.List" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<%
    String employeeRole = (String) session.getAttribute("employeeRole");
	Employee employee = (Employee) session.getAttribute("employee");
	List<Employee> employees = (List<Employee>) session.getAttribute("employeeList");
    if (employeeRole == null || employee == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mechanics</title>
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
    
    <div class="container mt-5">
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
		
		<div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Mechanics List</h2>
            <a href="addEmployee.jsp" class="btn btn-success btn-lg">Add Mechanic</a>
	    </div>
	    
	    <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Role</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        if (employees != null && !employees.isEmpty()) {
                            int index = 1;
                            for (Employee emp : employees) {
                    %>
                        <tr>
                            <td><%= index++ %></td>
                            <td><%= emp.getFirstName() %> <%= emp.getLastName() %></td>
                            <td><%= emp.getRole() %></td>
                            <td><%= emp.getEmail() %></td>
                            <td><%= emp.getMobileNumber() %></td>
                            <td>
                                <a href="updateEmployee.jsp?employeeId=<%= emp.getId() %>" class="btn btn-secondary btn-sm">Update</a>
                                <a href="DeleteEmployeeServlet?employeeId=<%= emp.getId() %>" class="btn btn-danger btn-sm">Delete</a>	                                
                            </td>
                        </tr>
                    <% 
                            } 
                        } else { 
                    %>
                        <tr>
                            <td colspan="6" class="text-center">No Mechanics found.</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>