package com.waffle.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waffle.vo.AduVO;

@Repository
public class AduDAOImpl implements AduDAO {
	
	@Inject
	private SqlSession sqlSession;
	@Override
	public void updateAdu(AduVO aduVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("저장할 값"+aduVO.getTemp());
		sqlSession.update("updateadu",aduVO);
	}

}
