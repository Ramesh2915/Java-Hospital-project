package com.sonix.admindashboard.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "doctor_details")
@NamedQueries({
	@NamedQuery(name = "getDoctorById",query = "from Doctor where doctor_id=:doctor_id"),
	@NamedQuery(name="getAllDoctor",query="from Doctor")
})
public class Doctor {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "doctor_id")
	private int doctorId;
	@Column(name = "doctor_name")
	private String doctorName;
	@Column(name="doctor_gender")
	private String doctorGender;
	@Column(name="doctor_experience")
	private String doctorExperience;
	@Column(name="doctor_qualification")
	private String doctorQualification;
	@Column(name="doctor_email")
	private String doctorEmail;
	@Column(name="doctor_phno",length=10)
	private long doctorPhno;
	@ManyToOne
	@JoinColumn(name="hospital_id")
	private Hospital hospital;
	@ManyToOne
	@JoinColumn(name="specialization_id")
	private Specialization  specialization;
	@ManyToOne
	@JoinColumn(name="shift_id")
	private Shift shift;
} 
