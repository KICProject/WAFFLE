package com.waffle.controller;

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
	MemberService service;
	
	@Inject
	ServiceService sservice;
	
	@Inject
	RoomService rservice;
	
	@Inject
	KakaoService kakao;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	//로그인 페이지로 이동
	@RequestMapping(value="/loginControl", method=RequestMethod.GET)
	public String loginMove() throws Exception{					
		return "member/loginControl";
	}
	
	/*
	 * //로그인 페이지로 이동
	 * 
	 * @RequestMapping(value="/loginControl", method=RequestMethod.GET) public
	 * String loginMove(Model model, HttpSession session) throws Exception{ String
	 * kakaoUrl = kakao.getAuthorizationUrl(session);
	 * model.addAttribute("kakaoUrl",kakaoUrl); return "member/loginControl"; }
	 */
	
	
	//카카오 로그인
	//https://kauth.kakao.com/outh/authorize?client_id=REST API키 &redirect_uri="https://localhost:8080/kakaologin&response_type=code
	@RequestMapping(value = "/kakaologin")
	public String kakaoLogin(@RequestParam("code") String code,Model model, HttpSession session) throws Exception {	
	  
		System.out.println("로그인 시 임시 코드:"+code);
		System.out.println("로그인 후 결과값");
		JsonNode token = kakao.getAccessToken(code);
		System.out.println(token);
		
		String token_string = token.get("access_token").toString();
		
		System.out.println(token_string);
		//System.out.println(code);
		//session.setAttribute("token", token_string);
		
		
		JsonNode userInfo = kakao.getKakaoUserInfo(token);
		session.setAttribute("token", userInfo);
		System.out.println(userInfo);
		
		String id = userInfo.path("id").asText();
		String name = null;
		String email = null;
		
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		
		name = properties.path("nickname").asText();
		email = kakao_account.path("email").asText();
		
		System.out.println("id:"+id+",name:"+name+",email"+email);

		return "redirect:/";
	}
	
	//카카오로그아웃
	@RequestMapping(value = "/kakaologout")
	public String kakaoLogout(HttpSession session) {	
		
		JsonNode token = kakao.Logout(session.getAttribute("token").toString());
		System.out.println(token);
		System.out.println("로그인 후 받환되는 아이디:"+token.get("id"));
		
		return "redirect:/";
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
		if(vo.getExtraAddress()==null) {
			vo.setExtraAddress("");
		}		
		vo.setMemAddr(vo.getZipcode(),vo.getRoadAddress(), vo.getDetailAddress(),vo.getExtraAddress());		
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
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	//
	
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public String moveMyPageGet() {
		logger.info("get register");
		return "member/mypage";
	}
	
	@RequestMapping(value="/mypage", method = RequestMethod.POST)
	public String moveMyPage() {
		return "member/mypage";
	}
	
	
	//회원정보수정페이지로 이동
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
			return "member/updateView";
	}
	//회원정보수정
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
	//회원 탈퇴 페이지로 이동
	@RequestMapping(value="/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		return "member/memberDeleteView";
	}

	/*
	 * // 회원탈퇴 (GET)/
	 * 
	 * @RequestMapping(value="/memberDelete", method = RequestMethod.GET) public
	 * String memberDeleteGet(MemberVO vo, HttpSession session, RedirectAttributes
	 * rttr) throws Exception{ logger.info("get memdelete"); return
	 * "member/memberDelete"; }
	 */
	// 회원탈퇴 (POST)
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
		System.out.println(vo.getMemId());
		System.out.println(vo.getMemPass());
		MemberVO userDbChk = service.login(vo); 
		System.out.println(userDbChk.toString());
		boolean pwdMatch =pwdEncoder.matches(vo.getMemPass(), userDbChk.getMemPass());
		System.out.println(pwdMatch);
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