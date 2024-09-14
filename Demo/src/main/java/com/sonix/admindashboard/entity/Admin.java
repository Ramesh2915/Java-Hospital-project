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
@Table(name="admin_details")
@NamedQueries({
	@NamedQuery(name = "getAdminById",query = "from Admin where admin_id=:admin_id"),
	@NamedQuery(name="getAllAdmin",query="from Admin")
})
public class Admin {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="admin_id")
	private int adminId;
	@Column(name="admin_name")
	private String adminName;
	@Column(name="admin_email")
	private String adminEmail;
	@Column(name="admin_phno")
	private long adminPhno;
	@Column(name="admin_username")
	private String adminUsername;
	@Column(name="admin_password")
	private String adminPassword;
	@Column(name="salt")
	private String salt;
}
