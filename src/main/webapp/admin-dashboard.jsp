<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Dashboard - Incense Stick Ecom</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Make sure jQuery is included -->

  <style>
    body {
      font-family: Arial, sans-serif;
    }
    .sidebar {
      background-color: black;
      color: white;
      height: 100vh;
      padding-top: 30px;
      position: fixed;
      width: 250px;
    }
    .sidebar a {
      color: white;
      text-decoration: none;
      padding: 15px;
      display: block;
    }
    .sidebar a:hover {
      background-color: black;
      border-radius: 5px;
    }
    .main-content {
      margin-left: 270px; /* Adjusted to provide space for the sidebar */
      padding: 30px;
    }
    .dashboard-header {
      background-color: #f1f1f1;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .card {
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
      height: 100%;
    }
    .card-body {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    .section-header {
      margin-bottom: 30px;
    }
    .btn-custom {
      background-color: black;
      color: white;
      border: none;
    }
    .btn-custom:hover {
      background-color: black;
    }
    .card-text {
      flex-grow: 1; /* Ensures the text doesn't squash the buttons */
    }
  </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
  <h3 class="text-center text-white" style="margin-bottom: 50px">DecoraLUX Admin System</h3>
  <ul class="nav flex-column">
    <li class="nav-item">
      <a href="#" class="nav-link panel-btn" data-url="dashboardCustomer.jsp">Dashboard</a>
    </li>

    <li class="nav-item">
      <a href="customer-getAll" class="nav-link panel-btn" data-url="customer-getAll">View Customer Details</a>
    </li>


    <li class="nav-item">
      <a href="category-list" class="nav-link panel-btn" data-url="category-list">Category Manage</a>
    </li>
    <li class="nav-item">
      <a href="manageProductsAndCategories" class="nav-link panel-btn" data-url="manageProductsAndCategories">Products Manage</a>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link panel-btn" data-url="shop.jsp">Shop</a>
    </li>
    <li class="nav-item">
      <a href="index.jsp" class="nav-link">Logout</a>
    </li>
  </ul>
</div>

<a href="manageProduct?section=dashboardManagement" id="dashboard_nav">Dashboard</a>
<a href="manageProduct?section=productMange" id="product_nav">Product Management</a>





<!-- Main Content -->
<div class="main-content" id="main-content">
  <!-- Dashboard Header -->
  <div class="dashboard-header mb-4">
    <h1>Welcome Back,ADMIN</h1>
    <p>We're so happy to have you back. Explore your orders, update your profile, and keep track of your favorite incense products.</p>
  </div>

  <!-- Order History Section -->

</div>

<script>
  $(document).ready(function () {
    $('.panel-btn').on('click', function (e) {
      e.preventDefault();

      const url = $(this).data('url');
      if (url) {
        $('#main-content').load(url, function (response, status, xhr) {
          if (status === "error") {
            alert("Failed to load content: " + xhr.status + " " + xhr.statusText);
          }
        });
      }
    });
  });
</script>




</body>
</html>
