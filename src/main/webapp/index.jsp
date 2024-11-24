<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bay Motors Login</title>
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
        </div>
    </nav>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Bay Motors Login</h1>

        <div class="row justify-content-center">
        <%
		    String message = (String) session.getAttribute("invalidLogin");
		    if (message != null) {
		    	out.println(message);
		    	session.setAttribute("invalidLogin", "");
		    }
		%>
            <div class="col-md-6">
                <!-- Login Form -->
                <form id="loginForm" method="POST">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Login As</label>
                        <select class="form-select" id="role" name="role" required>
                            <option value="" selected disabled>Select Role</option>
                            <option value="MANAGER">Manager</option>
                            <option value="MECHANIC">Mechanic</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Dynamically set the form action based on selected role
        const loginForm = document.getElementById('loginForm');
        const roleSelect = document.getElementById('role');

        roleSelect.addEventListener('change', () => {
            const selectedRole = roleSelect.value;
            if (selectedRole === 'MANAGER' || selectedRole === 'MECHANIC') {
                loginForm.action = 'LoginServlet';
            }
        });
    </script>
</body>
</html>
