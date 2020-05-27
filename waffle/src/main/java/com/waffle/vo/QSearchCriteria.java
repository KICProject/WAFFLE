package com.waffle.vo;

//검색 타입과 검색어를 쓸 수 있게 생성,QnaCri기능을 사용할 수 있다.
public class QSearchCriteria extends QnaCri {
	private String searchType = "";
	private String keyword = "";
	 
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "QSearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
