<%@page import="com.sonix.admindashboard.serviceImpl.HospitalServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.HospitalServcie"%>
<%@page import="com.sonix.admindashboard.entity.Hospital"%>
<%@page import="java.util.List"%>
<%@page import="com.sonix.admindashboard.serviceImpl.AdminServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.AdminService"%>
<%@page import="com.sonix.admindashboard.exception.AdminException"%>
<%@page import="com.sonix.admindashboard.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
            	  
           if (request.getMethod().equalsIgnoreCase("POST")) {
            	  
               String hospitalName = request.getParameter("hospitalName");
               String hospitalCity = request.getParameter("hospitalCity");
               String hospitalAddress = request.getParameter("hospitalAddress");
               int hospitalPincode= Integer.parseInt(request.getParameter("hospitalPincode"));
               long hospitalPhno = Long.parseLong(request.getParameter("hospitalPhno"));
               String hospitalEmail = request.getParameter("hospitalEmail");
               String selectedAdminId = request.getParameter("selectedAdminId");
               if (selectedAdminId != null) {
               int adminId=Integer.parseInt(request.getParameter("selectedAdminId"));
                AdminService adminService = new AdminServiceImpl();
               Admin admin= adminService.getAdminById(adminId);
               
               
              Hospital hospital=new Hospital();
               
              hospital.setHospitalname(hospitalName);
              hospital.setHospitalCity(hospitalCity);
              hospital.setHospitalAddress(hospitalAddress);
              hospital.setHospitalPincode(hospitalPincode);
              hospital.setHospitalPhno(hospitalPhno);
              hospital.setHospitalEmail(hospitalEmail);
              hospital.setAdmin(admin);
              

              String message = null;
              try {
                  HospitalServcie hserv=new HospitalServiceImpl();
                  message = hserv.addHospital(hospital);
              } catch (AdminException e) {
                  message =  e.getMessage();
                 
              }
              session.setAttribute("message", message);
              response.sendRedirect("../admin/Dashboard.jsp");
               }
              } 
            %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Hospital</title>
<style type="text/css">
.form-group input,select  {
	width: 100%;
	padding: 6px 12px;
	font-size: 16px;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	appearance: none;
	border-radius: 4px;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.form-group input:focus,select:focus {
	color: #212529;
	background-color: #fff;
	border-color: #86b7fe;
	outline: 0;
	box-shadow: 0 0 0 0.25rem rgb(13 110 253/ 25%);
}
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}
.form-container{
width: 80%;
margin-left: auto;
margin-right: auto;
margin-top: 50px;
padding: 10px;
background-color: #EDF7F7;
box-shadow: rgba(6, 24, 44, 0.4) 0px 0px 0px 2px, rgba(6, 24, 44, 0.65) 0px 4px 6px -1px, rgba(255, 255, 255, 0.08) 0px 1px 0px inset;
border-radius: 10px;
}
.form-container h2{
text-align: center;
}

.form-header{
	color: red;
	margin: 20px;
	margin-bottom: 30px;
}
.form-group {
    margin-bottom: 1rem;
    text-align: left;
     margin: 10px;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    color: #333;
}

.form-group input {
    width: 100%;
    padding: 0.5rem;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button{
    background: #2e3b4e;
    color: #fff;
    border: none;
    padding: 0.75rem;
    width: 100%;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
    margin-top: 1rem;
}

button:hover {
    background: #233044;
}

button[type="button"] {
    background: #ccc;
    color: #333;
}

button[type="button"]:hover {
    background: #bbb;
}
 .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

.form-grid .form-group.full-width {
            grid-column: span 2;
            width: 30%;
            margin-left: auto;
            margin-right: auto;
        }
       
    </style>
</head>
<body>
    <div class="form-container">
    <div class="form-header">
        <h2>Add Hospital</h2>
        </div>
        <div class="form-body">
        <form action="../hospital/AddHospital.jsp" method="post">
         <div class="form-grid">
            <div class="form-group">
                <label for="hospitalName">Hospital Name</label>
                <input type="text" id="hospitalName" name="hospitalName" required>
            </div>
            <div class="form-group">
                <label for="hospitalCity">Hospital City</label>
                <input type="text" id="hospitalCity" name="hospitalCity" required>
            </div>
            <div class="form-group">
                <label for="hospitalAddress">Hospital Address</label>
                <input type="text" id="hospitalAddress" name="hospitalAddress" required>
            </div>
            <div class="form-group">
                <label for="hospitalPincode">Hospital Pincode</label>
                <input type="number" id="hospitalPincode" name="hospitalPincode" required>
            </div>
            <div class="form-group">
                <label for="hospitalEmail">Hospital Email</label>
                <input type="email" id="hospitalEmail" name="hospitalEmail" required>
            </div>
              <div class="form-group">
                <label for="hospitalPhno">Hospital Phno</label>
                <input type="number" id="hospitalPhno" name="hospitalPhno" required>
            </div>
              <div class="form-group">
                <label for="adminId">Admin Id</label>
                <select name="selectedAdminId">
                <% List<Admin> adminList=new AdminServiceImpl().getAllAdmin();
                		for(Admin ad:adminList){
                			%>
                			  <option  id="adminId" value="<%= ad.getAdminId() %>"><%=ad.getAdminId() %></option>
                			<%
                		}
                		%>
                </select>
              </div> 
        
                <div class="form-group full-width">
                    <button type="submit">Add Hospital</button>
                </div>
                <div class="form-group full-width">
                    <button type="button" id="goToDashboard" onclick="location.href='../admin/Dashboard.jsp'">Go to Dashboard</button>
                </div>
            </div>
        </form>
        </div>
    </div>

</body>
</html>
