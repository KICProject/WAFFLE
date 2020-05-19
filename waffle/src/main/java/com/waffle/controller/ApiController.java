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
	
	@RequestMapping(value = "/api_weather", method = RequestMethod.GET) // 회원이 로그인을 하면 index.js에서 자동으로 로드하는 날씨 정보 (온도,습도를 표시)
	public @ResponseBody String weather(Locale locale, Model model) throws ParseException {
			Weather w = new Weather();
			String result = w.reqData();
			System.out.println(result);
			System.out.println("컨트롤러에서 출력됨");
	
		return result;
	}
	
	@RequestMapping(value = "/api_dust", method = RequestMethod.GET) // 회원이 로그인을 하면 index.js에서 자동으로 로드하는 날씨 정보 (미세먼지 농도를 표시)
	public @ResponseBody String dust(Locale locale, Model model) {
			Dust d = new Dust();
			String result = d.reqData();
			System.out.println(result);
		
		return result;
	}
}
