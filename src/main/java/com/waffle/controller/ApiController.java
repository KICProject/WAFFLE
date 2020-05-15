package com.waffle.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.waffle.service.Dust;
import com.waffle.service.Weather;


@Controller
public class ApiController {
	
	@RequestMapping(value = "/api_weather", method = RequestMethod.GET)
	public @ResponseBody String weather(Locale locale, Model model) throws ParseException {
			Weather w = new Weather();
			String result = w.reqData();
			System.out.println(result);
			System.out.println("컨트롤러에서 출력됨");
//			w.parserData(result);
			
		/*
		 * JSONParser parser = new JSONParser(); //–JSON Parser 생성 JSONObject jsonObj =
		 * (JSONObject)parser.parse(result); //– 넘어온 문자열을 JSON 객체로 변환
		 */	
				
		return result;
	}
	
	@RequestMapping(value = "/api_dust", method = RequestMethod.GET)
	public @ResponseBody String dust(Locale locale, Model model) {
			Dust d = new Dust();
			String result = d.reqData();
			System.out.println(result);
			//d.parserData(result);	
			
				
		return result;
	}
}

/*
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
}*/
