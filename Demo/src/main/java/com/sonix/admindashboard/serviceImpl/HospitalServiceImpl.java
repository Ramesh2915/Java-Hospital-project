package com.sonix.admindashboard.serviceImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

import com.sonix.admindashboard.entity.Hospital;
import com.sonix.admindashboard.exception.HospitalException;
import com.sonix.admindashboard.repo.DBHandler;
import com.sonix.admindashboard.service.HospitalServcie;

public class HospitalServiceImpl implements HospitalServcie {

	private Session session;
	Transaction transaction;

	@Override
	public String addHospital(Hospital hospital) {

		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			String sql = "from Hospital where hospital_email= :hospital_email or hospital_phno= :hospital_phno";
			Query query = session.createQuery(sql);
			query.setParameter("hospital_email", hospital.getHospitalEmail());
			query.setParameter("hospital_phno", hospital.getHospitalPhno());
			Hospital hospitalFind = (Hospital)query.uniqueResult();
			
			if (hospitalFind != null) {
				return "Hospital already exists";
			}
			session.save(hospital);
			transaction.commit();
			return "Hospital added";
		} catch (ConstraintViolationException e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Hospital already exists or violates constraints";
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in adding Doctor";
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public String updateHospital(Hospital hospital) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();

			// Fetch existing hospital
			Hospital existingHospital = (Hospital) session.get(Hospital.class, hospital.getHospitalId());
			if (existingHospital != null) {
				// Update fields
				existingHospital.setHospitalname(hospital.getHospitalname());
				existingHospital.setHospitalCity(hospital.getHospitalCity());
				existingHospital.setHospitalAddress(hospital.getHospitalAddress());
				existingHospital.setHospitalPincode(hospital.getHospitalPincode());
				existingHospital.setHospitalPhno(hospital.getHospitalPhno());
				existingHospital.setHospitalEmail(hospital.getHospitalEmail());
				existingHospital.setAdmin(hospital.getAdmin());
				// Save changes
				session.update(existingHospital);
				transaction.commit();
				return "Hospital updated successfully";
			} else {
				return "Hospital not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in updating Hospital";
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public Hospital getHospitalById(int hospitalId) throws HospitalException{
			session = DBHandler.getSession();
			Query query = session.getNamedQuery("getHospitalById");
			query.setParameter("hospital_id", hospitalId);
			Hospital hospital = (Hospital) query.uniqueResult();
			if(hospital==null) {
				throw new HospitalException("Hospital not found");	
			}
			session.close();
			return hospital;
	}

	@Override
	public List<Hospital> getAllHospital() throws HospitalException {
			session = DBHandler.getSession();
			Query query = session.getNamedQuery("getAllHospital");
			@SuppressWarnings("unchecked")
			List<Hospital> hospital = query.list();
			if(hospital==null) {
				throw new HospitalException("Hospital not found");	
			}
			session.close();
			return hospital;
	}

	@Override
	public String deleteHospitalById(int hospitalId) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			Hospital hospital = (Hospital) session.get(Hospital.class, hospitalId);
			if (hospital != null) {
				session.delete(hospital);
				transaction.commit();
				return "Hospital deleted successfully";
			} else {
				return "Hospital not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in deleting Hospital";
		} finally {
			if (session != null)
				session.close();
		}
	}
}
