package com.sonix.admindashboard.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor

@Table(name = "patient_details")
@javax.persistence.NamedQueries({
	@NamedQuery(name = "getPatientById",query = "from Patient where patient_id=:patient_id"),
	@NamedQuery(name = "getAllPatient",query = "from Patient")
})
public class Patient {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "patient_id")
	private int patientId;
	@Column(name = "patient_name")
	private String patientName;
	@Column(name = "patient_age")
	private int patientAge;
	@Column(name = "patient_disease")
	private String patientDisease;
	@Column(name = "patient_phno")
	private long patientPhno;
	@Column(name = "patient_email")
	private String patientEmail;
	@Column(name = "patient_address")
	private String patientAddress;
	@ManyToOne
	@JoinColumn(name="doctor_id")
	private Doctor doctor;
}