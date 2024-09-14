package com.sonix.admindashboard.service;

import java.util.List;

import com.sonix.admindashboard.entity.Doctor;
import com.sonix.admindashboard.exception.DoctorException;

public interface DoctorService {
	public String addDoctor(Doctor doctor);
	public String updateDoctor(Doctor doctor);	
	public Doctor getDoctorById(int doctorId) throws DoctorException;
	public List<Doctor> getAllDoctor() throws DoctorException;
	public String deleteDoctorById(int doctorId);
}
