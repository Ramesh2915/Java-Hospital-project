<%@page import="com.sonix.admindashboard.exception.SpecializationException"%>
<%@page import="com.sonix.admindashboard.entity.Specialization"%>
<%@page import="com.sonix.admindashboard.service.SpecializationService"%>
<%@page import="com.sonix.admindashboard.serviceImpl.SpecializationServiceImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Specialization</title>
<%

if (request.getMethod().equalsIgnoreCase("POST")) {
    
    if (request.getParameter("delete") != null && request.getParameter("delete").equals("DELETE")) {
        String specializationId = request.getParameter("specializationId");
       SpecializationService sserv = new SpecializationServiceImpl();
        String message = null;
        if (specializationId != null) {
            try {
                int id = Integer.parseInt(specializationId);
                message = sserv.deleteSpecializationById(id);
            } catch (SpecializationException e) {
                message = e.getMessage();
            }
        }
        session.setAttribute("message", message);
        response.sendRedirect("../admin/Dashboard.jsp");
    } 

}
%>
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
.spec_id{
width:5%;
}
.spec_name{
width:15%;
}
.spec_delete{
width:10%;
}

</style>
</head>
<body>

<table class="table">
    <thead class="thead-dark">
        <tr>
            <th scope="col" class="spec_id">Id</th>
            <th scope="col" class="spec_name">Specialization</th>
            <th scope="col" class="spec_desc">Description</th>
            <th scope="col" class="spec_delete">Delete</th>
        </tr>
    </thead>
    <tbody>
        <%
        try {
        	SpecializationService sserv=new SpecializationServiceImpl();
        	List<Specialization> list=sserv.getAllSpecialization();
        	
            for (Specialization spec : list) {
        %>
            <tr id="row-<%=spec.getSpecializationId()%>">
                <form action="../specialization/ShowSpecialization.jsp" method="post">
                    <td>
                        <input type="number" value='<%=spec.getSpecializationId() %>' disabled/>
                        <input type="hidden" name="specializationId" value='<%=spec.getSpecializationId() %>'/>
                    </td>
                    <td><input type="text" name="specializationName" value='<%=spec.getSpecializationName() %>' disabled/></td>
                    <td><input type="text" name="specializationDescription" value='<%=spec.getSpecializationDescription() %>' disabled/></td>
  
                    <td>
                        <input type="submit" class="delete" name="delete" value="DELETE" />
                    </td>
                </form>
            </tr>
            <%
            }
        } catch (SpecializationException e) {
            out.println("<p style=\"text-align:center\">" + e.getMessage() + "</p>");
        }
        %>
    </tbody>
</table>

</body>
</html>
