package com.waffle.service;

import com.waffle.vo.AduVO;

public interface AduService {
	//�½��� ������
	public void updateAdu(AduVO aduVO) throws Exception;
	//���� DB��ȸ
	public String lightView() throws Exception;
	//���� DB����
	public void lightonoff(AduVO aduVO) throws Exception;
	//���� DB��ȸ
	public String tvView() throws Exception;
	//���� DB����
	public void tvonoff(AduVO aduVO) throws Exception;
	//���� DB����
	public String airView() throws Exception;
	//���� DB����
	public void aironoff(AduVO aduVO) throws Exception;
	//현재 창문상태 보기
	public String windowView() throws Exception;
	//창문 온오프
	public void windowonoff(AduVO aduVO) throws Exception;
}
