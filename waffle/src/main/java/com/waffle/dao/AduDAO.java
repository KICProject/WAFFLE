package com.waffle.dao;

import com.waffle.vo.AduVO;


public interface AduDAO {
	
	//온습도 
	public void updateAdu(AduVO aduVO) throws Exception;
	//현재 조명상태 보기
	public String lightView() throws Exception;
	//조명 온오프
	public void lightonoff(AduVO aduVO) throws Exception;
	//현재 티비상태 보기
	public String tvView() throws Exception;
	//티비 온오프
	public void tvonoff(AduVO aduVO) throws Exception;
	//현재 에어컨상태 보기
	public String airView() throws Exception;
	//에어컨 온오프
	public void aironoff(AduVO aduVO) throws Exception;
	//현재 창문상태 보기
	public String windowView() throws Exception;
	//창문 온오프
	public void windowonoff(AduVO aduVO) throws Exception;
}
