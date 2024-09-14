
package com.sonix.admindashboard.serviceImpl;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

import com.sonix.admindashboard.entity.Admin;
import com.sonix.admindashboard.exception.AdminException;
import com.sonix.admindashboard.repo.DBHandler;
import com.sonix.admindashboard.service.AdminService;
import com.sonix.admindashboard.util.PasswordEncryptor;

public class AdminServiceImpl implements AdminService {
	private Session session;
	Transaction transaction;

	@Override
	public String addAdmin(Admin admin) {

		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			String sql = "from Admin where admin_name= :admin_name or admin_email= :admin_email or admin_phno= :admin_phno";
			Query query = session.createQuery(sql);
			query.setParameter("admin_name", admin.getAdminName());
			query.setParameter("admin_email", admin.getAdminEmail());
			query.setParameter("admin_phno", admin.getAdminPhno());
			Admin adminFind = (Admin) query.uniqueResult();

			if (adminFind != null) {
				return "Admin already exists";
			}
			String salt = PasswordEncryptor.generateSalt();
			String hashedPassword=null;
			try {
				hashedPassword = PasswordEncryptor.hashPassword(admin.getAdminPassword(), salt);
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
				e.printStackTrace();
			}
			admin.setAdminPassword(hashedPassword);
			admin.setSalt(salt);
			session.save(admin);
			transaction.commit();
			return "Admin added successfully";
		} catch (ConstraintViolationException e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Admin already exists or violates constraints";
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in adding Admin";
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public String updateAdmin(Admin admin) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();

			// Fetch existing Admin
			Admin existingAdmin = (Admin) session.get(Admin.class, admin.getAdminId());
			if (existingAdmin != null) {
				// Update fields
				existingAdmin.setAdminName(admin.getAdminName());
				existingAdmin.setAdminEmail(admin.getAdminEmail());
				existingAdmin.setAdminPhno(admin.getAdminPhno());

				// Save changes
				session.update(existingAdmin);
				transaction.commit();
				return "Admin updated successfully";
			} else {
				return "Admin not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in updating Admin";
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public Admin adminLogin(String username, String password) throws Exception, AdminException {
		session = DBHandler.getSession();
		String sql="from Admin where admin_username=:admin_username";
		Query query = session.createQuery(sql);
		query.setParameter("admin_username", username);
		Admin admin =(Admin)query.uniqueResult();
		if(admin!=null) {
		String salt=admin.getSalt();
		String hashPassword = PasswordEncryptor.hashPassword(password, salt);
		
			if(hashPassword.equals(admin.getAdminPassword())) {
				session.close();
				return admin;
			}
			else {
				throw new AdminException("Invalid Password");
			}
		}else {
			throw new AdminException("Invalid Username");
		}
	}

	@Override
	public List<Admin> getAllAdmin() throws AdminException {
		session = DBHandler.getSession();
		Query query = session.getNamedQuery("getAllAdmin");
		@SuppressWarnings("unchecked")
		List<Admin> admin = query.list();
		if (admin == null) {
			throw new AdminException("Admin table is empty");
		}
		session.close();
		return admin;

	}
	@Override
	public Admin getAdminById(int adminId) throws AdminException {
		session = DBHandler.getSession();
		Query query = session.getNamedQuery("getAdminById");
		query.setParameter("admin_id", adminId);
		@SuppressWarnings("unchecked")
		Admin admin = (Admin)query.uniqueResult();
		if (admin == null) {
			throw new AdminException("Admin not found");
		}
		session.close();
		return admin;

	}

	@Override
	public String deleteAdminById(int adminId) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			Admin admin = (Admin) session.get(Admin.class, adminId);
			if (admin != null) {
				session.delete(admin);
				transaction.commit();
				return "Admin deleted successfully";
			} else {
				return "Admin not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in deleting Admin";
		} finally {
			if (session != null)
				session.close();
		}
	}
}
