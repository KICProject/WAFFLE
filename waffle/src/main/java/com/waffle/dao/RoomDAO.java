package com.waffle.dao;

import javax.servlet.http.HttpSession;

import com.waffle.vo.RoomVO;
import com.waffle.vo.ServiceVO;

public interface RoomDAO {
	
	
	//결제된 서비스 정보를 통해 방의 갯수대로 rvo를 생성할 수 있도록 하는 method
	public void makeRoom(HttpSession session, RoomVO rvo, ServiceVO svo) throws Exception;
	//로그인 한 상태에서, room을 셀렉트하면 해당하는 정보를 가져올 것;
	public RoomVO getRoominfo(RoomVO rvo) throws Exception;
	//컨트롤 판넬에서 on/off를 변경하면, roomInfo가 변경되고, 그 정보또한 가져올것
	public void updateRoomInfo(RoomVO rvo) throws Exception;
	
	
	
}
