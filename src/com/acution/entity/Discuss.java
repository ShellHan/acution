package com.acution.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="discuss")
public class Discuss {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String username;
	private Date datetime;
	private String comment;

	@ManyToOne
	@JoinColumn(name="fileid")
	private Fileinfo fileinfo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Fileinfo getFileinfo() {
		return fileinfo;
	}

	public void setFileinfo(Fileinfo fileinfo) {
		this.fileinfo = fileinfo;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	@Override
	public String toString() {
		return "Discuss [id=" + id + ", username=" + username + ", datetime="
				+ datetime + ", comment=" + comment + ", fileinfo=" + fileinfo
				+ "]";
	}

}
