package com.waffle.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sub/*")
public class SubMenuController {

	private static final Logger logger = LoggerFactory.getLogger(SubMenuController.class);
	
	@RequestMapping(value="/about", method = RequestMethod.GET)
	public String moveAbout() throws Exception{			
		return "sub/about";
	}
	@RequestMapping(value="/waffleService", method = RequestMethod.GET)
	public String moveWaffleService() throws Exception{			
		return "sub/waffleService";
	}
	@RequestMapping(value="/waffleBoard")
	public String moveBoard() throws Exception {
		 return "sub/waffleBoard";
	}
	
	
}