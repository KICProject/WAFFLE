package com.waffle.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waffle.vo.MemberVO;
import com.waffle.vo.ServiceVO;

@Repository
public class ServiceDAOImple implements ServiceDAO {

	@Inject SqlSession sql;
	
	@Override
	public void serviceRegister(ServiceVO svo) throws Exception {
		sql.insert("serviceMapper.registService",svo);		
	}

	@Override
	public ServiceVO getService(MemberVO vo) throws Exception {
		System.out.println("ServiceVO , membervo:"+vo);
		return sql.selectOne("serviceMapper.getService", vo);
		
	}
	
}
