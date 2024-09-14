package com.sonix.admindashboard.service;

import java.util.List;

import com.sonix.admindashboard.entity.Admin;
import com.sonix.admindashboard.exception.AdminException;

public interface AdminService {
public String addAdmin(Admin admin);
public String updateAdmin(Admin admin);
public Admin adminLogin(String username,String password) throws Exception, AdminException;
public Admin getAdminById(int adminId) throws AdminException;
public List<Admin> getAllAdmin() throws AdminException;
public String deleteAdminById(int adminId);
}
