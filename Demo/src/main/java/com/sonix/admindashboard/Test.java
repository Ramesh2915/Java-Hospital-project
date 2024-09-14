package com.sonix.admindashboard;

import com.sonix.admindashboard.entity.Admin;
import com.sonix.admindashboard.serviceImpl.AdminServiceImpl;

public class Test {
public static void main(String[] args) {
//	Session session = DBHandler.getSession();
//	Transaction transaction = session.beginTransaction();
//	System.out.println("hi");
//	transaction.commit();
	Admin ad=new Admin();
	ad.setAdminName("jon");
	ad.setAdminPhno(8545854587l);
	ad.setAdminEmail("jon@gmail.com");
	ad.setAdminUsername("jon");
	ad.setAdminPassword("jon");
	System.out.println(new AdminServiceImpl().addAdmin(ad));





}
}
