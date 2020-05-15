package com.waffle.dao;

import com.waffle.vo.MemberVO;
import com.waffle.vo.ServiceVO;

public interface ServiceDAO {
	
	// 서비스 결제 > 등록
	public void serviceRegister(ServiceVO svo) throws Exception;
	
	// 회원이 이용중인 서비스 정보를 가져옴
	public ServiceVO getService(MemberVO vo) throws Exception;
	
}
