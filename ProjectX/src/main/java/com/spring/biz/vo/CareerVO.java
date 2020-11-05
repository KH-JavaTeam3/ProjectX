package com.spring.biz.vo;

public class CareerVO {
	public int carNum;
	public String carCompany;
	public String carCareer;
	public String carType;
	public String carPosition;
	public int resumeNum;
	
	public int getCarNum() {
		return carNum;
	}
	public void setCarNum(int carNum) {
		this.carNum = carNum;
	}
	public String getCarCompany() {
		return carCompany;
	}
	public void setCarCompany(String carCompany) {
		this.carCompany = carCompany;
	}
	public String getCarCareer() {
		return carCareer;
	}
	public void setCarCareer(String carCareer) {
		this.carCareer = carCareer;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public String getCarPosition() {
		return carPosition;
	}
	public void setCarPosition(String carPosition) {
		this.carPosition = carPosition;
	}
	public int getResumeNum() {
		return resumeNum;
	}
	public void setResumeNum(int resumeNum) {
		this.resumeNum = resumeNum;
	}
	
	@Override
	public String toString() {
		return "CareerVO [carNum=" + carNum + ", carCompany=" + carCompany + ", carCareer=" + carCareer + ", carType="
				+ carType + ", carPosition=" + carPosition + ", resumeNum=" + resumeNum + "]";
	}
	
	
	
}
