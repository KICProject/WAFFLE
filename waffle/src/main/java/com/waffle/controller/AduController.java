package com.waffle.controller;

import java.io.InputStream;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.waffle.service.AduService;
import com.waffle.vo.AduVO;
import com.waffle.vo.SerialVO;

import gnu.io.SerialPort;
import sun.java2d.pipe.hw.AccelDeviceEventListener;

@Controller
@RequestMapping("/adu/*")
public class AduController {

	private static final Logger logger = LoggerFactory.getLogger(AduController.class);
	
	@Inject
	SerialVO serialVO;
	@Inject
	AduService aduservice;
	AduVO aduVO = new AduVO();
	String function="";
	
	@RequestMapping(value = "connect", method = RequestMethod.GET)
	public String connect() throws Exception{
		logger.info("updateadu");
		serialVO.connect("COM5");
		return "redirect:/";
	}
	@RequestMapping(value = "updateadu", method = RequestMethod.GET)
	public String updateadu() throws Exception{
		logger.info("updateadu");
		serialVO.read(aduVO);
		serialVO.timesleep(2000);
		if(aduVO.getTemp()!= null) {
		aduservice.updateAdu(aduVO);
		System.out.println("db저장");
		}
		
		return "redirect:/";
	}
	//DB변경 컨트롤러 
	@RequestMapping(value = "updatelight", method = RequestMethod.GET)
	public String updatelight() throws Exception{
		logger.info("updatelight");	
		function="light";
		String rs = aduservice.lightView();
		System.out.println("DB변경 컨트롤러 = >" + rs);
		
		
		if(rs.equals("49")) {
			System.out.println("a");
			aduVO.setLight("48");
			aduservice.lightonoff(aduVO);
			System.out.println("48 입력 , 불을 껐습니다.");
			serialVO.write(aduVO,function);
			
		}
		else if(rs.equals("48")) {
			System.out.println("B");
			aduVO.setLight("49");
			aduservice.lightonoff(aduVO);
			System.out.println("49입력 , 불을 켰습니다");
			serialVO.write(aduVO,function);
		}
		return "redirect:/";
	}
	//DB변경 컨트롤러 
		@RequestMapping(value = "updatetv", method = RequestMethod.GET)
		public String updatetv() throws Exception{
			logger.info("updatetv");	
			function="tv";
			String rs = aduservice.tvView();
			System.out.println("DB변경 컨트롤러 = >" + rs);
			
			
			if(rs.equals("49")) {
				System.out.println("a");
				aduVO.setTv("48");
				aduservice.tvonoff(aduVO);
				System.out.println("48 입력 , tv를 껐습니다.");
				serialVO.write(aduVO,function);
				
			}
			else if(rs.equals("48")) {
				System.out.println("B");
				aduVO.setTv("49");
				aduservice.tvonoff(aduVO);
				System.out.println("49입력 , tv 켰습니다");
				serialVO.write(aduVO,function);
			}
			else {
				System.out.println("DB값 초기화");
				aduVO.setTv("48");
				aduservice.tvonoff(aduVO);
			}
			return "redirect:/";
		}
		//DB변경 컨트롤러 
		@RequestMapping(value = "updateair", method = RequestMethod.GET)
		public String updateair() throws Exception{
			logger.info("updateair");	
			function="air";
			String rs = aduservice.airView();	
			System.out.println("DB변경 컨트롤러 = >" + rs);
			
			
			if(rs.equals("49")) {
				System.out.println("a");
				aduVO.setAircon("48");
				aduservice.aironoff(aduVO);
				System.out.println("48 입력 , 에어컨을 껐습니다.");
				serialVO.write(aduVO,function);
				
			}
			else if(rs.equals("48")) {
				System.out.println("B");
				aduVO.setAircon("49");
				aduservice.aironoff(aduVO);
				System.out.println("49입력 , 에어컨을 켰습니다");
				serialVO.write(aduVO,function);
			}
			else {
				System.out.println("DB값 초기화");
				aduVO.setAircon("48");
				aduservice.aironoff(aduVO);
			}
			return "redirect:/";
		}
		@RequestMapping(value = "updatewindow", method = RequestMethod.GET)
		public String updatewindow() throws Exception{
			logger.info("updatewindow");	
			function="window";
			String rs = aduservice.windowView();	
			System.out.println("DB변경 컨트롤러 = >" + rs);
			
			
			if(rs.equals("49")) {
				System.out.println("a");
				aduVO.setWindow("48");
				aduservice.windowonoff(aduVO);
				System.out.println("48 입력 , 창문을 닫았습니다");
				serialVO.write(aduVO,function);
				
			}
			else if(rs.equals("48")) {
				System.out.println("B");
				aduVO.setWindow("49");
				aduservice.windowonoff(aduVO);
				System.out.println("49입력 , 창문을 열었습니다.");
				serialVO.write(aduVO,function);
			}
			else {
				System.out.println("DB값 초기화");
				aduVO.setWindow("48");
				aduservice.windowonoff(aduVO);
			}
			return "redirect:/";
		}
}
