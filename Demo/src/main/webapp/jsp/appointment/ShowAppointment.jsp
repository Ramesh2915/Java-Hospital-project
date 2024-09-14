<%@page import="com.sonix.admindashboard.serviceImpl.DoctorServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.HospitalServcie"%>
<%@page import="com.sonix.admindashboard.serviceImpl.HospitalServiceImpl"%>
<%@page import="com.sonix.admindashboard.serviceImpl.SlotServiceImpl"%>
<%@page import="com.sonix.admindashboard.entity.Slot"%>
<%@page import="java.sql.Date"%>
<%@page import="com.sonix.admindashboard.exception.AppointmentException"%>
<%@page import="com.sonix.admindashboard.entity.Appointment"%>
<%@page
	import="com.sonix.admindashboard.serviceImpl.AppointmentServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.AppointmentService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Appointment</title>
<%
if (request.getMethod().equalsIgnoreCase("POST")) {
    
    if (request.getParameter("delete") != null && request.getParameter("delete").equals("DELETE")) {
        String appointmentId = request.getParameter("appointmentId");
        AppointmentService aserv=new AppointmentServiceImpl();
        String message = null;
        if (aserv != null) {
            try {
                int id = Integer.parseInt(appointmentId);
                message = aserv.deleteAppointmentById(id);
            } catch (AppointmentException e) {
                message = e.getMessage();
            }
        }
        session.setAttribute("message", message);
        response.sendRedirect("../admin/Dashboard.jsp");
    } 
    else if(request.getParameter("save") !=null && request.getParameter("save").equals("SAVE")){
        
        int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        String patientName = request.getParameter("patientName");
        String phno = request.getParameter("patientPhno");
        String email = request.getParameter("patientEmail");
        String rDate =  request.getParameter("registeredDate");
        String aDate =  request.getParameter("appointmentDate");
        Date registeredDate = Date.valueOf(rDate);
        Date appointmentDate = Date.valueOf(aDate);
        int hospitalId =  Integer.parseInt(request.getParameter("hospitalId"));
        int doctorId = Integer.parseInt(request.getParameter("doctorId"));
        int slotId = Integer.parseInt(request.getParameter("selectedSlotId"));
        
        Appointment appointment=new Appointment();
        appointment.setAppointmentId(appointmentId);
        appointment.setPatientName(patientName);
        appointment.setPatientPhno(phno);
        appointment.setPatientEmail(email);
        appointment.setRegisteredDate(registeredDate);
        appointment.setAppointmentDate(appointmentDate);
        appointment.setHospital(new HospitalServiceImpl().getHospitalById(hospitalId));
        appointment.setDoctor(new DoctorServiceImpl().getDoctorById(doctorId));
        appointment.setSlot(new SlotServiceImpl().getSlotById(slotId));
        
        String message = null;
        try {
        	 AppointmentService aserv=new AppointmentServiceImpl();
            message = aserv.updateAppointment(appointment);
        } catch (AppointmentException e) {
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
    var inputs = row.querySelectorAll("input[type='text'], input[type='number'], input[type='email'], input[type='date'], select");
    for (var i = 1; i < inputs.length-2; i++) {
        inputs[i].disabled = false;
    }
    row.querySelector(".update").style.display = "none";
    row.querySelector(".save").style.display = "inline";
}

function disableForm(rowId) {
    var row = document.getElementById(rowId);
    var inputs = row.querySelectorAll("input[type='text'], input[type='number'], input[type='email'], input[type='date'], select");
    for (var i = 1; i < inputs.length-2; i++) {
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
thead {
	border-radius: 5px;
}

.table {
	width: 100%;
	margin-bottom: 1rem;
	color: #212529;
	border-collapse: collapse;
	margin-top: 30px;
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
	box-shadow: 0 0 0 0.25rem rgb(13 110 253/ 25%);
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

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Appointment Id</th>
				<th scope="col">Patient Name</th>
				<th scope="col">Phone</th>
				<th scope="col">Email</th>
				<th scope="col">Applied On</th>
				<th scope="col">Appointment Date</th>
				<th scope="col">Slot</th>
				<th scope="col">Hospital</th>
				<th scope="col">Doctor</th>
				<th scope="col">Update</th>
				<th scope="col">Delete</th>
			</tr>
		</thead>
		<tbody>
			<%
      try {
    	   AppointmentService aserv = new AppointmentServiceImpl();
          List<Appointment> appointments = aserv.getAllAppointment();
          for (Appointment appointment : appointments) {
      %>
			<tr id="row-<%=appointment.getAppointmentId()%>">
				<form action="ShowAppointment.jsp" method="post">
					<td><input type="number"
						value='<%=appointment.getAppointmentId() %>' disabled /> <input
						type="hidden" name="appointmentId"
						value='<%=appointment.getAppointmentId() %>' /></td>
					<td><input type="text" name="patientName"
						value='<%=appointment.getPatientName() %>' disabled /></td>
					<td><input type="number" name="patientPhno"
						value='<%=appointment.getPatientPhno() %>' disabled /></td>
					<td><input type="email" name="patientEmail"
						value='<%=appointment.getPatientEmail() %>' disabled /></td>
					<td><input type="date" name="registeredDate"
						value='<%=appointment.getRegisteredDate() %>' disabled></td>
					<td><input type="date" name="appointmentDate"
						value='<%=appointment.getAppointmentDate() %>' disabled></td>

				<td>  
				<select name="selectedSlotId" disabled>
                <% List<Slot> sList=new SlotServiceImpl().getAllSlot();
                		for(Slot slot:sList){
                			%>
                			  <option  id="slotId" value="<%=slot.getSlotId()%>" ><%=slot.getSlotId()%></option>
                			<%
                		}
                		%>
                </select>
				</td>
					<td><input type="number"
						value='<%=appointment.getHospital().getHospitalId() %>' disabled>
						<input type="hidden" name="hospitalId"
						value='<%=appointment.getHospital().getHospitalId() %>'>
						</td>
					<td><input type="number"
						value='<%=appointment.getDoctor().getDoctorId() %>' disabled>
						<input type="hidden" name="doctorId"
						value='<%=appointment.getDoctor().getDoctorId() %>'>
						</td>

					<td><input type="button" class="update"
						id="edit-btn-row-<%=appointment.getAppointmentId()%>"
						name="update" value="UPDATE"
						onclick="enableForm('row-<%=appointment.getAppointmentId()%>')" />
						<input type="submit" class="save"
						id="save-btn-row-<%=appointment.getAppointmentId()%>" name="save"
						value="SAVE" style="display: none;" /></td>
					<td><input type="submit" class="delete" name="delete"
						value="DELETE" /></td>
				</form>
			</tr>
			<%
          }
      } catch (AppointmentException e) {
          out.println("<p style=\"text-align:center\">" + e.getMessage() + "</p>");
      }
      %>
		</tbody>
	</table>
</body>
</html>
