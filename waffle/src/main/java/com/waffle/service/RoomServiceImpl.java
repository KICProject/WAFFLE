package com.waffle.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.waffle.dao.RoomDAO;
import com.waffle.vo.RoomVO;
import com.waffle.vo.ServiceVO;

@Service
public class RoomServiceImpl implements RoomService {

	@Inject RoomDAO rdao;
	
	
	
	@Override
	public void makeRoom(HttpSession session, RoomVO rvo, ServiceVO svo) throws Exception {
		rdao.makeRoom(session, rvo, svo);
	}
	
	//방 정보 업데이트 
	@Override
	public void updateRoomInfo(RoomVO rvo) throws Exception{
		System.out.println("service_update_rvo:"+rvo);
		rdao.updateRoomInfo(rvo);
	}
	@Override
	public RoomVO getRoominfo(RoomVO rvo) throws Exception {
		System.out.println("servcie_get_rvo:"+rvo);
		return rdao.getRoominfo(rvo);
	}
	@Override
	public String lightView(RoomVO roomVO) throws Exception {
	// TODO Auto-generated method stub
	return rdao.lightView(roomVO);
	}
	@Override
	public void lightonoff(RoomVO roomVO) throws Exception {
		rdao.lightonoff(roomVO);
		
	}
	@Override
	public String tvView(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		return rdao.tvView(roomVO);
	}
	
	@Override
	public void tvonoff(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		rdao.tvonoff(roomVO);
		
	}
	@Override
	public String airView(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		return rdao.airView(roomVO);
	}
	
	@Override
	public void aironoff(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		rdao.aironoff(roomVO);
		
	}
	@Override
	public String windowView(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		return rdao.windowView(roomVO);
	}
	@Override
	public void windowonoff(RoomVO roomVO) throws Exception {
		rdao.windowonoff(roomVO);
		
	}
	@Override
	public void updateAdu(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		rdao.updateAdu(roomVO);
	}
}
