package com.acution.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="car")
public class Car {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer itemid;
	private String number;
	private String price;
	
	//与文件的关系
	@ManyToOne
	@JoinColumn(name="fileinfoid")
	private Fileinfo fileinfo;
	
	//与用户的关系
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;

	public Integer getItemid() {
		return itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Fileinfo getFileinfo() {
		return fileinfo;
	}

	public void setFileinfo(Fileinfo fileinfo) {
		this.fileinfo = fileinfo;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "OrderItem [itemid=" + itemid + ", number=" + number
				+ ", price=" + price + ", fileinfo=" + fileinfo + ", user="
				+ user + "]";
	}
	
}
