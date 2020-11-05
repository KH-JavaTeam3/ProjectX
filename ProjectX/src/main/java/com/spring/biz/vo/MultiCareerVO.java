package com.spring.biz.vo;

import java.util.Arrays;

public class MultiCareerVO {
	public int[] carNum;
	public String[] carCompany;
	public String[] carCareer;
	public String[] carType;
	public String[] carPosition;
	
	public int[] getCarNum() {
		return carNum;
	}
	public void setCarNum(int[] carNum) {
		this.carNum = carNum;
	}
	public String[] getCarCompany() {
		return carCompany;
	}
	public void setCarCompany(String[] carCompany) {
		this.carCompany = carCompany;
	}
	public String[] getCarCareer() {
		return carCareer;
	}
	public void setCarCareer(String[] carCareer) {
		this.carCareer = carCareer;
	}
	public String[] getCarType() {
		return carType;
	}
	public void setCarType(String[] carType) {
		this.carType = carType;
	}
	public String[] getCarPosition() {
		return carPosition;
	}
	public void setCarPosition(String[] carPosition) {
		this.carPosition = carPosition;
	}
	@Override
	public String toString() {
		return "MultiCareerVO [carNum=" + Arrays.toString(carNum) + ", carCompany=" + Arrays.toString(carCompany)
				+ ", carCareer=" + Arrays.toString(carCareer) + ", carType=" + Arrays.toString(carType)
				+ ", carPosition=" + Arrays.toString(carPosition) + "]";
	}
	
	
}
