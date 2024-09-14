package com.sonix.admindashboard.service;

import java.util.List;

import com.sonix.admindashboard.entity.Specialization;
import com.sonix.admindashboard.exception.SpecializationException;

public interface SpecializationService {
public String addSpecialization(Specialization specialization);
public String updateSpecialization(Specialization specialization);	
public Specialization getSpecializationById(int specializationId) throws SpecializationException;
public List<Specialization> getAllSpecialization() throws SpecializationException;
public String deleteSpecializationById(int specializationId);
}
