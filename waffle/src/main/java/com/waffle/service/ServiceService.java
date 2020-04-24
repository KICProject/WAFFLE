package com.waffle.service;

import com.waffle.vo.MemberVO;
import com.waffle.vo.ServiceVO;

public interface ServiceService {
	
	//서비스 등록
	public void serviceRegister(ServiceVO svo) throws Exception;
	//회원이 이용중인 서비스를 찾아옴
	public ServiceVO getService(MemberVO vo) throws Exception;
}
