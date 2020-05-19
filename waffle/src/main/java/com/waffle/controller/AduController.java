package com.waffle.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.waffle.service.RoomService;
import com.waffle.vo.RoomVO;
import com.waffle.vo.SerialVO;

@Controller
@RequestMapping("/adu/*")
public class AduController {

	private static final Logger logger = LoggerFactory.getLogger(AduController.class);
	
	@Inject
	SerialVO serialVO;
	@Inject
	RoomService roomsv;
	String function="";
	
	//아두이노와 시리얼 통신 하는 컨트롤러
	@ResponseBody
	@RequestMapping(value = "connect", method = RequestMethod.GET)
	public boolean connect(){
		logger.info("connect");
		boolean result = false;
		try {
			serialVO.connect("COM5");
			result = true;
		}catch (Exception e) {
			
		}
		return result;
	}
	//온 습도센서를 읽어오는 컨트롤러
	@ResponseBody
	@RequestMapping(value = "updateadu", method = RequestMethod.GET)
	public RoomVO updateadu(RoomVO rvo) throws Exception{
		logger.info("updateadu");
		roomsv.getRoominfo(rvo);
		System.out.println("멤아이디" + rvo.getMemId());
		RoomVO cvo = roomsv.getRoominfo(rvo);
		System.err.println("아두 확인값 "+ cvo.getMemId() + cvo.getRoomNumber());
		
		try {
			serialVO.read(cvo);
			serialVO.timesleep(1000);
			System.out.println("저장할 값 "+cvo.getInnerTemp() + cvo.getInnerWet());
			roomsv.updateAdu(cvo);
			
		}catch (Exception e) {
			
		}
		
		return cvo;
	}
	//조명1 온오프 컨트롤러
	@RequestMapping(value = "updatelight", method = RequestMethod.GET)
	public String updatelight(RoomVO rvo) throws Exception{
		logger.info("updatelight");	
		function="light";
		RoomVO cvo = roomsv.getRoominfo(rvo);

			serialVO.write(cvo,function);
			
		return "redirect:/";
	}
	//tv온 오프 컨트롤러
		@RequestMapping(value = "updatetv", method = RequestMethod.GET)
		public String updatetv(RoomVO rvo) throws Exception{
			logger.info("updatetv");
			
			function="tv";
			RoomVO cvo = roomsv.getRoominfo(rvo);
			System.out.println("확인값 " +cvo.getTv());
				serialVO.write(cvo,function);
			
			return "redirect:/";
		}
		//에어콘 온오프 컨트롤러 
		@RequestMapping(value = "updateair", method = RequestMethod.GET)
		public String updateair(RoomVO rvo) throws Exception{
			logger.info("updateair");	
			function="air";
			RoomVO cvo = roomsv.getRoominfo(rvo);
			serialVO.write(cvo,function);
			return "redirect:/";
		}
		//창문 여닫이 컨트롤러
		@RequestMapping(value = "updatewindow", method = RequestMethod.GET)
		public String updatewindow(RoomVO rvo) throws Exception{
			logger.info("updatewindow");	
			function="window";
			RoomVO cvo = roomsv.getRoominfo(rvo);
			serialVO.write(cvo,function);
			return "redirect:/";
		}
}
