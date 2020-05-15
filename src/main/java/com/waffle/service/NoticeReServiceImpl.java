package com.waffle.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.waffle.dao.NoticeReDAO;
import com.waffle.vo.NoticeReVO;

@Service
public class NoticeReServiceImpl implements NoticeReService{
	
	@Inject
	private NoticeReDAO dao;
	
	@Override
	public List<NoticeReVO> readReply(int nno) throws Exception {
		return dao.readReply(nno);
	}

	@Override
	public void writeReply(NoticeReVO vo) throws Exception {
		dao.writeReply(vo);
		
	}
	// 댓글 수정
	@Override
	public void updateReply(NoticeReVO vo) throws Exception {
		dao.updateReply(vo);
		
	}
	// 댓글 삭제
	@Override
	public void deleteReply(NoticeReVO vo) throws Exception {
		dao.deleteReply(vo);
		
	}
	// 선택된 댓글 조회 
	@Override
	public NoticeReVO selectReply(int rno) throws Exception {
		
		return dao.selectReply(rno);
	}	
}