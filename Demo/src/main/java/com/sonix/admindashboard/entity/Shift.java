package com.sonix.admindashboard.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "shift_details")
@NamedQueries(@NamedQuery(name = "getAllShift",query = "from Shift"))
public class Shift {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="shift_id")
	private int shiftId;
	@Enumerated(EnumType.STRING)
	@Column(name ="shift_name")
	private com.sonix.admindashboard.util.Shift shiftName;
	@Column(name ="shift_timing")	
	private String shiftTiming;
}