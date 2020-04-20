package com.waffle.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.waffle.service.Dust;
import com.waffle.service.Weather;


@Controller
public class ApiController {
	
	@RequestMapping(value = "/api", method = RequestMethod.GET)
	public String api(Locale locale, Model model) {
		boolean api_type = false;
		if(api_type)
		{
			Weather w = new Weather();
			String result = w.reqData();	
			w.parserData(result);
		}else{
			Dust d = new Dust();
			String result = d.reqData();
			d.parserData(result);
		}
		
		return "home";
	}
}
