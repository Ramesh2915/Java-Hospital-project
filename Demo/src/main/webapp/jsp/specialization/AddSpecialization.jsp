
<%@page import="com.sonix.admindashboard.serviceImpl.SpecializationServiceImpl"%>
<%@page import="com.sonix.admindashboard.entity.Specialization"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<%
           if (request.getMethod().equalsIgnoreCase("POST")) {
               String specializationName = request.getParameter("specializationName");
               String specializationDescription = request.getParameter("specializationDescription");
               Specialization specialization=new Specialization();
               specialization.setSpecializationName(specializationName);
               specialization.setSpecializationDescription(specializationDescription);
          		String message=new SpecializationServiceImpl().addSpecialization(specialization);
          		session.setAttribute("message", message);
                response.sendRedirect("../admin/Dashboard.jsp");
           }
            %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Specialization</title>
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
        <h2>Add Specialization</h2>
        </div>
        <div class="form-body">
        <form action="../specialization/AddSpecialization.jsp" method="post">
         <div class="form-grid">
            <div class="form-group">
                <label for="specializationName">Specialization Name</label>
                <input type="text" id="specializationName" name="specializationName" required>
            </div>
            <div class="form-group">
                <label for="specializationDescription">Specialization Description</label>
                <input type="text" id="specializationDescription" name="specializationDescription" required>
            </div>
                <div class="form-group full-width">
                    <button type="submit">Add Specialization</button>
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
