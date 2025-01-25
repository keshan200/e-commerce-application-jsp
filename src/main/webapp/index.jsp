<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>

  <meta name="keywords" content="html, css, javaScript">
  <meta name="author" content="Keshan Silva">
  <meta name="viewport" content="width=device-width, initial-scale=1">



  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Edu+SA+Beginner:wght@500&family=Figtree:wght@300..900&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Lexend:wght@300&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Playwrite+IN:wght@100..400&display=swap" rel="stylesheet">


  <link rel="stylesheet" href="assets/styles/normalize.css">

  <link rel="stylesheet" href="assets/styles/index.css">
  <link rel="stylesheet" href="assets/styles/mainHeader.css">
  <link rel="stylesheet" href="assets/styles/categories-section.css">
  <link rel="stylesheet" href="assets/styles/sale-page.css">
  <link rel="stylesheet" href="assets/styles/fearured-product-page.css">
  <link rel="stylesheet" href="assets/styles/about-us-page.css">
  <link rel="stylesheet" href="assets/styles/lates-product-page.css">
  <link rel="stylesheet" href="assets/styles/details-page.css">
  <link rel="stylesheet" href="assets/styles/footer-page.css">


<%--stye--%>
  <style>



  </style>


</head>
<body>

<main id="homePage">

  <header class="header d-flex justify-content-center">
    <nav class="navigation z-2 position-absolute ">

      <ul class="ul">
        <li>Categories</li>
        <li>Shop</li>
      </ul>


      <div class="brand">
        <p class="logo-text">DecoraLux</p>
      </div>

      <ul class="ul">
        <li>Contact</li>
        <li>Login</li>
      </ul>

    </nav>
  </header>



  <main class="home-content  d-flex justify-content-center">

    <section class="home-section-1" style="z-index: 2">
      <div>
        <p class="county">DecoraLUX Furniture Store,SriLanka</p>
      </div>

      <div>
        <p class="home-txt">LUXURY</p>
        <p class="home-txt">FURNITURE</p>
      </div>
    </section>

    <section class="home-section-2 d-flex" style="z-index: 2">

      <div class="home-btn">
        <p class="home-description">Let's create and discover new furniture together.</p>
        <button class="btn btn-light">View new collection</button>
      </div>


      <section class="home-section-3">
        <div>
          <p  class="home-description">At DecoraLUX,we're here to help you and what you love</p>
        </div>

        <div>
          <p  class="home-description">We'll put it all together for you.Free one-on-one design help,in our store or in your home!</p>
        </div>
      </section>

    </section>

  </main>

</main>

<main id="main-header">

  <header class="navbar">

    <p class="brand">DecoraLUX</p>

    <nav id="main-nav" class="navbar">

      <ul class="nav-list">
        <li class="nav-item"><a href="admin-dashboard.jsp" class="nav-link">Categories</a></li>
        <li class="nav-item"><a href="" class="nav-link">About Us</a></li>
        <li class="nav-item"><a href="" class="nav-link">New Arrival</a></li>
      </ul>
    </nav>

    <div class="header-image">
      <img class="cart" src="assets/img/cart-black.png" alt="Cart">
    </div>

  </header>

</main>

<%--index jsp fiel--%>
<main id="category-page">

  <main class="categoryPage-content">
    <div class="categoryPage-header">
      <p class="categoryPage-text">Explore Our Collection</p>
    </div>

    <section class="category-grid">

     <a href=".jsp"><div class="category-container">
        <img class="category-img" src="assets/img/living-room.jpg" alt="Living Room">
        <p class="category-title">Living Room</p>
      </div></a>

      <div class="category-container">
        <img class="category-img" src="assets/img/bed-room.jpg" alt="Bedroom">
        <p class="category-title">Bedroom</p>
      </div>

      <div class="category-container">
        <img class="category-img" src="assets/img/kitchen-set.avif" alt="Kitchen Set">
        <p class="category-title">Kitchen Set</p>
      </div>

    </section>

  </main>

</main>


<main id="sale-page">

  <main class="sale-content">

    <section class="img-section">
      <section class="sale-items">

        <%--<div class="img-container" id="img-container1">
          <img class="sale-img" src="assets/img/chair.jpg" alt="Chair">
          <div class="discount-overlay">
            <p class="discount-text">-50% Off</p>
          </div>
        </div>

        <div class="img-container" id="img-container2">
          <img class="sale-img" src="assets/img/recliner.jpeg" alt="recliner">
          <div class="discount-overlay">
            <p class="discount-text">-30% Off</p>
          </div>
        </div>

        <div class="img-container" id="img-container3">
          <img class="sale-img" src="assets/img/mirror.jpg" alt="Mirror">
          <div class="discount-overlay">
            <p class="discount-text">-40% Off</p>
          </div>
        </div>--%>

          <div class="category-container">
            <img class="sale-img" src="assets/img/chair.jpg" alt="Chair">
            <div class="discount-overlay">
              <p class="discount-text">-50% Off</p>
            </div>
          </div>

          <div class="category-container">
            <img class="sale-img" src="assets/img/recliner.jpeg" alt="recliner">
            <div class="discount-overlay">
              <p class="discount-text">-30% Off</p>
            </div>
          </div>

          <div class="category-container">
            <img class="sale-img" src="assets/img/mirror.jpg" alt="Mirror">
            <div class="discount-overlay">
              <p class="discount-text">-40% Off</p>
            </div>
          </div>


      </section>
    </section>

    <section class="sale-text-section">
      <p class="sale-text">Spotlight on </p>
      <p class="sale-text"> Must-Have </p>
      <p class="sale-text">Bargains!</p>
    </section>


  </main>

