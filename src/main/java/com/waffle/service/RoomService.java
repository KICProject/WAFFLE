package com.waffle.service;

import javax.servlet.http.HttpSession;

import com.waffle.vo.RoomVO;
import com.waffle.vo.ServiceVO;

public interface RoomService {
	
	//결제된 서비스 정보를 통해 방의 갯수대로 rvo를 생성할 수 있도록 하는 method
	public void makeRoom(HttpSession session, RoomVO rvo, ServiceVO svo) throws Exception;
	// 해당하는 방 정보 가져오기
	public RoomVO getRoominfo(RoomVO rvo) throws Exception;
	//방 정보를 업데이트 할 메소드
	public void updateRoomInfo(RoomVO rvo) throws Exception;
}
