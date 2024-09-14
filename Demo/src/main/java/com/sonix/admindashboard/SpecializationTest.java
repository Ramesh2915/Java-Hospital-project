package com.sonix.admindashboard;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.sonix.admindashboard.entity.Specialization;
import com.sonix.admindashboard.repo.DBHandler;

public class SpecializationTest {

	public static void main(String[] args) {
		Session session = DBHandler.getSession();
		Transaction transaction = session.beginTransaction();
		Specialization spec1 = new Specialization();
		spec1.setSpecializationName("Cardiology");
		spec1.setSpecializationDescription("Focuses on the diagnosis and treatment of heart diseases and conditions, including congenital heart defects, coronary artery disease, and heart failure");
		session.save(spec1);
		
		Specialization spec2 = new Specialization();
		spec2.setSpecializationName("Dermatology");
		spec2.setSpecializationDescription("Specializes in the diagnosis and treatment of skin disorders, including acne, eczema, psoriasis, and skin cancer.");
		session.save(spec2);
		
		Specialization spec3 = new Specialization();
		spec3.setSpecializationName("ENT");
		spec3.setSpecializationDescription("eye,nose,tongue");
		session.save(spec3);
		transaction.commit();
		
	
		
	

	}

}
