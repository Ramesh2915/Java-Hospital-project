<%@page import="com.sonix.admindashboard.exception.PatientException"%>
<%@page import="com.sonix.admindashboard.service.PatientService"%>
<%@page import="com.sonix.admindashboard.serviceImpl.PatientServiceImpl"%>
<%@page import="com.sonix.admindashboard.entity.Patient"%>
<%@page import="com.sonix.admindashboard.exception.DoctorException"%>
<%@page import="com.sonix.admindashboard.service.DoctorService"%>
<%@page import="com.sonix.admindashboard.serviceImpl.DoctorServiceImpl"%>
<%@page import="com.sonix.admindashboard.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
            	  
           if (request.getMethod().equalsIgnoreCase("POST")) {
            	  
               String patientName = request.getParameter("patientName");
               int patientAge = Integer.parseInt(request.getParameter("patientAge"));
               String patientDisease = request.getParameter("patientDisease");
               String patientAddress= request.getParameter("patientAddress");
               long patientPhno = Long.parseLong(request.getParameter("patientPhno"));
               String patientEmail = request.getParameter("patientEmail");
               String selectedDoctorId = request.getParameter("selectedDoctorId");
               if (selectedDoctorId != null) {
            	   int doctorId=Integer.parseInt(request.getParameter("selectedDoctorId"));
            	  Doctor doctor= new DoctorServiceImpl().getDoctorById(doctorId);
			Patient patient=new Patient();
			patient.setPatientName(patientName);
			patient.setPatientAge(patientAge);
			patient.setPatientDisease(patientDisease);
			patient.setPatientPhno(patientPhno);
			patient.setPatientEmail(patientEmail);
			patient.setPatientAddress(patientAddress);
			patient.setDoctor(doctor);
			
              String message = null;
              try {
            	  PatientService pserv = new PatientServiceImpl();
            	  message  = pserv.addPatient(patient);
              
              } catch (PatientException e) {
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
    <title>Add Patient</title>
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
        <h2>Add Patient</h2>
        </div>
        <div class="form-body">
        <form action="../patient/AddPatient.jsp" method="post">
         <div class="form-grid">
            <div class="form-group">
                <label for="patientName">Patient Name</label>
                <input type="text" id="patientName" name="patientName" required>
            </div>
            <div class="form-group">
                <label for="patientAge">Age</label>
				<input type="number" id="patientAge" name="patientAge" required>
            </div>
            <div class="form-group">
                <label for="patientDisease">Disease</label>
                <input type="text" id="patientDisease" name="patientDisease" required>
            </div>
                 <div class="form-group">
                <label for="patientPhno">Phno</label>
                <input type="number" id="patientPhno" name="patientPhno" required>
            </div>
                   <div class="form-group">
                <label for="patientEmail">Email</label>
                <input type="email" id="patientEmail" name="patientEmail" required>
            </div>
             <div class="form-group">
                <label for="patientAddress">Address</label>
                <input type="text" id="patientAddress" name="patientAddress" required>
            </div>
             <div class="form-group">
                <label for="doctorId">Doctor Name</label>
                <select name="selectedDoctorId">
                <% List<Doctor> dList=new DoctorServiceImpl().getAllDoctor();
                		for(Doctor doctor:dList){
                			%>
                			  <option  id="doctorId" value="<%= doctor.getDoctorId() %>"><%= doctor.getDoctorId()%>--<%=doctor.getDoctorName()%></option>
                			<%
                		}
                %>
                </select>
              </div> 
                <div class="form-group full-width">
                    <button type="submit">Add Patient</button>
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
