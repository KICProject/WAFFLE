package com.waffle.vo;

import java.util.Date;

public class QReplyVO {
	
	private int qbno;
	private int qrno;
	private String qcontent;
	private String qwriter;
	private Date regdate;
	
	
	public int getQbno() {
		return qbno;
	}


	public void setQbno(int qbno) {
		this.qbno = qbno;
	}


	public int getQrno() {
		return qrno;
	}


	public void setQrno(int qrno) {
		this.qrno = qrno;
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


	@Override
	public String toString() {
		return "QReplyVO [qbno=" + qbno + ", qrno=" + qrno + ", qcontent=" + qcontent + ", qwriter=" + qwriter + ", regdate="
				+ regdate + "]";
	}

}
