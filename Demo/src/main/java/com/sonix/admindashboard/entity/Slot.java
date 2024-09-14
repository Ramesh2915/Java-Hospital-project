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

import com.sonix.admindashboard.util.SlotName;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "slot_details")
@NamedQueries(@NamedQuery(name = "getAllSlot",query = "from Slot"))
public class Slot {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="slot_id")
	private int slotId;
	@Enumerated(EnumType.STRING)
	@Column(name ="slot_name")
	private SlotName slotName;
	@Column(name ="slot_timing")
	private String slotTiming;
}