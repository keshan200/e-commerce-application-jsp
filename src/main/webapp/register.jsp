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
      #reg-page{
        width: 100vw;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .reg-content{
        width: 80vw;
        display: flex;
      }


      body {
      font-family: 'Roboto', sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      }
      .reg-form {
        background: #ffffff;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        max-width: 500px;
        width: 100%;
      }
      .reg-form h2 {
        text-align: center;
        color: #333;
        margin-bottom: 1.5rem;
      }
      .form-group {
        margin-bottom: 1rem;
      }
      .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 0.5rem;
      }
      .form-group input, .form-group textarea, .form-group select {
        width: 100%;
        padding: 0.75rem;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1rem;
      }
      .form-group textarea {
        resize: none;
        height: 100px;
      }
      .form-group select {
        background: #fff;
      }
      .form-group input:focus, .form-group textarea:focus, .form-group select:focus {
        border-color: #007BFF;
        outline: none;
        box-shadow: 0 0 3px rgba(0, 123, 255, 0.5);
      }
      .btn {
        display: block;
        width: 100%;
        padding: 0.75rem;
        background-color: #007BFF;
        color: #fff;
        font-size: 1rem;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
      }
      .btn:hover {
        background-color: #0056b3;
      }

      .reg-content{
        width: 40vw;
        height: 100vh;
        background-image: url("../webapp/assets/img/home2.png");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
      }

    </style>

  </head>
  <body>

  <main id="reg-page">

     <section class="reg-content" >

      <section>


      </section>

       <section class="reg-form">
         <h2>Create Account</h2>
         <form action="register.jsp" method="post">

           <section style="display: flex;gap:30px">
           <div class="form-group">
             <label for="firstName">First Name</label>
             <input type="text" id="firstName" name="firstName" placeholder="Enter your first name" required>
           </div>
           <div class="form-group">
             <label for="lastName">Last Name</label>
             <input type="text" id="lastName" name="lastName" placeholder="Enter your last name" required>
           </div>
           </section>
           <div class="form-group">
             <label for="email">Email</label>
             <input type="email" id="email" name="email" placeholder="Enter your email" required>
           </div>
           <div class="form-group">
             <label for="password">Password</label>
             <input type="password" id="password" name="password" placeholder="Enter your password" required>
           </div>
           <div class="form-group">
             <label for="address">Address</label>
             <textarea id="address" name="address" placeholder="Enter your address"></textarea>
           </div>
           <div class="form-group">
             <label for="telephone">Telephone</label>
             <input type="tel" id="telephone" name="telephone" placeholder="Enter your telephone number">
           </div>
           <div class="form-group">
             <label for="accountType">Account Type</label>
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
