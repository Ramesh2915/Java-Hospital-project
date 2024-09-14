package com.sonix.admindashboard.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "appointment_details")
@NamedQueries({
	@NamedQuery(name = "getAppointmentById",query = "from Appointment where appointment_id=:appointment_id"),
	@NamedQuery(name="getAllAppointment",query="from Appointment")
})
public class Appointment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "appointment_id")
	private int appointmentId;
	@Column(name = "patient_name")
	private String patientName;
	@Column(name = "patient_phno")
	private String patientPhno;
	@Column(name = "patient_email")
	private String patientEmail;
	@Column(name = "registered_date")
	private Date registeredDate;
	@Column(name = "appointment_date")
	private Date appointmentDate;
	@ManyToOne
	@JoinColumn(name="hospital_id")
	private Hospital hospital;
	@ManyToOne
	@JoinColumn(name = "doctor_id")
	private Doctor doctor;
	@OneToOne
	@JoinColumn(name = "slot_id")
	private Slot slot;
	
}
