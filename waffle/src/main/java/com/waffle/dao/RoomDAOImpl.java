package com.waffle.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waffle.vo.RoomVO;
import com.waffle.vo.ServiceVO;

@Repository
public class RoomDAOImpl implements RoomDAO {

	@Inject SqlSession sql;
	// 결제된 서비스 정보를 통해 방을 생성
	@Override
	public void makeRoom(HttpSession session, RoomVO rvo, ServiceVO svo) throws Exception {
		svo = (ServiceVO)session.getAttribute("svo");
		rvo.setMemId(svo.getMemId());
		rvo.setServiceName(svo.getServiceName());
		rvo.setServiceId(svo.getServiceId());
		
		int roomCount = 0; //생성할 방의 최대 갯수
		int rNum = 1; // 시작 방 번호
		String serviceName = svo.getServiceName();
		if(serviceName.contentEquals("basic")) {
			roomCount = 0;
			for(int i=0; i<=roomCount;i++) {
				rvo.setRoomNumber(Integer.toString(rNum));
				rNum++;
				sql.insert("roomMapper.makeroom",rvo);				
			}
		}else if(serviceName.contentEquals("pro")) {
			roomCount = 2;
			for(int i=0; i<=roomCount;i++) {
				rvo.setRoomNumber(Integer.toString(rNum));
				rNum++;
				sql.insert("roomMapper.makeroom",rvo);				
			}
		}else if(serviceName.contains("ultimate")) {
			roomCount = 4;
			for(int i=0; i<=roomCount;i++) {
				rvo.setRoomNumber(Integer.toString(rNum));
				rNum++;
				sql.insert("roomMapper.makeroom",rvo);				
			}
		}
	}
	//방 정보를 업데이트 할 메소드
	@Override
	public void updateRoomInfo(RoomVO rvo) throws Exception {
		sql.update("roomMapper.updateroom", rvo);
	}

	@Override
	public RoomVO getRoominfo(RoomVO rvo) throws Exception {		
		return sql.selectOne("roomMapper.selectroom",rvo);
	}
	public void updateAdu(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("온도값 저장 ="+roomVO.getInnerTemp());
		sql.update("aduMapper.updateadu",roomVO);
	}
	@Override
	public String lightView(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("lightview");
	}
	@Override
	public void lightonoff(RoomVO roomVO) throws Exception{
		System.out.println("onoff값"+roomVO.getLight());
		sql.update("updatelight",roomVO);
	}
	@Override
	public void tvonoff(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("onoff값"+roomVO.getTv());
		sql.update("updatetv",roomVO);
	}
	@Override
	public String tvView(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("tvview");
	}
	@Override
	public void aironoff(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("onoff값"+roomVO.getAircon());
		sql.update("updateair",roomVO);
	}
	@Override
	public String airView(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("airview");
	}
	@Override
	public void windowonoff(RoomVO roomVO) throws Exception {
		System.out.println("창문 값"+roomVO.getWindow());
		sql.update("updatewindow",roomVO);
	}
	@Override
	public String windowView(RoomVO roomVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("windowview");
	}

}
