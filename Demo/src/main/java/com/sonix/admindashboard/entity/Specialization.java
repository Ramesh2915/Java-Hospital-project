package com.sonix.admindashboard.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name="specialization_details")

@NamedQueries({
	@NamedQuery(name = "getSpecializationById",query = "from Specialization where specialization_id=:specialization_id"),
	@NamedQuery(name="getAllSpecialization",query="from Specialization")
})

public class Specialization {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="specialization_id")
	private int SpecializationId;
	@Column(name="specialization_name")
	private String SpecializationName;
	@Column(name="specialization_description")
	private String SpecializationDescription;
}
