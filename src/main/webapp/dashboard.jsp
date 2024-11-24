<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    int totalTasks = (int) session.getAttribute("totalTasks");
    int activeMechanics = (int) session.getAttribute("activeMechanics");
    int activeVehicles = (int) session.getAttribute("activeVehicles");
    int pendingTasks = (int) session.getAttribute("pendingTasks");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
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
        <h1 class="text-center mb-4">Welcome, <%= employee.getFirstName() %>!</h1>
        <!-- Dynamic Content for Manager -->
		<% if ("MANAGER".equals(employeeRole)) { %>
		    <!-- Quick Stats Row -->
		    <div class="row mb-4">
		        <div class="col-md-3">
		            <div class="card bg-primary text-white">
		                <div class="card-body">
		                    <h5 class="card-title">Total Tasks</h5>
		                    <h2 class="mb-0"><%= totalTasks %></h2>
		                </div>
		            </div>
		        </div>
		        <div class="col-md-3">
		            <div class="card bg-success text-white">
		                <div class="card-body">
		                    <h5 class="card-title">Active Mechanics</h5>
		                    <h2 class="mb-0"><%= activeMechanics %></h2>
		                </div>
		            </div>
		        </div>
		        <div class="col-md-3">
		            <div class="card bg-info text-white">
		                <div class="card-body">
		                    <h5 class="card-title">Vehicles In Service</h5>
		                    <h2 class="mb-0"><%= activeVehicles %></h2>
		                </div>
		            </div>
		        </div>
		        <div class="col-md-3">
		            <div class="card bg-warning text-white">
		                <div class="card-body">
		                    <h5 class="card-title">Pending Tasks</h5>
		                    <h2 class="mb-0"><%= pendingTasks %></h2>
		                </div>
		            </div>
		        </div>
		    </div>
		
		    <!-- Main Management Sections -->
		    <div class="row g-4">
		        <!-- People Management Section -->
		        <div class="col-md-6">
		            <div class="card">
		                <div class="card-header bg-primary text-white">
		                    <h5 class="card-title mb-0">People Management</h5>
		                </div>
		                <div class="card-body">
		                    <div class="d-grid gap-2">
		                        <a href="<%= request.getContextPath() %>/GetAllEmployees" class="btn btn-outline-primary">
		                            <i class="bi bi-people"></i> List Mechanics
		                        </a>
		                        <a href="" class="btn btn-outline-primary">
		                            <i class="bi bi-person"></i> List Customers
		                        </a>
		                        <a href="" class="btn btn-outline-primary">
		                            <i class="bi bi-building"></i> List Suppliers
		                        </a>
		                    </div>
		                </div>
		            </div>
		        </div>
		
		        <!-- Vehicle & Task Management -->
		        <div class="col-md-6">
		            <div class="card">
		                <div class="card-header bg-success text-white">
		                    <h5 class="card-title mb-0">Operations Management</h5>
		                </div>
		                <div class="card-body">
		                    <div class="d-grid gap-2">
		                        <a href="" class="btn btn-outline-success">
		                            <i class="bi bi-list-task"></i> List Tasks
		                        </a>
		                        <a href="" class="btn btn-outline-success">
		                            <i class="bi bi-car-front"></i> List Vehicles
		                        </a>
		                        <a href="" class="btn btn-outline-success">
		                            <i class="bi bi-factory"></i> List Manufacturers
		                        </a>
		                    </div>
		                </div>
		            </div>
		        </div>
		
		        <!-- Action Center -->
		        <div class="col-md-12">
		            <div class="card">
		                <div class="card-header bg-info text-white">
		                    <h5 class="card-title mb-0">Action Center</h5>
		                </div>
		                <div class="card-body">
		                    <div class="row">
		                        <div class="col-md-4">
		                            <div class="d-grid">
		                                <a href="" class="btn btn-outline-info mb-3">
		                                    <i class="bi bi-plus-circle"></i> Add New Task
		                                </a>
		                            </div>
		                        </div>
		                        <div class="col-md-4">
		                            <div class="d-grid">
		                                <a href="" class="btn btn-outline-info mb-3">
		                                    <i class="bi bi-truck"></i> Log New Vehicle
		                                </a>
		                            </div>
		                        </div>
		                        <div class="col-md-4">
		                            <div class="d-grid">
		                                <a href="" class="btn btn-outline-info mb-3">
		                                    <i class="bi bi-bell"></i> Post Notification
		                                </a>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		
		    <!-- Recent Activities Table -->
		    <div class="card mt-4">
		        <div class="card-header bg-dark text-white">
		            <h5 class="card-title mb-0">Recent Activities</h5>
		        </div>
		        <div class="card-body">
		            <div class="table-responsive">
		                <table class="table table-striped table-hover">
		                    <thead>
		                        <tr>
		                            <th>Date</th>
		                            <th>Activity</th>
		                            <th>Mechanic</th>
		                            <th>Status</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <tr>
		                            <td>${activity.date}</td>
		                            <td>${activity.description}</td>
		                            <td>${activity.mechanic}</td>
		                            <td><span class="badge bg-success">Completed</span></td>
		                        </tr>
		                        <!-- Add more rows as needed -->
		                    </tbody>
		                </table>
		            </div>
		        </div>
		    </div>
		<% } %>

        <!-- Mechanic Dashboard -->
        <% if ("MECHANIC".equals(employeeRole)) { %>
            <!-- Quick Stats Row -->
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="card bg-primary text-white">
                        <div class="card-body">
                            <h5 class="card-title">Total Tasks</h5>
                            <h2 class="mb-0">15</h2> <!-- Replace with dynamic count -->
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-success text-white">
                        <div class="card-body">
                            <h5 class="card-title">Suppliers</h5>
                            <h2 class="mb-0">8</h2> <!-- Replace with dynamic count -->
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-warning text-white">
                        <div class="card-body">
                            <h5 class="card-title">Manufacturers</h5>
                            <h2 class="mb-0">5</h2> <!-- Replace with dynamic count -->
                        </div>
                    </div>
                </div>
            </div>

			<!-- Action Center -->
	        <div class="col-md-12">
	            <div class="card">
	                <div class="card-header bg-info text-white">
	                    <h5 class="card-title mb-0">Suppliers & Manufacturers</h5>
	                </div>
	                <div class="card-body">
	                    <div class="row">
	                        <div class="col-md-6">
	                            <div class="d-grid">
	                                <a href="<%= request.getContextPath() %>/ListSuppliersServlet" class="btn btn-outline-info mb-3">
	                                    <i class="bi bi-plus-circle"></i> List Manufacturers
	                                </a>
	                            </div>
	                        </div>
	                        <div class="col-md-6">
	                            <div class="d-grid">
	                                <a href="<%= request.getContextPath() %>/ListManufacturersServlet" class="btn btn-outline-info mb-3">
	                                    <i class="bi bi-truck"></i> List Suppliers
	                                </a>
	                            </div>
	                        </div>
	                        
	                    </div>
	                </div>
	            </div>
	        </div>

            <!-- Recent Tasks -->
            <div class="card mt-4">
                <div class="card-header bg-dark text-white">
                    <h5 class="card-title mb-0">Recent Tasks</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2024-11-23</td>
                                    <td>Replaced engine part</td>
                                    <td><span class="badge bg-success">Completed</span></td>
                                </tr>
                                <tr>
                                    <td>2024-11-22</td>
                                    <td>Serviced brakes</td>
                                    <td><span class="badge bg-warning">Pending</span></td>
                                </tr>
                                <!-- Add more rows dynamically -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        <% } %>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
