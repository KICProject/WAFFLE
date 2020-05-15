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

}
