package com.waffle.vo;

import org.springframework.stereotype.Component;


public class AduVO {
	private String temp;
	private String wet;
	private String room_number;
	private String memid;
	private String TV;
	private String light;
	private String aircon;
	private String window;
	
	
	
	public String getWindow() {
		return window;
	}
	public void setWindow(String window) {
		this.window = window;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
		
	}
	public String getWet() {
		return wet;
	}
	public void setWet(String wet) {
		this.wet = wet;
		
	}
	
}
