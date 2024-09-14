package com.sonix.admindashboard.serviceImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;

import com.sonix.admindashboard.entity.Specialization;
import com.sonix.admindashboard.exception.SpecializationException;
import com.sonix.admindashboard.repo.DBHandler;
import com.sonix.admindashboard.service.SpecializationService;

public class SpecializationServiceImpl implements SpecializationService {
	private Session session;
	Transaction transaction;

	@Override
	public String addSpecialization(Specialization specialization) {

		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			session.save(specialization);
			transaction.commit();
			return "Specialization added";
		} catch (ConstraintViolationException e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Specialization already exists or violates constraints";
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in adding specialization";
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public String updateSpecialization(Specialization specialization) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();

			// Fetch existing specialization
			Specialization existingSpecialization = (Specialization) session.get(Specialization.class,
					specialization.getSpecializationId());
			if (existingSpecialization != null) {
				// Update fields
				existingSpecialization.setSpecializationName(specialization.getSpecializationName());
				existingSpecialization.setSpecializationDescription(specialization.getSpecializationDescription());

				// Save changes
				session.update(existingSpecialization);
				transaction.commit();
				return "Specialization updated successfully";
			} else {
				return "Specialization not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in updating specialization";
		} finally {
			if (session != null)
				session.close();
		}
	}

	@Override
	public Specialization getSpecializationById(int specializationId) throws SpecializationException{
			session = DBHandler.getSession();
			Query query = session.getNamedQuery("getSpecializationById");
			query.setParameter("specialization_id", specializationId);
			Specialization specialization = (Specialization) query.uniqueResult();
			if(specialization==null) {
				throw new SpecializationException("Specialization not found");
			}
			session.close();
			return specialization;
	}

	@Override
	public List<Specialization> getAllSpecialization() throws SpecializationException{
			session = DBHandler.getSession();
			Query query = session.getNamedQuery("getAllSpecialization");
			@SuppressWarnings("unchecked")
			List<Specialization> specialization = query.list();
			if(specialization==null) {
				throw new SpecializationException("Specialization not found");
			}
			session.close();
			return specialization;
	}

	@Override
	public String deleteSpecializationById(int specializationId) {
		try {
			session = DBHandler.getSession();
			transaction = session.beginTransaction();
			Specialization specialization = (Specialization) session.get(Specialization.class, specializationId);
			if (specialization != null) {
				session.delete(specialization);
				transaction.commit();
				return "Specialization deleted successfully";
			} else {
				return "Specialization not found";
			}
		} catch (Exception e) {
			if (transaction != null)
				transaction.rollback();
			e.printStackTrace();
			return "Error in deleting specialization";
		} finally {
			if (session != null)
				session.close();
		}
	}

}
