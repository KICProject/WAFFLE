package com.waffle.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.waffle.service.AduService;
import com.waffle.vo.AduVO;
import com.waffle.vo.SerialVO;

@Controller
@RequestMapping("/adu/*")
public class AduController {

	private static final Logger logger = LoggerFactory.getLogger(AduController.class);
	
	@Inject
	SerialVO serialVO;
	@Inject
	AduService aduservice;

	AduVO aduVO = new AduVO();
	@RequestMapping(value = "/updateadu", method = RequestMethod.GET)
	public String updateadu() throws Exception{
		logger.info("updateadu");
		serialVO.connect("COM5",aduVO);
		while(true) {
		if(aduVO.getTemp() != null) 
		aduservice.updateAdu(aduVO);
		System.out.println("db저장완료");
		break;
		
		
		}
		return "redirect:/";
	}	
	/*
	 * @RequestMapping(value = "writeledDB", method = RequestMethod.GET) public
	 * String writeledDB() throws Exception{ logger.info("led");
	 * 
	 * 
	 * 
	 * 
	 * return "redirect:/"; }
	 */
	
}