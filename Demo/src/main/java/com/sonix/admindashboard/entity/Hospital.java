

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
@Table(name = "hospital_details")

@NamedQueries({
	@NamedQuery(name = "getHospitalById",query = "from Hospital where hospital_id=:hospital_id"),
	@NamedQuery(name="getAllHospital",query="from Hospital")
})

public class Hospital {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "hospital_id")
	private int hospitalId;
	@Column(name = "hospital_name")
	private String hospitalname;
	@Column(name = "hospital_city")
	private String hospitalCity;
	@Column(name = "hospital_address")
	private String hospitalAddress;
	@Column(name = "hospital_pincode")
	private int hospitalPincode;
	@Column(name = "hospital_email")
	private String hospitalEmail;
	@Column(name = "hospital_phno", length = 10)
	private long hospitalPhno;
	@ManyToOne
	@JoinColumn(name="admin_id")
	private Admin admin;
}
