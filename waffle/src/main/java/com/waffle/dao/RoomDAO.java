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
	//온습도 
	public void updateAdu(RoomVO roomVO) throws Exception;
	//현재 조명상태 보기
	public String lightView(RoomVO roomVO) throws Exception;
	//조명 온오프
	public void lightonoff(RoomVO roomVO) throws Exception;
	//현재 티비상태 보기
	public String tvView(RoomVO roomVO) throws Exception;
	//티비 온오프
	public void tvonoff(RoomVO roomVO) throws Exception;
	//현재 에어컨상태 보기
	public String airView(RoomVO roomVO) throws Exception;
	//에어컨 온오프
	public void aironoff(RoomVO roomVO) throws Exception;
	//현재 창문상태 보기
	public String windowView(RoomVO roomVO) throws Exception;
	//창문 온오프
	public void windowonoff(RoomVO roomVO) throws Exception;
	
	
}
