<%@page import="com.sonix.admindashboard.exception.ShiftException"%>
<%@page import="com.sonix.admindashboard.entity.Shift"%>
<%@page import="com.sonix.admindashboard.serviceImpl.ShiftServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.ShiftService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Shift</title>

<script src="../../js/admin/Dashboard.js"></script>

<style>
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


/* Dark header styling */
.thead-dark th {
    color: #fff;
    background-color: #343a40;
    border-color: #454d55;
    text-align: left;
}
tr:hover{
background-color: #fff;
}

/* Scope row styling */
th[scope="row"] {
    font-weight: bold;
}
</style>
</head>
<body>

<table class="table">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Shift Id</th>
            <th scope="col">Shift Name</th>
            <th scope="col">Shift Timing</th>
        </tr>
    </thead>
    <tbody>
        <%
        try {
            ShiftService sserv=new ShiftServiceImpl();
            List<Shift> shifts=sserv.getAllShift();
            for (Shift shift : shifts) {
        %>
            <tr id="row-<%=shift.getShiftId() %>">
            <td><%=shift.getShiftId() %></td>
            <td><%=shift.getShiftName() %></td>
            <td><%=shift.getShiftTiming() %></td>
            </tr>
            <%
            }
        } catch (ShiftException e) {
            out.println("<p style=\"text-align:center\">" + e.getMessage() + "</p>");
        }
        %>
    </tbody>
</table>

</body>
</html>
