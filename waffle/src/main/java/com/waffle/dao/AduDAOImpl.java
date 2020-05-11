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
		System.out.println("온도값 저장 ="+aduVO.getTemp());
		sqlSession.update("updateadu",aduVO);
	}
	@Override
	public String lightView() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lightview");
	}
	@Override
	public void lightonoff(AduVO aduVO) throws Exception{
		System.out.println("onoff값"+aduVO.getLight());
		sqlSession.update("updatelight",aduVO);
	}
	@Override
	public void tvonoff(AduVO aduVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("onoff값"+aduVO.getTv());
		sqlSession.update("updatetv",aduVO);
	}
	@Override
	public String tvView() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("tvview");
	}
	@Override
	public void aironoff(AduVO aduVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("onoff값"+aduVO.getAircon());
		sqlSession.update("updateair",aduVO);
	}
	@Override
	public String airView() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("airview");
	}
	@Override
	public void windowonoff(AduVO aduVO) throws Exception {
		System.out.println("창문 값"+aduVO.getWindow());
		sqlSession.update("updatewindow",aduVO);
	}
	@Override
	public String windowView() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("windowview");
	}
	
}
