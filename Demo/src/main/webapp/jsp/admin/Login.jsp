<%@page import="com.sonix.admindashboard.serviceImpl.AdminServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.AdminService"%>
<%@page import="com.sonix.admindashboard.exception.AdminException"%>
<%@page import="com.sonix.admindashboard.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
         <%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    AdminService adminService=new AdminServiceImpl();
    if (username != null && password != null) {
    	try{ 
    		Admin admin=adminService.adminLogin(username, password);
    	 session.setAttribute("admin", admin);
         response.sendRedirect("Dashboard.jsp");
    	}catch(AdminException e){
    		String errorMessage=e.getMessage();
    		 request.setAttribute("errorMessage", errorMessage);
        }
    	}
%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="../../css/admin/Login.css">

</head>
<body>
    <div class="login-page">
        <div class="header-container">
            <img id="logo-1" alt="" class="hospital-logo" src="../../img/Ayurmed.png"/>
        </div>
        <div class="login-container">
            <div class="login-form">
                <h2>Admin Login</h2>
                <form id="login-form" method="post" action="Login.jsp">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <button type="submit">Login</button>
                    <br><br>
                    <a href="#">Forgot Password ?</a>
                    <div id="error-container">
                           <% if (request.getAttribute("errorMessage") != null) { %>
          <p style="color:red;"><%= request.getAttribute("errorMessage") %></p>
      <% } %> 
      </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
