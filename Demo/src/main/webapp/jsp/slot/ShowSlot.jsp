<%@page import="java.util.ArrayList"%>
<%@page import="com.sonix.admindashboard.entity.Slot"%>
<%@page import="com.sonix.admindashboard.serviceImpl.SlotServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.SlotService"%>
<%@page import="com.sonix.admindashboard.exception.SlotException"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.Math"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Slot</title>

<style>
/* General table styling */
thead {
    border-radius: 5px;
}
.table1,.table2{
width: 60%;
margin: 5px;
}

.tables{
display: flex;
flex-wrap: nowrap;
}

.table {
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

/* Pagination styling */
.pagination {
    display: flex;
    justify-content: center;
    padding: 10px;
}

.pagination a {
    margin: 0 5px;
    padding: 8px 16px;
    text-decoration: none;
    border: 1px solid #ddd;
    color: #007bff;
}

.pagination a.active {
    background-color: #007bff;
    color: white;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;
}
</style>
</head>
<body>

<%
    SlotService sserv = new SlotServiceImpl();
 

    try {
     List<Slot> slots=sserv.getAllSlot();
     List<Slot> slot1=new ArrayList<Slot>();
     List<Slot> slot2=new ArrayList<Slot>();
     for(int i=0;i<slots.size();i++){
    	 if(i<16){
    		 slot1.add(slots.get(i));
    	 }else{
    		 slot2.add(slots.get(i));
    	 }
     }
%>
<div class="tables">
<div class="table1">
<table class="table show-slot-table">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Slot Id</th>
            <th scope="col">Slot Name</th>
            <th scope="col">Slot Timing</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (Slot slot : slot1) {
        %>
        <tr id="row-<%=slot.getSlotId() %>">
            <td><%=slot.getSlotId() %></td>
            <td><%=slot.getSlotName() %></td>
            <td><%=slot.getSlotTiming() %></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
</div>
<div class="table2">
<table class="table show-slot-table">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Slot Id</th>
            <th scope="col">Slot Name</th>
            <th scope="col">Slot Timing</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (Slot slot : slot2) {
        %>
        <tr id="row-<%=slot.getSlotId() %>">
            <td><%=slot.getSlotId() %></td>
            <td><%=slot.getSlotName() %></td>
            <td><%=slot.getSlotTiming() %></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
</div>
</div>
 <%
    } catch (SlotException e) {
        out.println("<p style=\"text-align:center\">" + e.getMessage() + "</p>");
    }
    %>
</body>
</html>
