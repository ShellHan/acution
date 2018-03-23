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
@Table(name="fileinfo")
public class Fileinfo {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String filenumber;
	private String title;
	private Date filedate;
	private String photos;
	private String comment;
	private String yongjin;
	private Double cankaojia;
	private Double price;
	private String state;
	private int ishot;
	private String type;

	@ManyToOne
	@JoinColumn(name="magid")
	private Manager mag;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getFilenumber() {
		return filenumber;
	}


	public void setFilenumber(String filenumber) {
		this.filenumber = filenumber;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public Date getFiledate() {
		return filedate;
	}


	public void setFiledate(Date filedate) {
		this.filedate = filedate;
	}


	public String getPhotos() {
		return photos;
	}


	public void setPhotos(String photos) {
		this.photos = photos;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	public String getYongjin() {
		return yongjin;
	}


	public void setYongjin(String yongjin) {
		this.yongjin = yongjin;
	}


	public Double getCankaojia() {
		return cankaojia;
	}


	public void setCankaojia(Double cankaojia) {
		this.cankaojia = cankaojia;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public int getIshot() {
		return ishot;
	}


	public void setIshot(int ishot) {
		this.ishot = ishot;
	}


	public Manager getMag() {
		return mag;
	}


	public void setMag(Manager mag) {
		this.mag = mag;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	@Override
	public String toString() {
		return "Fileinfo [id=" + id + ", filenumber=" + filenumber + ", title="
				+ title + ", filedate=" + filedate + ", photos=" + photos
				+ ", comment=" + comment + ", yongjin=" + yongjin
				+ ", cankaojia=" + cankaojia + ", price=" + price + ", state="
				+ state + ", ishot=" + ishot + ", type=" + type + ", mag="
				+ mag + "]";
	}

}
