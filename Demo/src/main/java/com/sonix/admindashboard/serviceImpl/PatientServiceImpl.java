package com.sonix.admindashboard.serviceImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

import com.sonix.admindashboard.entity.Patient;
import com.sonix.admindashboard.exception.PatientException;
import com.sonix.admindashboard.repo.DBHandler;
import com.sonix.admindashboard.service.PatientService;

public class PatientServiceImpl implements PatientService {
	private Session session;
	Transaction transaction;

	@Override
	public String addPatient(Patient patient) {

		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			String sql = "from Patient where patient_email= :patient_email or patient_phno= :patient_phno";
			Query query = session.createQuery(sql);
			query.setParameter("patient_email", patient.getPatientEmail());
			query.setParameter("patient_phno", patient.getPatientPhno());
			Patient patientFind = (Patient)query.uniqueResult();
			
			if (patientFind != null) {
				return "Patient already exists";
			}
			session.save(patient);
			transaction.commit();
			return "Patient added";
		} catch (ConstraintViolationException e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Patient already exists or violates constraints";
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in adding patient";
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public String updatePatient(Patient patient) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();

			// Fetch existing patient
			Patient existingPatient = (Patient) session.get(Patient.class, patient.getPatientId());
			if (existingPatient != null) {
				// Update fields
				existingPatient.setPatientAge(patient.getPatientAge());
				existingPatient.setPatientName(patient.getPatientName());
				existingPatient.setPatientDisease(patient.getPatientDisease());
				existingPatient.setPatientPhno(patient.getPatientPhno());
				existingPatient.setPatientEmail(patient.getPatientEmail());
				existingPatient.setPatientAddress(patient.getPatientAddress());

				// Save changes
				session.update(existingPatient);
				transaction.commit();
				return "Patient updated successfully";
			} else {
				return "Patient not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in updating patient";
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public Patient getPatientById(int id) throws PatientException {
			session = DBHandler.getSession();
			Query query = session.getNamedQuery("getPatientById");
			query.setParameter("patient_id", id);
			Patient patient = (Patient) query.uniqueResult();
			if(patient==null) {
				throw new PatientException("Patient not found");
			}
			session.close();
			return patient;
	}

	@Override
	public List<Patient> getAllPatient() throws PatientException {
			session = DBHandler.getSession();
			Query query = session.getNamedQuery("getAllPatient");
			@SuppressWarnings("unchecked")
			List<Patient> patients = query.list();
			if(patients==null) {
				throw new PatientException("Patient not found");
			}
			session.close();
			return patients;
	}

	@Override
	public String deletePatientById(int id) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			Patient patient = (Patient) session.get(Patient.class, id);
			if (patient != null) {
				session.delete(patient);
				transaction.commit();
				return "Patient deleted successfully";
			} else {
				return "Patient not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in deleting patient";
		} finally {
			if (session != null)
				session.close();
		}
	}
}