package com.sonix.admindashboard.serviceImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

import com.sonix.admindashboard.entity.Doctor;
import com.sonix.admindashboard.exception.DoctorException;
import com.sonix.admindashboard.repo.DBHandler;
import com.sonix.admindashboard.service.DoctorService;

public class DoctorServiceImpl implements DoctorService {

	private Session session;
	Transaction transaction;

	@Override
	public String addDoctor(Doctor doctor) {

		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			String sql = "from Doctor where doctor_name= :doctor_name or doctor_email= :doctor_email or doctor_phno= :doctor_phno";
			Query query = session.createQuery(sql);
			query.setParameter("doctor_name", doctor.getDoctorName());
			query.setParameter("doctor_email", doctor.getDoctorEmail());
			query.setParameter("doctor_phno", doctor.getDoctorPhno());
			Doctor doctorFind = (Doctor)query.uniqueResult();
			
			if (doctorFind != null) {
				return "Doctor already exists with same name or email or phone";
			}
		
			session.save(doctor);
			transaction.commit();
			return "Doctor added";
		} catch (ConstraintViolationException e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Doctor already exists or violates constraints";
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
	public String updateDoctor(Doctor doctor) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();

			// Fetch existing doctor
			Doctor existingdoctor = (Doctor) session.get(Doctor.class, doctor.getDoctorId());
			if (existingdoctor != null) {
				// Update fields
				existingdoctor.setDoctorName(doctor.getDoctorName());
				existingdoctor.setDoctorGender(doctor.getDoctorGender());
				existingdoctor.setDoctorQualification(doctor.getDoctorQualification());
				existingdoctor.setDoctorExperience(doctor.getDoctorExperience());
				existingdoctor.setDoctorPhno(doctor.getDoctorPhno());
				existingdoctor.setDoctorEmail(doctor.getDoctorEmail());
				existingdoctor.setHospital(doctor.getHospital());
				existingdoctor.setSpecialization(doctor.getSpecialization());

				// Save changes
				session.update(existingdoctor);
				transaction.commit();
				return "Doctor updated successfully";
			} else {
				return "Doctor not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in updating Doctor";
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public Doctor getDoctorById(int doctorId) throws DoctorException{
			session = DBHandler.getSession();
			Query query = session.getNamedQuery("getDoctorById");
			query.setParameter("doctor_id", doctorId);
			Doctor doctor = (Doctor) query.uniqueResult();
			if(doctor==null) {
				throw new DoctorException("Doctor not found");
			}
			session.close();
			return doctor;
	}

	@Override
	public List<Doctor> getAllDoctor() throws DoctorException {
			session = DBHandler.getSession();
			Query query = session.getNamedQuery("getAllDoctor");
			@SuppressWarnings("unchecked")
			List<Doctor> doctor = query.list();
			if(doctor==null) {
				throw new DoctorException("Doctor table is empty");
			}
			session.close();
			return doctor;
	}

	@Override
	public String deleteDoctorById(int doctorId) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			Doctor doctor = (Doctor) session.get(Doctor.class, doctorId);
			if (doctor != null) {
				session.delete(doctor);
				transaction.commit();
				return "Doctor deleted successfully";
			} else {
				return "Doctor not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in deleting Doctor";
		} finally {
			if (session != null)
				session.close();
		}
	}
}
