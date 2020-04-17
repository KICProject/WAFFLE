package com.waffle.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waffle.service.MemberService;
import com.waffle.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	//로그?��?��?���?�?
	@RequestMapping(value="/loginControl", method=RequestMethod.GET)
	public String loginMove() throws Exception{
		return "member/loginControl";
	}	
		
	
	//로그인( Password 암호화, POST)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		session.getAttribute("member");
		MemberVO login = service.login(vo);
		boolean pwdMatch =pwdEncoder.matches(vo.getMemPass(), login.getMemPass());
		
		if(login != null && pwdMatch==true) {
			session.setAttribute("member",login);
		}else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}		
		return "redirect:/";
	}
	
	//약관 동의 페이지로 이동
	@RequestMapping(value="/agree", method=RequestMethod.GET)
	public String agree() throws Exception{
		return "member/agree";
	}	
	
	// 회원가입(get)
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// 회원가입(post)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");
		int result = service.idChk(vo); //
		try {
			if(result==1) {
				return "/register";
			}else if(result==0) {
				String inputPass = vo.getMemPass();
				String pwd = pwdEncoder.encode(inputPass);
				vo.setMemPass(pwd);
				service.register(vo);
			}
		}catch(Exception e) {
			throw new RuntimeException();
		}
		
		return "member/welcome";
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	//회원정보수정페이지로 이동
	@RequestMapping(value = "/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
			return "member/memberUpdateView";
	}
	//회원정보수정
	@RequestMapping(value="/memberUpdate",method=RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
			service.memberUpdate(vo);
			session.invalidate();
			return "redirect:/";
	}
	//회원 탈퇴 페이지로 이동
	@RequestMapping(value="/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		return "member/memberDeleteView";
	}
	
	// 회원탈퇴 (POST)/
	@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		service.memberDelete(vo);
		session.invalidate();
		return "redirect:/";
	}
	//패스워드 체크
	@ResponseBody
	@RequestMapping(value="/passChk", method=RequestMethod.POST)
	public boolean passChk(MemberVO vo) throws Exception{
		MemberVO login = service.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getMemPass(), login.getMemPass());
		return pwdChk;
	}
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception{
		logger.info("post register");
		int result = service.idChk(vo);
		
		return result;
	}

	
}