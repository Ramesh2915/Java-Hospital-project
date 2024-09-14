<%@page import="com.sonix.admindashboard.serviceImpl.ShiftServiceImpl"%>
<%@page import="com.sonix.admindashboard.entity.Shift"%>
<%@page import="com.sonix.admindashboard.entity.Specialization"%>
<%@page import="com.sonix.admindashboard.serviceImpl.SpecializationServiceImpl"%>
<%@page import="com.sonix.admindashboard.exception.DoctorException"%>
<%@page import="com.sonix.admindashboard.entity.Doctor"%>
<%@page import="com.sonix.admindashboard.service.DoctorService"%>
<%@page import="com.sonix.admindashboard.serviceImpl.DoctorServiceImpl"%>
<%@page import="com.sonix.admindashboard.serviceImpl.AdminServiceImpl"%>
<%@page import="com.sonix.admindashboard.entity.Admin"%>
<%@page import="com.sonix.admindashboard.exception.HospitalException"%>
<%@page import="com.sonix.admindashboard.entity.Hospital"%>
<%@page import="com.sonix.admindashboard.serviceImpl.HospitalServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.HospitalServcie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Doctor</title>
<%

if (request.getMethod().equalsIgnoreCase("POST")) {
    
    if (request.getParameter("delete") != null && request.getParameter("delete").equals("DELETE")) {
        String doctorId = request.getParameter("doctorId");
        
		 DoctorService dserv = new DoctorServiceImpl();
        String message = null;
        if (doctorId != null) {
            try {
                int id = Integer.parseInt(doctorId);
                message = dserv.deleteDoctorById(id);
            } catch (DoctorException e) {
                message = e.getMessage();
            }
        }
        session.setAttribute("message", message);
        response.sendRedirect("../admin/Dashboard.jsp");
    } 
    else if(request.getParameter("save") !=null && request.getParameter("save").equals("SAVE")){
        
        int id = Integer.parseInt(request.getParameter("doctorId"));
 
        String doctorName = request.getParameter("doctorName");
        String doctorGender = request.getParameter("doctorGender");
        String doctorExperience = request.getParameter("doctorExperience");
        String doctorQualification= request.getParameter("doctorQualification");
        long doctorPhno = Long.parseLong(request.getParameter("doctorPhno"));
        String doctorEmail = request.getParameter("doctorEmail");
        int hospitalId=Integer.parseInt(request.getParameter("hospitalId"));
        int specializationId=Integer.parseInt(request.getParameter("specializationId"));
        int shiftId=Integer.parseInt(request.getParameter("shiftId"));
        Hospital hospital = new HospitalServiceImpl().getHospitalById(hospitalId);
       Specialization specialization = new SpecializationServiceImpl().getSpecializationById(specializationId);
       Shift shift = new ShiftServiceImpl().getShiftById(shiftId);
       
       Doctor doctor = new Doctor();
       doctor.setDoctorId(id);
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
            DoctorService doctorService = new DoctorServiceImpl();
            message = doctorService.updateDoctor(doctor);
        } catch (DoctorException e) {
            message = e.getMessage();
        }
        session.setAttribute("message", message);
        response.sendRedirect("../admin/Dashboard.jsp");
    }
}
%>
<script src="../../js/admin/Dashboard.js"></script>
<script>
function enableForm(rowId) {
    var row = document.getElementById(rowId);
    var inputs = row.querySelectorAll("input[type='text'], input[type='number'],input[type='email']");
    for (var i = 1; i < inputs.length-3; i++) {
        inputs[i].disabled = false;
    }
    row.querySelector(".update").style.display = "none";
    row.querySelector(".save").style.display = "inline";
}

function disableForm(rowId) {
    var row = document.getElementById(rowId);
    var inputs = row.querySelectorAll("input[type='text'], input[type='number'],input[type='email']");
    for (var i = 1; i < inputs.length-3; i++) {
        inputs[i].disabled = true;
    }
    row.querySelector(".update").style.display = "inline";
    row.querySelector(".save").style.display = "none";
}

function disableAllForms() {
    var rows = document.querySelectorAll("tbody tr");
    for (var i = 0; i < rows.length; i++) {
        disableForm(rows[i].id);
    }
}
</script>
<style>
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}
/* General table styling */
.heading{
margin-top:10px;
color: red;
text-align: center;
}
.id{
width: 5%;
}
.name{
width: 18%;
}
.gender{
width: 8%;
}

