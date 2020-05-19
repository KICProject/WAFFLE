package com.waffle.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);

	@Inject
	ServiceService service; // 결제가 완료된 뒤 서비스 결제 정보를 저장하기 위한 객체

	@Inject
	RoomService rservice; // 서비스에 따른 room 정보를 다룰 객체
	

	@ResponseBody
	@RequestMapping(value = "/payReady", method = RequestMethod.POST) // 서비스 페이지의 form에 정보를 전달해서 결제를 준비함
	public int paymentReady(ServiceVO svo, HttpServletResponse response, HttpServletRequest request,
			HttpSession session) throws Exception {

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

		if (svo != null) {
			result = 1;
		}
		return result;
	}

	@RequestMapping(value = "/pay", method = RequestMethod.GET) //결제버튼을 누르면 결제가 진행됨 
	public String payPro(HttpSession session) throws Exception {
		System.out.println("payPro() called");
		return "/payment/pay";
	}

	@ResponseBody
	@RequestMapping(value = "/regservice", method = RequestMethod.GET) //결게가 되면, 해당 결제 정보를 service 테이블에 등록
	public int regService(ServiceVO svo, HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("regService svo:" + svo);
		ServiceVO regSvo = (ServiceVO) session.getAttribute("svo");
		service.serviceRegister(regSvo);
		int result = 0;
		if (regSvo != null) {
			result = 1;
		}
		// 결제가 되면서, 해당 아이디 유저의 방 정보도 default로 등록한다.
		RoomVO rvo = new RoomVO();
		rservice.makeRoom(session, rvo, regSvo);
		session.setAttribute("usvo", regSvo);
		return result;
	}

	@RequestMapping(value = "/complete", method = RequestMethod.GET) // 완료페이지로 이동
	public String payComplete(ServiceVO svo, HttpServletResponse response, HttpSession session) throws Exception {
		return "payment/complete";
	}

	@RequestMapping(value = "/fail") // 실패 페이지로 이동
	public String payFailure() throws Exception {
		return "payment/fail";
	}
}
