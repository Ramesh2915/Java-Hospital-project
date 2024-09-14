<%@page import="com.sonix.admindashboard.exception.PatientException"%>
<%@page import="com.sonix.admindashboard.entity.Patient"%>
<%@page import="com.sonix.admindashboard.serviceImpl.PatientServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.PatientService"%>
<%@page import="com.sonix.admindashboard.entity.Doctor"%>
<%@page import="com.sonix.admindashboard.service.DoctorService"%>
<%@page import="com.sonix.admindashboard.serviceImpl.DoctorServiceImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Patient</title>
<%

if (request.getMethod().equalsIgnoreCase("POST")) {
    
    if (request.getParameter("delete") != null && request.getParameter("delete").equals("DELETE")) {
        String patientId = request.getParameter("patientId");
        PatientService pserv=new PatientServiceImpl();
        
        String message = null;
        if (patientId != null) {
            try {
                int id = Integer.parseInt(patientId);
                message = pserv.deletePatientById(id);
            } catch (PatientException e) {
                message = e.getMessage();
            }
        }
        session.setAttribute("message", message);
        response.sendRedirect("../admin/Dashboard.jsp");
    } 
    else if(request.getParameter("save") !=null && request.getParameter("save").equals("SAVE")){
        
        int id = Integer.parseInt(request.getParameter("patientId"));
        String patientName = request.getParameter("patientName");
        int patientAge = Integer.parseInt(request.getParameter("patientAge"));
        String patientDisease = request.getParameter("patientDisease");
        String patientAddress= request.getParameter("patientAddress");
        long patientPhno = Long.parseLong(request.getParameter("patientPhno"));
        String patientEmail = request.getParameter("patientEmail");
        int doctorId=Integer.parseInt(request.getParameter("doctorId"));
        Doctor doctor = new DoctorServiceImpl().getDoctorById(doctorId);
        
        Patient patient = new Patient();
        patient.setPatientId(id);
        patient.setPatientName(patientName);
        patient.setPatientAge(patientAge);
        patient.setPatientDisease(patientDisease);
        patient.setPatientAddress(patientAddress);
        patient.setPatientPhno(patientPhno);
        patient.setPatientEmail(patientEmail);
        patient.setDoctor(doctor);

        String message = null;
        try {
        	PatientService pserv=new PatientServiceImpl();
            message = pserv.updatePatient(patient);
        } catch (PatientException e) {
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
    for (var i = 1; i < inputs.length-1; i++) {
        inputs[i].disabled = false;
    }
    row.querySelector(".update").style.display = "none";
    row.querySelector(".save").style.display = "inline";
}

function disableForm(rowId) {
    var row = document.getElementById(rowId);
    var inputs = row.querySelectorAll("input[type='text'], input[type='number'],input[type='email']");
    for (var i = 1; i < inputs.length-1; i++) {
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
.age{
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
<h2 class="heading">Patient Data</h2>
<table class="table">
    <thead class="thead-dark">
        <tr>
            <th scope="col" class="id">Id</th>
            <th scope="col" class="name">Patient Name</th>
            <th scope="col" class="age">Age</th>
            <th scope="col">Disease</th>
            <th scope="col" class="email">Email</th>
            <th scope="col" class="phno">Phone </th>
            <th scope="col">Address</th>
            <th scope="col">Doctor Id</th>
            <th scope="col">Update</th>
            <th scope="col">Delete</th>
        </tr>
    </thead>
    <tbody>
        <%
        try {
        	PatientService pserv= new PatientServiceImpl();
            List<Patient> patients = pserv.getAllPatient();
            for (Patient patient : patients) {
        %>
            <tr id="row-<%=patient.getPatientId()%>">
                <form action="../patient/ShowPatient.jsp" method="post">
                    <td>
                        <input type="number" value='<%=patient.getPatientId() %>' disabled/>
                        <input type="hidden" name="patientId" value='<%=patient.getPatientId() %>'/>
                    </td>
                    <td><input type="text" name="patientName" value='<%=patient.getPatientName() %>' disabled/></td>
                    <td><input type="text" name="patientAge" value='<%=patient.getPatientAge() %>' disabled/></td>
                    <td><input type="text" name="patientDisease" value='<%=patient.getPatientDisease() %>' disabled/></td>
                     <td><input type="email" name="patientEmail" value='<%=patient.getPatientEmail() %>' disabled/></td>
                    <td><input type="number" name="patientPhno" value='<%=patient.getPatientPhno() %>' disabled/></td>
                    <td><input type="text" name="patientAddress" value='<%=patient.getPatientAddress() %>' disabled/></td>
                     <td><input type="number" value='<%=patient.getDoctor().getDoctorId()%>' disabled/>
                     <input type="hidden" name="doctorId" value='<%=patient.getDoctor().getDoctorId()%>'/> </td>
                    <td>
                        <input type="button" class="update" id="edit-btn-row-<%=patient.getPatientId()%>" name="update" value="UPDATE" onclick="enableForm('row-<%=patient.getPatientId()%>')" />  
                        <input type="submit" class="save" id="save-btn-row-<%=patient.getPatientId()%>" name="save" value="SAVE" style="display: none;"/>
                    </td>
                    <td>
                        <input type="submit" class="delete" name="delete" value="DELETE" />
                    </td>
                </form>
            </tr>
            <%
            }
        } catch (PatientException e) {
            out.println("<p style=\"text-align:center\">" + e.getMessage() + "</p>");
        }
        %>
    </tbody>
</table>
</body>
</html>
