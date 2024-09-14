package com.sonix.admindashboard.serviceImpl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

import com.sonix.admindashboard.entity.Appointment;
import com.sonix.admindashboard.exception.AppointmentException;
import com.sonix.admindashboard.repo.DBHandler;
import com.sonix.admindashboard.service.AppointmentService;

public class AppointmentServiceImpl implements AppointmentService {
	private Session session;
	Transaction transaction;

	@Override
	public String addAppointment(Appointment appointment) {

		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			String sql = "from Appointment where patient_email= :patient_email or patient_phno= :patient_phno";
			Query query = session.createQuery(sql);
			query.setParameter("patient_email", appointment.getPatientEmail());
			query.setParameter("patient_phno", appointment.getPatientPhno());
			Appointment appointmentFind = (Appointment)query.uniqueResult();
			
			if (appointmentFind != null) {
				return "Appointment already Booked!";
			}
			Date date= Date.valueOf(LocalDate.now());
			appointment.setRegisteredDate(date);
			session.save(appointment);
			transaction.commit();
			return "Appointment Booked";
		} catch (ConstraintViolationException e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Appointment already exists or violates constraints";
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in adding Appointment";
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public String updateAppointment(Appointment appointment) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();

			// Fetch existing Appointment
			Appointment existingAppointment = (Appointment) session.get(Appointment.class,
					appointment.getAppointmentId());
			if (existingAppointment != null) {
				// Update fields
				existingAppointment.setDoctor(appointment.getDoctor());
				existingAppointment.setPatientName(appointment.getPatientName());
				existingAppointment.setPatientEmail(appointment.getPatientEmail());
				existingAppointment.setPatientPhno(appointment.getPatientPhno());
				existingAppointment.setRegisteredDate(appointment.getRegisteredDate());
				existingAppointment.setAppointmentDate(appointment.getAppointmentDate());
				existingAppointment.setSlot(appointment.getSlot());

				// Save changes
				session.update(existingAppointment);
				transaction.commit();
				return "Appointment updated successfully";
			} else {
				return "Appointment not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in updating Appointment";
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public Appointment getAppointmentById(int appointmentId) throws AppointmentException {
			session = DBHandler.getSession();
			Query query = session.getNamedQuery("getAppointmentById");
			query.setParameter("appointment_id", appointmentId);
			Appointment appointment = (Appointment) query.uniqueResult();
			if(appointment==null) {
				throw new AppointmentException("Appointment not found");
			}
			session.close();
			return appointment;
	}

	@Override
	public List<Appointment> getAllAppointment() throws AppointmentException {
			session = DBHandler.getSession();
			Query query = session.getNamedQuery("getAllAppointment");
			@SuppressWarnings("unchecked")
			List<Appointment> appointment = query.list();
			if(appointment==null) {
				throw new AppointmentException("Appointment table is empty");
			}
			session.close();
			return appointment;
	}

	@Override
	public String deleteAppointmentById(int appointmentId) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			Appointment appointment = (Appointment) session.get(Appointment.class, appointmentId);
			if (appointment != null) {
				session.delete(appointment);
				transaction.commit();
				return "Appointment deleted successfully";
			} else {
				return "Appointment not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in deleting Appointment";
		} finally {
			if (session != null)
				session.close();
		}
	}

}
