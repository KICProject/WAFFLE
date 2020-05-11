package com.waffle.vo;

import org.springframework.stereotype.Component;


public class AduVO {
	private String temp;
	private String wet;
	private String roomnumber;
	private String memid;
	private String tv;
	private String light;
	private String aircon;
	private String window;
	public String getRoom_number() {
		return roomnumber;
	}
	public void setRoomnumber(String room_number) {
		this.roomnumber = room_number;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getTv() {
		return tv;
	}
	public void setTv(String tv) {
		this.tv = tv;
	}
	public String getLight() {
		return light;
	}
	public void setLight(String light) {
		this.light = light;
	}
	public String getAircon() {
		return aircon;
	}
	public void setAircon(String aircon) {
		this.aircon = aircon;
	}	
	
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
