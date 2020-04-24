package com.waffle.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.waffle.dao.ServiceDAO;
import com.waffle.vo.MemberVO;
import com.waffle.vo.ServiceVO;

@Service
public class ServiceServiceImpl implements ServiceService {

	@Inject ServiceDAO dao;
	
	//회원가입

	@Override
	public void serviceRegister(ServiceVO svo) throws Exception {
		dao.serviceRegister(svo);		
	}

	@Override
	public ServiceVO getService(MemberVO vo) throws Exception {
		System.out.println("getService vo:"+vo);
		return dao.getService(vo);
	}
	
}
