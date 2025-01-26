<%@ page import="lk.ijse.ecommerceapplication_jsp.DTO.CategoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerceapplication_jsp.DTO.ProductDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products</title>
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
        .table img {
            width: 50px;
            height: 50px;
            object-fit: cover;
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
    <!-- Back Button -->
    <div class="back-button">
        <a href="dashboardAdmin.jsp" class="btn btn-secondary">← Back</a>
    </div>

    <!-- Page Header -->
    <div class="page-header mb-4">
        <h1>Manage Products</h1>
        <p>Here you can view, add, edit, or delete products in the inventory.</p>
    </div>

    <!-- Add Product Button -->
    <div class="mb-3">
        <button class="btn btn-custom" data-bs-toggle="modal" data-bs-target="#addProductModal">Add New Product</button>
    </div>


    <a href="load-list">reload</a>

    <!-- Product Table -->
    <div class="card">
        <div class="card-body">
            <%
                // Get the product list from the request
                List<ProductDTO> datalist = (List<ProductDTO>) request.getAttribute("productList"); // Changed to match servlet
                if (datalist != null && !datalist.isEmpty()) {
            %>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Material</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (ProductDTO productDTO : datalist) {
                %>
                <tr>
                    <td><img src="uploads/<%= productDTO.getItemImage() %>" width="20px" height="30px"></td>
                    <td><%= productDTO.getItemName() %></td>
                    <td><%= productDTO.getItemDescription() %></td>
                    <td><%= productDTO.getCategoryID() %></td>
                    <td><%= productDTO.getMaterial() %></td>
                    <td><%= productDTO.getQuantity() %></td>
                    <td><%= productDTO.getUnitPrice() %></td>
                    <td>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editProductModal"

                                data-item-name="<%= productDTO.getItemName() %>"
                                data-item-description="<%= productDTO.getItemDescription() %>"
                                data-item-price="<%= productDTO.getUnitPrice() %>"
                                data-item-category="<%= productDTO.getCategoryID() %>"
                                data-item-quantity="<%= productDTO.getQuantity() %>"
                                data-item-material="<%= productDTO.getMaterial() %>"
                                data-item-image="<%= productDTO.getItemImage()%>">
                            Edit
                        </button>
                        <button class="btn btn-sm btn-danger">Delete</button>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <%
            } else {
            %>
            <p>No products available.</p>
            <%
                }
            %>
        </div>
    </div>

</div>


<!-- Add Product Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>


            <form action="product-save" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="productName" name="itemName" required>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="productDescription" name="itemDescription" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="productPrice" name="unitPrice" step="0.01" required>
                    </div>

                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Category</label>
                        <select class="form-select" id="productCategory" name="categoryID" required>
                            <%
                                List<CategoryDTO> categories = (List<CategoryDTO>) request.getAttribute("categories");
                                if (categories != null && !categories.isEmpty()) {
                                    for (CategoryDTO category : categories) {
                            %>
                            <option value="<%= category.getId() %>"><%= category.getCategory() %></option>
                            <%
                                }
                            } else {
                            %>
                            <option value="">No categories available</option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="productStock" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="productStock" name="quantity" required>
                    </div>
                    <div class="mb-3">
                        <label for="material" class="form-label">Material</label>
                        <input type="number" class="form-control" id="material" name="material" required>
                    </div>

                    <div class="mb-3">
                        <label for="productImage" class="form-label">Image</label>
                        <input type="file" class="form-control" id="productImage" name="itemImage" accept="image/*">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-custom">Add Product</button>
                </div>

                <button type="button" class="btn btn-secondary ms-2"
                        onclick="window.location.href='http://localhost:8080/e_commerce_application_jsp_war_exploded/loadCategories'">
                    Reload
                </button>
            </form>

        </div>
    </div>
</div>

<!-- Edit Product Modal -->
<div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="product-update" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="productNameU" class="form-label">Name</label>
                        <input type="text" class="form-control" id="productNameU" name="itemName" required>
                    </div>
                    <div class="mb-3">
                        <label for="productDescriptionU" class="form-label">Description</label>
                        <textarea class="form-control" id="productDescriptionU" name="itemDescription" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="productPriceU" class="form-label">Price</label>
                        <input type="number" class="form-control" id="productPriceU" name="unitPrice" step="0.01" required>
                    </div>

                    <div class="mb-3">
                        <label for="productCategoryU" class="form-label">Category</label>
                        <select class="form-select" id="productCategoryU" name="categoryID" required>
                            <%
                                List<CategoryDTO> categoriess = (List<CategoryDTO>) request.getAttribute("categories");
                                if (categories != null && !categories.isEmpty()) {
                                    for (CategoryDTO category : categoriess) {
                            %>
                            <option value="<%= category.getId() %>"><%= category.getCategory() %></option>


                            <%
                                }
                            } else {
                            %>
                            <option value="">No categories available</option>
                            <%
                                }
                            %>
                        </select>
                    </div>



                    <div class="mb-3">
                        <label for="productStockU" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="productStockU" name="quantity" required>
                    </div>
                    <div class="mb-3">
                        <label for="materialU" class="form-label">Material</label>
                        <input type="number" class="form-control" id="materialU" name="material" required>
                    </div>

                    <div class="mb-3">
                        <label for="productImageU" class="form-label">Image</label>
                        <input type="file" class="form-control" id="productImageU" name="itemImage" accept="image/*">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-custom">update Product</button>
                </div>

                <button type="button" class="btn btn-secondary ms-2"
                        onclick="window.location.href='http://localhost:8080/e_commerce_application_jsp_war_exploded/loadCategories'">
                    Reload
                </button>
            </form>
        </div>
    </div>
</div>


<script>
    // Add event listener to capture the button click and populate modal fields
    const editProductModal = document.getElementById('editProductModal');
    editProductModal.addEventListener('show.bs.modal', function(event) {
        const button = event.relatedTarget; // The button that triggered the modal

        // Get data attributes from the button
        const itemID = button.getAttribute('data-item-id');
        const itemName = button.getAttribute('data-item-name');
        const itemDescription = button.getAttribute('data-item-description');
        const itemPrice = button.getAttribute('data-item-price');
        const itemCategory = button.getAttribute('data-item-category');
        const itemQuantity = button.getAttribute('data-item-quantity');
        const itemMaterial = button.getAttribute('data-item-material');
        const itemImage = button.getAttribute('data-item-image');

        // Populate the form fields with the data from the button
        document.getElementById('productNameU').value = itemName;
        document.getElementById('productDescriptionU').value = itemDescription;
        document.getElementById('productPriceU').value = itemPrice;
        document.getElementById('productCategoryU').value = itemCategory;
        document.getElementById('productStockU').value = itemQuantity;
        document.getElementById('materialU').value = itemMaterial;

        // Display current image if available
        if (itemImage) {
            document.getElementById('currentProductImage').src = "uploads/" + itemImage;
            document.getElementById('currentProductImage').style.display = "block";
        } else {
            document.getElementById('currentProductImage').style.display = "none";
        }
    });
</script>

</body>
</html>
