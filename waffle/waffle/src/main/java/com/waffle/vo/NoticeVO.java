package com.waffle.vo;

import java.util.Date;

public class NoticeVO { //DTO

		private int nno;
		private String ntitle;
		private String ncontent;
		private String nwriter;
		private Date regdate;
		private int nhit;
		//추가
		private String gdsThumbImg;
		
		public String getGdsThumbImg() {
			return gdsThumbImg;
		}
		public void setGdsThumbImg(String gdsThumbImg) {
			this.gdsThumbImg = gdsThumbImg;
		}
		public int getNno() {
			return nno;
		}
		public void setNno(int nno) {
			this.nno = nno;
		}
		public String getNtitle() {
			return ntitle;
		}
		public void setNtitle(String ntitle) {
			this.ntitle = ntitle;
		}
		public String getNcontent() {
			return ncontent;
		}
		public void setNcontent(String ncontent) {
			this.ncontent = ncontent;
		}
		public String getNwriter() {
			return nwriter;
		}
		public void setNwriter(String nwriter) {
			this.nwriter = nwriter;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public int getNhit() {
			return nhit;
		}
		public void setNhit(int nhit) {
			this.nhit = nhit;
		}		
}
