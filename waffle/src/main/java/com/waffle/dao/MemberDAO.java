package com.waffle.dao;

import com.waffle.vo.MemberVO;

public interface MemberDAO {
	
	//회원가입
	public void register(MemberVO vo) throws Exception;

	/*
	 * //회원가입 카카오톡 public void kakaoReg(MemberVO vo) throws Exception;
	 */
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	//정보수정,삭제를 위한 더블체크
	public MemberVO passDbChk(MemberVO vo) throws Exception;
	//회원정보수정
	public void memberUpdate(MemberVO vo) throws Exception;
	//회원탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	//패스워드체크
	public int passChk(MemberVO vo) throws Exception;
	//아이디중복체크
	public int idChk(MemberVO vo) throws Exception;
	//이메일중복체크
	public int emailChk(MemberVO vo) throws Exception;
}
