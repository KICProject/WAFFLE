package com.waffle.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.waffle.service.RoomService;
import com.waffle.service.ServiceService;
import com.waffle.vo.RoomVO;
import com.waffle.vo.ServiceVO;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {
	
	 @Inject
	 ServiceService service;
	 
	 @Inject 
	 RoomService rservice;	
	
	//private static final Logger logger = LoggerFactory.getLogger(PaymentContoller.class);
	@ResponseBody
	@RequestMapping(value="/payReady", method=RequestMethod.POST)
	public int paymentReady(ServiceVO svo, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception{
		System.out.println("payReady() called");
		int result = 0;
		response.setContentType("text/html;charset=UTF-8");
		String memId = request.getParameter("memId");
		String memName = request.getParameter("memName");
		String serviceName = request.getParameter("serviceName");
		String price = request.getParameter("price");
		session.setAttribute("price", price);
		svo.setMemId(memId);
		svo.setServiceName(serviceName);
		svo.setServiceId(memId, serviceName);
		System.out.println(svo.getServiceId());
		session.setAttribute("svo", svo);
		if(svo != null) {
			result =1;
		}
		return result;
	}
	@RequestMapping(value="/pay", method=RequestMethod.GET)
	public String payPro(HttpSession session) throws Exception {
		System.out.println("payPro() called");
		return "/payment/pay";
	}
	@ResponseBody
	@RequestMapping(value="/regservice", method=RequestMethod.GET)
	public int regService(ServiceVO svo, HttpServletResponse response, HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("regService svo:"+svo);
		ServiceVO regSvo = (ServiceVO)session.getAttribute("svo");		
		service.serviceRegister(regSvo);
		int result = 0;
		if(regSvo != null) {
			result = 1;
		}
		// 결제가 되면서, 해당 아이디 유저의 방 정보도 default로 등록한다.
		RoomVO rvo = new RoomVO();
		rservice.makeRoom(session, rvo, regSvo);
		return result;
	}
	
	@RequestMapping(value="/complete", method=RequestMethod.GET)
	public String payComplete(ServiceVO svo, HttpServletResponse response, HttpSession session) throws Exception{
		return "payment/complete";
	}
	
	@RequestMapping(value="/fail")
	public String payFailure() throws Exception{
		return "payment/fail";
	}
}
