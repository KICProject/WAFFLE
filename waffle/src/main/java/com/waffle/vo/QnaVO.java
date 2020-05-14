package com.waffle.vo;

import java.util.Date;

public class QnaVO {
 
	
	private int qbno; 
	private String qtitle;
	private String qcontent;
	private String qwriter ;
	private Date regdate;
	private String review_password;
	
	
	
	public String getReview_password() {
		return review_password;
	}
	
	public void setReview_password(String review_password) {
		this.review_password = review_password;
	}
	
	public int getQbno() {
		return qbno;
	}
	public void setQbno(int qbno) {
		this.qbno = qbno;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQwriter() {
		return qwriter;
	}
	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
