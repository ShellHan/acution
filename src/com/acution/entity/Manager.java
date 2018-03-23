package com.acution.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="manager")
public class Manager {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer magid;
	private String magname;
	private String password;
	
	public Integer getMagid() {
		return magid;
	}
	public void setMagid(Integer magid) {
		this.magid = magid;
	}
	public String getMagname() {
		return magname;
	}
	public void setMagname(String magname) {
		this.magname = magname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Manager [magid=" + magid + ", magname=" + magname
				+ ", password=" + password + "]";
	}
	
	
}
