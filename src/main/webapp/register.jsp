<%--
  Created by IntelliJ IDEA.
  User: kesha
  Date: 1/26/2025
  Time: 12:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>register</title>

    <style>
      /* General reset and styling */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        overflow: hidden;
      }

      body {
        font-family: 'Roboto', sans-serif;
        background-color: #f9f9f9;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 20px;
      }

      body {
        font-family: 'Roboto', sans-serif;
        background-color: #f9f9f9;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 20px;
        position: relative; /* To position the overlay on top */
      }


      /* Main container styles */
      #reg-page {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        max-width: 1200px;
      }

      .reg-content {
        display: flex;
        width: 100%;
        max-width: 1000px;
      }

      /* Section with the form */
      .reg-form {
        background: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        flex: 1;
        max-width: 600px;
        margin: 0 auto;
      }

      .reg-form h2 {
        text-align: center;
        color: #333;
        font-size: 1.6rem;
        margin-bottom: 1.2rem;
      }

      /* Form group and input fields */
      .form-group {
        margin-bottom: 1.2rem;
      }

      .form-group label {
        font-weight: 600;
        margin-bottom: 0.5rem;
        color: #555;
      }

      .form-group input,
      .form-group textarea,
      .form-group select {
        width: 100%;
        padding: 0.7rem;
        border: none;
        border-radius: 8px;
        font-size: 1rem;
        background-color: #f2f2f2; /* Light grayish-white background for text fields */
        transition: all 0.3s ease;
      }

      .form-group input:focus,
      .form-group textarea:focus,
      .form-group select:focus {
        border-color: #007BFF;
        outline: none;
        box-shadow: 0 0 10px rgba(0, 123, 255, 0.2);
      }

      .form-group textarea {
        resize: none;
        height: 100px;
      }

      .form-group select {
        background-color: #f2f2f2; /* Light grayish-white for select as well */
      }

      /* Submit button styling */
      .btn {
        width: 100%;
        padding: 0.75rem;
        background-color: #007BFF;
        color: white;
        font-weight: 600;
        font-size: 1.1rem;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s;
      }

      .btn:hover {
        background-color: #0056b3;
      }

      /* Background section styling */
      .ndsec {
        flex: 1;
        background-image: url("assets/img/home2.png");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        border-top-left-radius: 10px;
        border-bottom-left-radius: 10px;
      }

      /* Responsive design */
      @media (max-width: 768px) {
        .reg-content {
          flex-direction: column;
          align-items: center;
        }

        .reg-form {
          width: 100%;
          max-width: 500px;
          margin: 20px;
        }

        .ndsec {
          display: none;
        }
      }
    </style>






  </head>
  <body>

  <main id="reg-page">

     <section class="reg-content" >

      <section class="ndsec">


      </section>

       <section class="reg-form">
         <h2>Create Account</h2>
         <form action="customer-register" method="post">

           <section style="display: flex;gap:30px">
           <div class="form-group">

             <input type="text" id="firstName" name="firstName" placeholder="Enter your first name" required>
           </div>
           <div class="form-group">

             <input type="text" id="lastName" name="lastName" placeholder="Enter your last name" required>
           </div>
           </section>
           <div class="form-group">

             <input type="email" id="email" name="email" placeholder="Enter your email" required>
           </div>
           <div class="form-group">

             <input type="password" id="password" name="password" placeholder="Enter your password" required>
           </div>
           <div class="form-group">

             <textarea id="address" name="address" placeholder="Enter your address"></textarea>
           </div>
           <div class="form-group">

             <input type="tel" id="telephone" name="telephone" placeholder="Enter your telephone number">
           </div>
           <div class="form-group">

             <select id="accountType" name="accountType" required>
               <option value="">Select Account Type</option>
               <option value="admin">Admin</option>
               <option value="user">User</option>
             </select>
           </div>
           <button type="submit" class="btn">Register</button>
         </form>
       </section>

    </section>

  </main>
  </body>
</html>
