package com.acution.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="announce")
public class Announce {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String title;
	private Date annDate;
	private String comment;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getAnnDate() {
		return annDate;
	}
	public void setAnnDate(Date annDate) {
		this.annDate = annDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
