package com.waffle.vo;

import java.util.Date;

public class NoticeReVO {

	private int nno;
	private int nrno;
	private String nrcontent;
	private String nrwriter;
	private Date regdate;
	
		public int getNno() {
		return nno;
	}



	public void setNno(int nno) {
		this.nno = nno;
	}



	public int getNrno() {
		return nrno;
	}



	public void setNrno(int nrno) {
		this.nrno = nrno;
	}



	public String getNrcontent() {
		return nrcontent;
	}



	public void setNrcontent(String nrcontent) {
		this.nrcontent = nrcontent;
	}



	public String getNrwriter() {
		return nrwriter;
	}



	public void setNrwriter(String nrwriter) {
		this.nrwriter = nrwriter;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	@Override
	public String toString() {
		return "ReplyVO [nno=" + nno + ", nrno=" + nrno + ", nrcontent=" + nrcontent + ", nrwriter=" + nrwriter + ", regdate="
				+ regdate + "]";
	}
	
	
}