package com.FoodSystem.FoodSystem.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Manager {
	
	@Id
	private String managerEmail;
	private String managerName;
	private String managerPassword;
	public String getManagerEmail() {
		return managerEmail;
	}
	public void setManagerEmail(String managerEmail) {
		this.managerEmail = managerEmail;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getManagerPassword() {
		return managerPassword;
	}
	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}
	public Manager(String managerEmail, String managerName, String managerPassword) {
		super();
		this.managerEmail = managerEmail;
		this.managerName = managerName;
		this.managerPassword = managerPassword;
	}
	public Manager() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Manager [managerEmail=" + managerEmail + ", managerName=" + managerName + ", managerPassword="
				+ managerPassword + "]";
	}
	

}
