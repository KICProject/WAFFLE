package com.waffle.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waffle.service.KakaoService;
import com.waffle.service.MemberService;
import com.waffle.service.RoomService;
import com.waffle.service.ServiceService;
import com.waffle.vo.MemberVO;
import com.waffle.vo.ServiceVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject 
	MemberService service; // 회원관련 서비스 객체
	
	@Inject
	ServiceService sservice; // 서비스 가입/분류 객체
	
	@Inject
	RoomService rservice; // 회원-서비스 연결 후 생성되는 room 객체
	
	@Inject
	BCryptPasswordEncoder pwdEncoder; // 암호화 인코더 객체
	
	//로그인 페이지로 이동
	@RequestMapping(value="/loginControl", method=RequestMethod.GET)
	public String loginMove() throws Exception{					
		return "member/loginControl";
	}
	
	//로그인( Password 암호화, POST)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		MemberVO login = service.login(vo); //login control에서 받은 memId, memPass으로 로그인시도
		if(login ==null) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/loginControl";
		}
		ServiceVO usingService = sservice.getService(vo); //마찬가지로 memId로 서비스정보를 불러옴
		boolean pwdMatch =pwdEncoder.matches(vo.getMemPass(), login.getMemPass());
		
		if(login != null && pwdMatch==true) {
			session.setAttribute("member",login);
			session.setAttribute("usvo", usingService);
			return "redirect:/";
		}else {
			session.setAttribute("member", null);
			session.setAttribute("usvo", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/loginControl";
		}		
		
	}
	
	//로그인시 index.js로 id와 roominfo를 넘기기 위한 매핑
	@ResponseBody
	@RequestMapping(value="/getMem", method = RequestMethod.POST)
	public HashMap<String, String> getMem(HttpSession session) throws Exception{
		//HashMap 객체로 반환하여 클라이언트 단에서 꺼내 쓸 수 있도록
		HashMap<String, String> memInfo = new HashMap<String, String>();
		
		MemberVO currentMem = (MemberVO)session.getAttribute("member");
		ServiceVO memService = (ServiceVO)session.getAttribute("usvo");
		
		memInfo.put("mem", currentMem.getMemId());
		memInfo.put("usvo", memService.getServiceName());
		
		return memInfo;
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
		if(vo.getExtraAddress()==null) { // 상세 주소 2가 없으면, 빈 문자열로
			vo.setExtraAddress("");
		}		
		vo.setMemAddr(vo.getZipcode(),vo.getRoadAddress(), vo.getDetailAddress(),vo.getExtraAddress());
		// 어드레스는 각 input String 값들을 받아, 1개로 합친 뒤 전달함
		int result = service.idChk(vo); 
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
	
	// 로그아웃, 세션 연결을 끊음
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/";
	}
	// 마이페이지로 이동	(GET)
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public String moveMyPageGet() {
		return "member/mypage";
	}
	// 마이페이지로 이동	(POST)
	@RequestMapping(value="/mypage", method = RequestMethod.POST)
	public String moveMyPage() {
		return "member/mypage";
	}	
	//회원정보수정페이지로 이동 (load)
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
			return "member/updateView";
	}
	//회원정보수정 (페이지 없이, 처리 후 결과값 리턴)
	@ResponseBody
	@RequestMapping(value="/memberUpdate",method=RequestMethod.POST)
	public boolean registerUpdate(MemberVO vo, HttpSession session){
		boolean result = false;
		try {
			String inputPass = vo.getMemPass();
			String pwd = pwdEncoder.encode(inputPass);
			vo.setMemPass(pwd);			
			service.memberUpdate(vo);
			session.setAttribute("member",vo);
			result = true;
			return result;
		}catch(Exception e) {
			return result;
		}		
	}
	
	// 회원탈퇴 (POST) (페이지 없이, 처리 후 결과값만 리턴, 세션 연결해제)
	@ResponseBody
	@RequestMapping(value="/memberDelete",method=RequestMethod.POST)
	public boolean memberDelete(MemberVO vo, HttpSession session){
		System.out.println(vo.getMemId());
		boolean result = false;
		try {
			service.memberDelete(vo);
			session.invalidate();
			result = true;
			return result;
		}catch(Exception e) {
			return result;
		}
	}
	//패스워드 체크 
	@ResponseBody
	@RequestMapping(value="/passChk", method=RequestMethod.POST)
	public boolean passChk(MemberVO vo) throws Exception{
		MemberVO login = service.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getMemPass(), login.getMemPass());
		return pwdChk;
	}
	//패스워드 체크2 (정보수정,삭제를 위한)
	@ResponseBody
	@RequestMapping(value="/passDbChk", method=RequestMethod.POST)
	public boolean passDbChk(MemberVO vo) throws Exception{
		System.out.println("passDbChk 실행");
		MemberVO userDbChk = service.login(vo); 
		System.out.println(userDbChk.toString()); // 체크용 콘솔
		boolean pwdMatch =pwdEncoder.matches(vo.getMemPass(), userDbChk.getMemPass());
		System.out.println(pwdMatch); // 체크용 콘솔
		return pwdMatch;
	}
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception{
		logger.info("post register");
		int result = service.idChk(vo);		
		return result;
	}
	//이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/emailChk", method=RequestMethod.POST)
	public int emailChk(MemberVO vo) throws Exception{
		logger.info("post register");
		int result = service.emailChk(vo);		
		return result;
	}
	
}