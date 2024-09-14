package com.sonix.admindashboard.service;

import java.util.List;

import com.sonix.admindashboard.entity.Appointment;
import com.sonix.admindashboard.exception.AppointmentException;

public interface AppointmentService {
	public String addAppointment(Appointment appointment);
	public String updateAppointment(Appointment appointment);
	public Appointment getAppointmentById(int appointmentId) throws AppointmentException;
	public List<Appointment> getAllAppointment() throws AppointmentException;
	public String deleteAppointmentById(int appointmentId);
}
