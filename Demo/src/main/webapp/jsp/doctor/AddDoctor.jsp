<%@page import="com.sonix.admindashboard.exception.DoctorException"%>
<%@page import="com.sonix.admindashboard.service.DoctorService"%>
<%@page import="com.sonix.admindashboard.serviceImpl.DoctorServiceImpl"%>
<%@page import="com.sonix.admindashboard.entity.Doctor"%>
<%@page import="com.sonix.admindashboard.entity.Shift"%>
<%@page import="com.sonix.admindashboard.serviceImpl.ShiftServiceImpl"%>
<%@page import="com.sonix.admindashboard.serviceImpl.SpecializationServiceImpl"%>
<%@page import="com.sonix.admindashboard.entity.Specialization"%>
<%@page import="com.sonix.admindashboard.serviceImpl.HospitalServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.HospitalServcie"%>
<%@page import="com.sonix.admindashboard.entity.Hospital"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
            	  
           if (request.getMethod().equalsIgnoreCase("POST")) {
            	  
               String doctorName = request.getParameter("doctorName");
               String doctorGender = request.getParameter("doctorGender");
               String doctorExperience = request.getParameter("doctorExperience");
               String doctorQualification= request.getParameter("doctorQualification");
               long doctorPhno = Long.parseLong(request.getParameter("doctorPhno"));
               String doctorEmail = request.getParameter("doctorEmail");
               String selectedHospitalId = request.getParameter("selectedHospitalId");
               String selectedSpecializationId = request.getParameter("selectedspecializationId");
               String selectedShiftId = request.getParameter("selectedshiftId");
               if (selectedHospitalId != null && selectedSpecializationId!=null && selectedShiftId!=null) {
            	   int hospitalId=Integer.parseInt(request.getParameter("selectedHospitalId"));
            	   int specializationId=Integer.parseInt(request.getParameter("selectedspecializationId"));
            	   int shiftId =Integer.parseInt(request.getParameter("selectedshiftId"));
            	   
             Hospital hospital = new HospitalServiceImpl().getHospitalById(hospitalId);
             Specialization specialization=new SpecializationServiceImpl().getSpecializationById(specializationId);
             Shift shift= new ShiftServiceImpl().getShiftById(shiftId);
             
              
       		Doctor doctor = new Doctor();
       		doctor.setDoctorName(doctorName);
       		doctor.setDoctorGender(doctorGender);
       		doctor.setDoctorExperience(doctorExperience);
       		doctor.setDoctorQualification(doctorQualification);
       		doctor.setDoctorPhno(doctorPhno);
       		doctor.setDoctorEmail(doctorEmail);
       		doctor.setHospital(hospital);
       		doctor.setSpecialization(specialization);
       		doctor.setShift(shift);

              String message = null;
              try {
            	  DoctorService dserv = new DoctorServiceImpl();
            	  message  = dserv.addDoctor(doctor);
              
              } catch (DoctorException e) {
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
    <title>Add Doctor</title>
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
        <h2>Add Doctor</h2>
        </div>
        <div class="form-body">
        <form action="../doctor/AddDoctor.jsp" method="post">
         <div class="form-grid">
            <div class="form-group">
                <label for="doctorName">Name</label>
                <input type="text" id="doctorName" name="doctorName" required>
            </div>
            <div class="form-group">
                <label for="doctorGender">Gender</label>
                <select name="doctorGender">
                <option value="male">MALE</option>
                 <option value="female">FEAMLE</option>
                  <option value="other">OTHER</option>
                </select>
            </div>
            <div class="form-group">
                <label for="doctorExperience">Experience</label>
                <input type="text" id="doctorExperience" name="doctorExperience" required>
            </div>
            <div class="form-group">
                <label for="doctorQualification">Qualification</label>
                <input type="text" id="doctorQualification" name="doctorQualification" required>
            </div>
            <div class="form-group">
                <label for="doctorEmail">Email</label>
                <input type="email" id="doctorEmail" name="doctorEmail" required>
            </div>
              <div class="form-group">
                <label for="doctorPhno">Phno</label>
                <input type="number" id="doctorPhno" name="doctorPhno" required>
            </div>
             <div class="form-group">
                <label for="hospitalId">Hospital Name</label>
                <select name="selectedHospitalId">
                <% List<Hospital> hList=new HospitalServiceImpl().getAllHospital();
                		for(Hospital hospital:hList){
                			%>
                			  <option  id="hospitalId" value="<%= hospital.getHospitalId() %>"><%=hospital.getHospitalId()%>--<%=hospital.getHospitalname() %></option>
                			<%
                		}
                		%>
                </select>
              </div> 
             <div class="form-group">
                <label for="specializationId">Specialization</label>
                <select name="selectedspecializationId">
                <% List<Specialization> sList=new SpecializationServiceImpl().getAllSpecialization();
                		for(Specialization spec:sList){
                			%>
                			  <option  id="specializationId" value="<%= spec.getSpecializationId() %>"><%=spec.getSpecializationId()%>--<%=spec.getSpecializationName() %></option>
                			<%
                		}
                		%>
                </select>
              </div> 
              <div class="form-group">
                <label for="shiftId">Shift</label>
                <select name="selectedshiftId">
                <% List<Shift> shiftList=new ShiftServiceImpl().getAllShift();
                		for(Shift shift:shiftList){
                			%>
                			  <option  id="shiftId" value="<%= shift.getShiftId() %>"><%=shift.getShiftId()%>--<%=shift.getShiftName() %>(<%=shift.getShiftTiming() %>)</option>
                			<%
                		}
                		%>
                </select>
              </div> 
        
                <div class="form-group full-width">
                    <button type="submit">Add Doctor</button>
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
