package com.waffle.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.waffle.dao.MemberDAO;
import com.waffle.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject MemberDAO dao;
	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.register(vo);
	}
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	//정보수정
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		dao.memberUpdate(vo);		
	}
	//회원탈퇴
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}
	//패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}
	//아이디중복체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
	//이메일 중복체크
	@Override
	public int emailChk(MemberVO vo) throws Exception {
		int result = dao.emailChk(vo);
		return result;
	}
	//회원 목록
	@Override
	public List<MemberVO> adminlist(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.adminlist(vo);		
	}
	//회원 상세보기
	@Override
	public MemberVO readMember(String memId) throws Exception {
		// TODO Auto-generated method stub
		return dao.readMember(memId);
	}
	//비밀번호 초기화
	@Override
	public void pwdClear(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.pwdClear(vo);
	}
	//회원정보 수정
	@Override
	public void updateInfo(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서비스 메소드에서의 memAuthor" + vo.getMemAuthor());
		dao.updateInfo(vo);
	}
	@Override
	public MemberVO admincheck(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.admincheck(vo);
	}

}
