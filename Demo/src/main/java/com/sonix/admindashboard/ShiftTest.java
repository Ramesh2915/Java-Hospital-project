package com.sonix.admindashboard;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.sonix.admindashboard.entity.Shift;
import com.sonix.admindashboard.repo.DBHandler;

public class ShiftTest {

	public static void main(String[] args) {
		Session session = DBHandler.getSession();
		Transaction transaction = session.beginTransaction();
		Shift s1=new Shift();
		s1.setShiftName(com.sonix.admindashboard.util.Shift.MORNING);
		s1.setShiftTiming(com.sonix.admindashboard.util.Shift.MORNING.getTiming());
		session.save(s1);
		
		Shift s2=new Shift();
		s2.setShiftName(com.sonix.admindashboard.util.Shift.AFTERNOON);
		s2.setShiftTiming(com.sonix.admindashboard.util.Shift.AFTERNOON.getTiming());
		session.save(s2);
		
		Shift s3=new Shift();
		s3.setShiftName(com.sonix.admindashboard.util.Shift.EVENING);
		s3.setShiftTiming(com.sonix.admindashboard.util.Shift.EVENING.getTiming());
		session.save(s3);
		
		Shift s4=new Shift();
		s4.setShiftName(com.sonix.admindashboard.util.Shift.NIGHT);
		s4.setShiftTiming(com.sonix.admindashboard.util.Shift.NIGHT.getTiming());
		session.save(s4);
		
		Shift s5=new Shift();
		s5.setShiftName(com.sonix.admindashboard.util.Shift.GENERAL);
		s5.setShiftTiming(com.sonix.admindashboard.util.Shift.GENERAL.getTiming());
		session.save(s5);
		
		transaction.commit();

	}

}
