<%@page import="com.sonix.admindashboard.serviceImpl.AdminServiceImpl"%>
<%@page import="com.sonix.admindashboard.service.AdminService"%>
<%@page import="com.sonix.admindashboard.exception.AdminException"%>
<%@page import="com.sonix.admindashboard.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
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
%>
