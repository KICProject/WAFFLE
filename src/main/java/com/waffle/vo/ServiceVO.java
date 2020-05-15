package com.waffle.vo;

import java.util.Date;

public class ServiceVO {
	private String memId;
	private String serviceName;
	private String serviceId;
	private Date serviceDate; // 서비스 결제일
	private Date expireDate; // 서비스 만료일
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getServiceId() {
		return serviceId;
	}
	public void setServiceId(String memId, String serviceName) {
		this.serviceId = memId + serviceName;
	}
	public Date getServiceDate() {
		return serviceDate;
	}
	public void setServiceDate(Date regdate) {
		this.serviceDate = regdate;
	}
	public Date getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}
	
	
}
