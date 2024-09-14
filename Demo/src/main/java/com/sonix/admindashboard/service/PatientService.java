package com.sonix.admindashboard.service;


import java.util.List;

import com.sonix.admindashboard.entity.Patient;
import com.sonix.admindashboard.exception.PatientException;

public interface PatientService {
	public String addPatient(Patient patient);
	public String updatePatient(Patient patient);
	public Patient getPatientById(int patientId) throws PatientException;
	public List<Patient> getAllPatient() throws PatientException;
	public String deletePatientById(int patientId);
}