<%@ page import="lk.ijse.ecommerceapplication_jsp.DTO.CustomerDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .page-header {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .card {
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: #2c3e50;
            color: white;
            border: none;
        }
        .btn-custom:hover {
            background-color: #34495e;
        }
        .modal-header {
            background-color: #2c3e50;
            color: white;
        }
        .back-button {
            margin-bottom: 20px;
        }
    </style>
</head>


<body>
<div class="container my-5">
    <!-- Page Header -->
    <div class="page-header mb-4">
        <h1>Manage Users</h1>
        <p>Here you can view, add, edit, or deactivate users in the system.</p>
    </div>

    <!-- Add User Button -->
    <div class="mb-3">
        <button class="btn btn-custom" data-bs-toggle="modal" data-bs-target="#addUserModal">Get Users Details</button>
    </div>

    <a href="customer-getAll">reload</a>






    <!-- Users Table -->
    <div class="card">
        <div class="card-body">


            <%
                List<CustomerDTO> datalist = (List<CustomerDTO>) request.getAttribute("CustomersList");
                if (datalist != null && !datalist.isEmpty()) {
            %>



            <table class="table table-striped">
                <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Address</th>
                    <th>Telephone</th>
                    <th>Email</th>
                    <th>Account Type</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>


                <%
                    for (CustomerDTO customerDTO : datalist) {
                %>
                <tr>
                    <td><%= customerDTO.getFirstName() %></td>
                    <td><%= customerDTO.getLastName() %></td>
                    <td><%= customerDTO.getAddress() %></td>
                    <td><%= customerDTO.getTelephone() %></td>
                    <td><%= customerDTO.getEmail() %></td>
                    <td><%= customerDTO.getAccountType() %></td>
                    <td>
                        <button class="btn btn-sm btn-danger">Deactivate </button>
                        <button class="btn btn-sm btn-success">Activate </button>
                    </td>
                </tr>

                <%
                    }
                %>

                </tbody>
            </table>

            <%
            } else {
            %>
            <div class="alert alert-warning">
                No customers found.
            </div>
            <%
                }
            %>

        </div>
    </div>

</div>

</body>
</html>
