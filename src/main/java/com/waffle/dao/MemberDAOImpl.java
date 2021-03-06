package com.waffle.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waffle.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject SqlSession sql;
	
	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register",vo);
		sql.insert("memberMapper.reg_for_login",vo);
	}	
	/*
	 * @Override public void kakaoReg(MemberVO vo) throws Exception { // TODO
	 * Auto-generated method stub
	 * 
	 * }
	 */
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.login", vo);
	}
	//정보수정,삭제를 위한 더블체크	
	@Override
	public MemberVO passDbChk(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.passDbChk",vo);
	}
	//정보수정
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		sql.update("memberMapper.memberUpdate",vo);
	}
	//회원탈퇴
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sql.delete("memberMapper.memberDelete",vo);
		sql.delete("memberMapper.memberDeleteLogin",vo);
	}
	//패스워드체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.passChk",vo);
		return result;
	}
	//아이디 중복체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.idChk",vo);
		return result;
	}
	//이메일 중복체크
	@Override
	public int emailChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.emailChk",vo);
		return result;
	}
	
	
	
	

}
