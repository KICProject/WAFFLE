package com.waffle.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.waffle.service.RoomService;
import com.waffle.vo.RoomVO;

@Controller
@RequestMapping("/room/*")
public class RoomController {
	
	@Inject
	RoomService rservice;
	
	
	@RequestMapping(value="/getroom",method=RequestMethod.POST)
	public @ResponseBody String getRoom(RoomVO rvo, HttpSession session) throws Exception{
		/*
		 * 1. 현재 세션에 저장된 member의 id 값을 가져올것(메인페이지에서 히든으로 넘기자)
		 * 2. select value 는 roomNumber 니까 가져올 것
		 * 		1,2번은 메인페이지에서 ajax로 넘겨주고 그걸 rvo 로 받을거임
		 * 3. 그렇게 getroominfo 로 두가지를 넘기면 where 조건문에 맞는 애로 찾아서 반환
		 * 4. 반환은 json 형태로
		 * 
		 */
		RoomVO getroom = rservice.getRoominfo(rvo);
		
		
		
		String json = new ObjectMapper().writeValueAsString(getroom);
		System.out.println(json);
		
		return json;
	}
	
	@RequestMapping(value="/updateroom", method=RequestMethod.POST)
	public @ResponseBody RoomVO updateRoom(@RequestParam("control_pannel") String ctrl_pannel,@RequestParam("value") String value,RoomVO rvo, HttpSession session) throws Exception{
		System.out.println(ctrl_pannel);
		System.out.println(value);
		
		System.out.println(rvo.getMemId());
		RoomVO cvo = rservice.getRoominfo(rvo);		
		
		switch(ctrl_pannel) {
		case "aircon":
			cvo.setAircon(value);
			System.out.println("updateroom setAircon:"+cvo.getAircon());
			break;
		case "tv":
			cvo.setTv(value);
			System.out.println("updateroom setTv:"+cvo.getTv());
			break;
		case "window":
			cvo.setWindow(value);
			System.out.println("updateroom setWindow:"+cvo.getWindow());
			break;		
		case "light":
			cvo.setLight(value);
			System.out.println("updateroom setLight:"+cvo.getLight());
			break;		
		}
		rservice.updateRoomInfo(cvo);		
		RoomVO revo = rservice.getRoominfo(cvo);
		System.out.println(cvo.getAircon());
		System.out.println(cvo.getTv());
		System.out.println(cvo.getWindow());
		System.out.println(cvo.getLight());
		return revo;
		
		
	}
}
