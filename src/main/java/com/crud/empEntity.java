package com.crud;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class empEntity {

	private int id;
	private String name, city;
	private List<String> hobbies;
	private String gender;
	private List<String> departments;
	private String position;
	private String empImg;
	private MultipartFile tempEmpImg;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public List<String> getHobbies() {
		return hobbies;
	}

	public void setHobbies(List<String> hobbies) {
		this.hobbies = hobbies;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public List<String> getDepartments() {
		return departments;
	}

	public void setDepartments(List<String> departments) {
		this.departments = departments;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public empEntity(int id, String name, String city, List<String> hobbies, String gender, List<String> departments,
			String position, String empImg) {
		super();
		this.id = id;
		this.name = name;
		this.city = city;
		this.hobbies = hobbies;
		this.gender = gender;
		this.departments = departments;
		this.position = position;
		this.empImg = empImg;
	}

	public empEntity() {
		super();
	}

	public String getEmpImg() {
		return empImg;
	}

	public void setEmpImg(String empImg) {
		this.empImg = empImg;
	}

	public MultipartFile getTempEmpImg() {
		return tempEmpImg;
	}

	public void setTempEmpImg(MultipartFile tempEmpImg) {
		this.tempEmpImg = tempEmpImg;
	}

}
