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
	@RequestMapping(value="/page1", method = RequestMethod.GET)
	public String page1() throws Exception{			
		/* System.out.println("page1 �샇異쒕맖"); */
		return "sub/page1";
	}
	
	@RequestMapping(value="/page2", method = RequestMethod.GET)
	public String page2() throws Exception{			
		/* System.out.println("page2 �샇異쒕맖"); */
		return "sub/page2";
	}
	@RequestMapping(value="/page3", method = RequestMethod.GET)
	public String page3() throws Exception{			
		/* System.out.println("pag3 �샇異쒕맖"); */
		return "sub/page3";
	}
	@RequestMapping(value="/page4", method = RequestMethod.GET)
	public String page4() throws Exception{			
		/* System.out.println("page4 �샇異쒕맖"); */
		return "sub/page4";
	}
	@RequestMapping(value="/page5", method = RequestMethod.GET)
	public String page5() throws Exception{			
		/* System.out.println("page5 �샇異쒕맖"); */
		return "sub/page5";
	}
	
	
	@RequestMapping(value="/faq", method = RequestMethod.GET)
	public String faq() throws Exception{					
		return "sub/faq";
	}
	 
	
	
	
}