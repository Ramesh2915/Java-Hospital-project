<%@page import="com.sonix.admindashboard.serviceImpl.AdminServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.AdminService"%>
<%@page import="java.util.List"%>
<%@page import="com.sonix.admindashboard.exception.AdminException"%>
<%@page import="com.sonix.admindashboard.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Admin</title>
<%
if (request.getMethod().equalsIgnoreCase("POST")) {
    
    if (request.getParameter("delete") != null && request.getParameter("delete").equals("DELETE")) {
        String adminId = request.getParameter("adminId");
        AdminService adminService = new AdminServiceImpl();
        String message = null;
        if (adminId != null) {
            try {
                int id = Integer.parseInt(adminId);
                message = adminService.deleteAdminById(id);
            } catch (AdminException e) {
                message = e.getMessage();
            }
        }
        session.setAttribute("message", message);
        response.sendRedirect("Dashboard.jsp");
    } 
    else if(request.getParameter("save") !=null && request.getParameter("save").equals("SAVE")){
        
        int id = Integer.parseInt(request.getParameter("adminId"));
        String name = request.getParameter("adminName");
        long phno = Long.parseLong(request.getParameter("adminPhno"));
        String email = request.getParameter("adminEmail");
        Admin admin = new Admin();
        admin.setAdminId(id);
        admin.setAdminName(name);
        admin.setAdminPhno(phno);
        admin.setAdminEmail(email);

        String message = null;
        try {
            AdminService adminService1 = new AdminServiceImpl();
            message = adminService1.updateAdmin(admin);
        } catch (AdminException e) {
            message = e.getMessage();
        }
        session.setAttribute("message", message);
        response.sendRedirect("Dashboard.jsp");
    }
}
%>
<script src="../../js/admin/Dashboard.js"></script>
<script>
function enableForm(rowId) {
	   var row = document.getElementById(rowId);
	    var inputs = row.querySelectorAll("input[type='text'],input[type='number'], input[type='email']");
	    for (var i = 1; i < inputs.length; i++) {
	        inputs[i].disabled = false;
	    }
	    row.querySelector(".update").style.display = "none";
	    row.querySelector(".save").style.display = "inline";
}

function disableForm(rowId) {
    var row = document.getElementById(rowId);
    var inputs = row.querySelectorAll("input[type='text'],input[type='number'], input[type='email']");
    for (var i = 1; i < inputs.length; i++) {
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
thead{
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


input[type=submit],input[type=button] {
  border-radius: 4px;
  cursor: pointer;
}

.update {
  background-color: #FFD700;
}
 .save{
  background-color: #45a049;
}
 .delete{
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
      <th scope="col">Admin Id</th>
      <th scope="col">Admin Name</th>
      <th scope="col">Admin Phno</th>
      <th scope="col">Admin Email</th>
      <th scope="col">Update</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
  <tbody>
      <%
      try {
          AdminService aserv = new AdminServiceImpl();
          List<Admin> admins = aserv.getAllAdmin();
          for (Admin admin : admins) {
      %>
          <tr id="row-<%=admin.getAdminId()%>">
              <form action="ShowAdmin.jsp" method="post">
              <td>
                <input type="number" value='<%=admin.getAdminId() %>' disabled/>
                <input type="hidden" name="adminId" value='<%=admin.getAdminId() %>'/>
              </td>
              <td><input type="text" name="adminName" value='<%=admin.getAdminName() %>' disabled/></td>
              <td><input type="number" name="adminPhno" value='<%=admin.getAdminPhno() %>' disabled/></td>
              <td><input type="email" name="adminEmail" value='<%=admin.getAdminEmail() %>' disabled/></td>
              <td>
                  <input type="button" class="update" id="edit-btn-row-<%=admin.getAdminId()%>" name="update" value="UPDATE" onclick="enableForm('row-<%=admin.getAdminId()%>')" />  
                  <input type="submit" class="save" id="save-btn-row-<%=admin.getAdminId()%>" name="save" value="SAVE" style="display: none;"/>
              </td>
               <td>
                  <input type="submit" class="delete" name="delete" value="DELETE" />
              </td>
              </form>
          </tr>
      <%
          }
      } catch (AdminException e) {
          out.println("<p style=\"text-align:center\">" + e.getMessage() + "</p>");
      }
      %>
  </tbody>
</table>
</body>
</html>