</main>


<main id="featured-products-page">

  <div class="products-header">
    <p class="products-page-Title">OUR FEATURED ITEMS</p>
  </div>

  <section class="product-grid">

    <div class="product-container">

      <div class="product-card">
          <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

            <div class="product-info">
        <p class="product-name">Product Name 1</p>
        <p class="product-price">$99.99</p>
      </div>
            <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

  </section>


</main>


<main id="about-us-page">

  <main class="content">

    <section class="about-section">

      <p class="title">OUR ADVANTAGES</p>

      <section class="text-section">

        <p class="para">We provide high-quality merchandise, great value, and exceptional customer service. We connect people with products and services in new and unexpected ways. We do our part to create dream homes for all.</p>
        <p class="para">Industry leaders and influencers recognize as one of the most trustworthy retail companies in the, ranking high for both customer and employee satisfaction.</p>

        <div class="count-section">

          <div class="count-cont">
            <p class="count">800+</p>
            <p class="para">Model Finished</p>
          </div>

          <div class="count-cont">
            <p class="count">200+</p>
            <p class="para">Unique assortments</p>
          </div>

          <div class="count-cont">
            <p class="count">30+</p>
            <p class="para">Across the country</p>
          </div>

        </div>
      </section>


    </section>

    <div class="img-section">
      <img class="about-img" src="assets/img/home.webp">
    </div>

  </main>


</main>


<main id="lates-product">

  <div class="products-header">
    <p class="products-page-Title">OUR FEATURED ITEMS</p>
  </div>

  <section class="product-grid">

    <div class="product-container">

      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">

      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

    <div class="product-container">
      <div class="product-card">
        <img class="product-img" src="assets/img/chair.jpg" alt="Product 1">

        <div class="product-info">
          <p class="product-name">Product Name 1</p>
          <p class="product-price">$99.99</p>
        </div>
        <button class="add-to-cart-btn">Add to Cart</button>
      </div>
    </div>

  </section>


</main>


<main id="details">

  <section class="details-section">

    <div class="details-container">
      <img class="details-logo" src="assets/img/tracking.png" alt="Tracking">
      <p class="type">Order Tracking</p>
      <p class="desc">Track real time your order</p>
    </div>

    <div class="details-container">
      <img class="details-logo" src="assets/img/shipping.png" alt="Shipping">
      <p class="type">Free Shipping</p>
      <p class="desc">you wil love at great low prices</p>
    </div>

    <div class="details-container">
      <img class="details-logo" src="assets/img/payment.png" alt="Payment">
      <p class="type">Flexible Payment</p>
      <p class="desc">pay with multiple payments</p>
    </div>

    <div class="details-container">
      <img class="details-logo" src="assets/img/delivery.png" alt="Delivery">
      <p class="type">Fast Delivery</p>
      <p class="desc">Experience the joy of fast shipping</p>
    </div>

    <div class="details-container">
      <img class="details-logo" src="assets/img/24hours.png" alt="24Hours Customer Support">
      <p class="type">Premium Support</p>
      <p class="desc">Outstanding premium support</p>
    </div>

  </section>


</main>

<main id="footer-page">

  <footer class="footer-page">

    <section class="footer-image-section">
      <div class="footer-text-section">
        <p class="footer-title">BROWSE MODERN TODAY!</p>
        <p class="footer-desc">Dive into our collection of contemporary furniture and decor,</p>
        <p class="footer-desc">meticulously designed elevate your living spaces</p>
      </div>
    </section>


    <section class="last-footer-page">

      <div>
        <p class="footer-text">DecoraLUX</p>
        <p class="footer-text2">stay informed about new arrivals</p>
      </div>


      <div>
        <p class="address">4523 Roayal Ln.Messa,<br>Sri Lanka</p>
        <p class="ftxt">+(94)774510748</p>
        <p class="ftxt"> decorlux@gmail.com</p>
      </div>


    </section>


  </footer>


</main>









<script src="assets/lib/jquery-3.7.1.min.js"></script>
<script src="assets/script/nav_popup.js"></script>

</body>
</html>