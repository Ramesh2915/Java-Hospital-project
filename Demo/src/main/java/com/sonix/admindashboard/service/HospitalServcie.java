package com.sonix.admindashboard.service;

import java.util.List;

import com.sonix.admindashboard.entity.Hospital;
import com.sonix.admindashboard.exception.HospitalException;


public interface HospitalServcie {
	public String addHospital(Hospital hospital);
	public String updateHospital(Hospital hospital);
	public Hospital getHospitalById(int hospitalId) throws HospitalException;
	public List<Hospital> getAllHospital()  throws HospitalException;
	public String deleteHospitalById(int hospitalId);
}
