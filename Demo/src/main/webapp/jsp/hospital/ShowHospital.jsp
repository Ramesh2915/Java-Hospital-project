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
<title>Show Hospital</title>
<%

if (request.getMethod().equalsIgnoreCase("POST")) {
    
    if (request.getParameter("delete") != null && request.getParameter("delete").equals("DELETE")) {
        String hospitalId = request.getParameter("hospitalId");
        HospitalServcie hospitalService = new HospitalServiceImpl();
        String message = null;
        if (hospitalId != null) {
            try {
                int id = Integer.parseInt(hospitalId);
                message = hospitalService.deleteHospitalById(id);
            } catch (HospitalException e) {
                message = e.getMessage();
            }
        }
        session.setAttribute("message", message);
        response.sendRedirect("../admin/Dashboard.jsp");
    } 
    else if(request.getParameter("save") !=null && request.getParameter("save").equals("SAVE")){
        
        int id = Integer.parseInt(request.getParameter("hospitalId"));
        
        String hospitalName = request.getParameter("hospitalName");
        String hospitalCity = request.getParameter("hospitalCity");
        String hospitalAddress = request.getParameter("hospitalAddress");
        int hospitalPincode= Integer.parseInt(request.getParameter("hospitalPincode"));
        long hospitalPhno = Long.parseLong(request.getParameter("hospitalPhno"));
        String hospitalEmail = request.getParameter("hospitalEmail");
        int adminId=Integer.parseInt(request.getParameter("adminId"));
        
        Admin admin=new AdminServiceImpl().getAdminById(adminId);
        
        Hospital hospital = new Hospital();
        hospital.setHospitalId(id);
        hospital.setHospitalname(hospitalName);
        hospital.setHospitalCity(hospitalCity);
        hospital.setHospitalAddress(hospitalAddress);
        hospital.setHospitalPincode(hospitalPincode);
        hospital.setHospitalPhno(hospitalPhno);
        hospital.setHospitalEmail(hospitalEmail);
        hospital.setAdmin(admin);

        String message = null;
        try {
            HospitalServcie hospitalService = new HospitalServiceImpl();
            message = hospitalService.updateHospital(hospital);
        } catch (HospitalException e) {
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
<h2 class="heading">Hospital Data</h2>
<table class="table">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Hospital Id</th>
            <th scope="col">Hospital Name</th>
            <th scope="col">Hospital City</th>
            <th scope="col">Hospital Address</th>
            <th scope="col">Hospital Pincode</th>
            <th scope="col">Hospital Phno</th>
            <th scope="col">Hospital Email</th>
            <th scope="col">Admin Id</th>
            <th scope="col">Update</th>
            <th scope="col">Delete</th>
        </tr>
    </thead>
    <tbody>
        <%
        try {
            HospitalServcie hserv = new HospitalServiceImpl();
            List<Hospital> hospitals = hserv.getAllHospital();
            for (Hospital hospital : hospitals) {
        %>
            <tr id="row-<%=hospital.getHospitalId()%>">
                <form action="../hospital/ShowHospital.jsp" method="post">
                    <td>
                        <input type="number" value='<%=hospital.getHospitalId() %>' disabled/>
                        <input type="hidden" name="hospitalId" value='<%=hospital.getHospitalId() %>'/>
                    </td>
                    <td><input type="text" name="hospitalName" value='<%=hospital.getHospitalname() %>' disabled/></td>
                    <td><input type="text" name="hospitalCity" value='<%=hospital.getHospitalCity() %>' disabled/></td>
                    <td><input type="text" name="hospitalAddress" value='<%=hospital.getHospitalAddress() %>' disabled/></td>
                    <td><input type="number" name="hospitalPincode" value='<%=hospital.getHospitalPincode() %>' disabled/></td>
                    <td><input type="number" name="hospitalPhno" value='<%=hospital.getHospitalPhno() %>' disabled/></td>
                    <td><input type="email" name="hospitalEmail" value='<%=hospital.getHospitalEmail()%>' disabled/></td>
                     <td><input type="number"  value='<%=hospital.getAdmin().getAdminId()%>' disabled/>
                     <input type="hidden" name="adminId" value='<%=hospital.getAdmin().getAdminId() %>'/></td>
                    <td>
                        <input type="button" class="update" id="edit-btn-row-<%=hospital.getHospitalId()%>" name="update" value="UPDATE" onclick="enableForm('row-<%=hospital.getHospitalId()%>')" />  
                        <input type="submit" class="save" id="save-btn-row-<%=hospital.getHospitalId()%>" name="save" value="SAVE" style="display: none;"/>
                    </td>
                    <td>
                        <input type="submit" class="delete" name="delete" value="DELETE" />
                    </td>
                </form>
            </tr>
            <%
            }
        } catch (HospitalException e) {
            out.println("<p style=\"text-align:center\">" + e.getMessage() + "</p>");
        }
        %>
    </tbody>
</table>

</body>
</html>
