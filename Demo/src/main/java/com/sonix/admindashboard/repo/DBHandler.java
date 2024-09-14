package com.sonix.admindashboard.repo;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class DBHandler {
	@SuppressWarnings("deprecation")
	public static Session getSession() {
		SessionFactory sessionFactory= new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		return session;
	}
}