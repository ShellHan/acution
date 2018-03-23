package com.acution.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="order")
public class Order {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer orderid;
	private String total;
	private String name;
	private String address;
	private String phone;
	private Date datetime;
	private String state;

	//与用户的关系
	@ManyToOne
	@JoinColumn(name="userid")
	private User user;
	
	//与订单项的关系
	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Set<Car> car = new HashSet<Car>();
	
	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Car> getCar() {
		return car;
	}

	public void setCar(Set<Car> car) {
		this.car = car;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Order [orderid=" + orderid + ", total=" + total + ", name="
				+ name + ", address=" + address + ", phone=" + phone
				+ ", datetime=" + datetime + ", state=" + state + ", user="
				+ user + ", car=" + car + "]";
	}
	
}