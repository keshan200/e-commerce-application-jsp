<%@ page import="lk.ijse.ecommerceapplication_jsp.DTO.CategoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Categories</title>
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
        .form-control, .btn {
            border-radius: 8px;
        }
        .back-button {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container my-4">

    <!-- Page Header -->
    <div class="page-header text-center mb-4">
        <h1>Manage Categories</h1>
        <p>View, add, and manage categories for your store.</p>
    </div>



    <!-- Add Category Form -->
    <div id="ItemCategory" class="container mt-5">

        <button
                type="button"
                class="btn btn-primary mb-3 text-right"
                data-bs-toggle="modal"
                data-bs-target="#ADDModel"
        >
            Add New Category
        </button>

        <!-- Add Modal -->
        <div
                class="modal fade"
                id="ADDModel"
                tabindex="-1"
                aria-labelledby="itemModalLabel"
                aria-hidden="true"
        >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="container m-2">
                        <div class="card border-primary mb-3">
                            <div class="card-header">Add New Item</div>
                            <div class="card-body text-primary">

                                <form action="categorySave" method="post" enctype="multipart/form-data">

                                    <div class="mb-3">
                                        <label for="image" class="form-label">Category Image</label>
                                        <input type="file" name="categoryImage" class="form-control" id="image" accept="image/*" />
                                    </div>


                                    <div class="mb-3">
                                        <label for="name" class="form-label">Category Name</label>
                                        <input type="text" class="form-control" id="name" name="category" required/>
                                    </div>

                                    <button type="submit" id="btnSave" class="btn btn-primary">Add</button>
                                    <button type="button" id="btnClear" class="btn btn-danger">Clear</button>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    <div class="card p-4">
        <h2 class="mb-3">Existing Categories</h2>

        <%
            List<CategoryDTO> datalist = (List<CategoryDTO>) request.getAttribute("categoryList");
            if (datalist != null && !datalist.isEmpty()) {
        %>


        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>Image</th>
                <th>Name</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (CategoryDTO categoryDTO : datalist) {
            %>
            <tr>
                <td><img src="<%=categoryDTO.getCategoryImage()%>" width="20px" height="30px"></td>
                <td><%=categoryDTO.getCategory()%></td>
                <td>
                    <a href="edit-category.jsp?id=1" class="btn btn-sm btn-warning">Edit</a>
                    <a href="delete-category.jsp?id=1" class="btn btn-sm btn-danger">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <%
        }
        %>

    </div>
</div>
</div>

</body>
</html>
