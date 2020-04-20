package com.waffle.vo;

import java.util.Date;

public class MemberVO {
	private String memId;
	private String memPass;
	private String memName;
	private String memBirth;
	private String memPhone;
	private String memPhone2;
	private String memAddr;
	private String memEmail;	
	private String memAuthor;
	private Date regDate;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemPhone2() {
		return memPhone2;
	}
	public void setMemPhone2(String memPhone2) {
		this.memPhone2 = memPhone2;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
		
	public String getMemAuthor() {
		return memAuthor;
	}
	public void setMemAuthor(String memAuthor) {
		this.memAuthor = memAuthor;
	}
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPass=" + memPass + ", memName=" + memName + ",memBirth=" + memBirth + ",memPhone="+memPhone+",memPhone2="+memPhone2+",memAddr="+memAddr+", regDate="
				+ regDate + "]";
	}
	
}