.email{
width: 25%;
}
.phno{
width: 14%;
}



thead {
    border-radius: 5px;
}
.table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
    border-collapse: collapse;
}

.table th, .table td {
    padding: 0.75rem;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}
input {
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

input:focus {
    color: #212529;
    background-color: #fff;
    border-color: #86b7fe;
    outline: 0;
    box-shadow: 0 0 0 0.25rem rgb(13 110 253 / 25%);
}

input[type=submit], input[type=button] {
    border-radius: 4px;
    cursor: pointer;
}

.update {
    background-color: #FFD700;
}
.save {
    background-color: #45a049;
}
.delete {
    background-color: #FF4500;
}

/* Dark header styling */
.thead-dark th {
    color: #fff;
    background-color: #343a40;
    border-color: #454d55;
    text-align: left;
}

/* Scope row styling */
th[scope="row"] {
    font-weight: bold;
}

</style>
</head>
<body onload="disableAllForms()">
<h2 class="heading">Doctor Data</h2>
<table class="table">
    <thead class="thead-dark">
        <tr>
            <th scope="col" class="id">Id</th>
            <th scope="col" class="name">Doctor Name</th>
            <th scope="col" class="gender">Gender</th>
            <th scope="col">Experience</th>
            <th scope="col">Qualification</th>
            <th scope="col" class="email">Email</th>
            <th scope="col" class="phno">Phone Number </th>
            <th scope="col">Hospital Id</th>
            <th scope="col">Spec Id</th>
            <th scope="col">Shift Id</th>
            <th scope="col">Update</th>
            <th scope="col">Delete</th>
        </tr>
    </thead>
    <tbody>
        <%
        try {
            DoctorService dserv = new DoctorServiceImpl();
            List<Doctor> doctors = dserv.getAllDoctor();
            for (Doctor doctor : doctors) {
        %>
            <tr id="row-<%=doctor.getDoctorId()%>">
                <form action="../doctor/ShowDoctor.jsp" method="post">
                    <td>
                        <input type="number" value='<%=doctor.getDoctorId() %>' disabled/>
                        <input type="hidden" name="doctorId" value='<%=doctor.getDoctorId() %>'/>
                    </td>
                    <td><input type="text" name="doctorName" value='<%=doctor.getDoctorName() %>' disabled/></td>
                    <td><input type="text" name="doctorGender" value='<%=doctor.getDoctorGender() %>' disabled/></td>
                    <td><input type="text" name="doctorExperience" value='<%=doctor.getDoctorExperience() %>' disabled/></td>
                    <td><input type="text" name="doctorQualification" value='<%=doctor.getDoctorQualification() %>' disabled/></td>
                    <td><input type="email" name="doctorEmail" value='<%=doctor.getDoctorEmail() %>' disabled/></td>
                    <td><input type="number" name="doctorPhno" value='<%=doctor.getDoctorPhno()%>' disabled/></td>
                     <td><input type="number" value='<%=doctor.getHospital().getHospitalId()%>' disabled/>
                     <input type="hidden" name="hospitalId" value='<%=doctor.getHospital().getHospitalId()%>'/></td>
                     <td><input type="number"  value='<%=doctor.getSpecialization().getSpecializationId() %>' disabled/>
                     <input type="hidden" name="specializationId" value='<%=doctor.getSpecialization().getSpecializationId() %>'/></td>
                     <td><input type="number" value='<%=doctor.getShift().getShiftId() %>' disabled/>
                     <input type="hidden" name="shiftId" value='<%=doctor.getShift().getShiftId() %>'/></td>
                    <td>
                        <input type="button" class="update" id="edit-btn-row-<%=doctor.getDoctorId()%>" name="update" value="UPDATE" onclick="enableForm('row-<%=doctor.getDoctorId()%>')" />  
                        <input type="submit" class="save" id="save-btn-row-<%=doctor.getDoctorId()%>" name="save" value="SAVE" style="display: none;"/>
                    </td>
                    <td>
                        <input type="submit" class="delete" name="delete" value="DELETE" />
                    </td>
                </form>
            </tr>
            <%
            }
        } catch (DoctorException e) {
            out.println("<p style=\"text-align:center\">" + e.getMessage() + "</p>");
        }
        %>
    </tbody>
</table>

</body>
</html>
