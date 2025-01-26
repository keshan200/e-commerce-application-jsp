<%--
  Created by IntelliJ IDEA.
  User: kesha
  Date: 1/26/2025
  Time: 8:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>

    <style>
      body {
        font-family: 'Roboto', sans-serif;
        background: linear-gradient(to bottom right, #141E30, #243B55);
        color: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
      }

      .login-container {
        background: rgba(0, 0, 0, 0.6);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
        width: 350px;
        text-align: center;
      }

      .login-container h1 {
        margin-bottom: 20px;
      }

      .form-group {
        margin-bottom: 15px;
        text-align: left;
      }

      .form-group label {
        display: block;
        font-weight: bold;
      }

      .form-group input {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: none;
        border-radius: 5px;
        background: #2c3e50;
        color: #fff;
        font-size: 1rem;
      }

      .form-group input:focus {
        outline: none;
        box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
      }

      .btn {
        display: inline-block;
        background: #007BFF;
        color: #fff;
        padding: 10px 20px;
        font-size: 1rem;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background 0.3s;
        width: 100%;
      }

      .btn:hover {
        background: #0056b3;
      }

      .error {
        color: #FF4D4D;
        font-size: 0.9rem;
        margin-top: 5px;
      }
    </style>
  </head>
  <body>

  <body>
  <div class="login-container">
    <h1>Login</h1>
    <form id="loginForm">
      <div class="form-group">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required>
        <small class="error" id="usernameError"></small>
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
        <small class="error" id="passwordError"></small>
      </div>
     <a href="admin-dashboard.jsp"><button type="submit" class="btn">Login</button></a>
    </form>
  </div>


  </body>
  
  </body>
</html>
