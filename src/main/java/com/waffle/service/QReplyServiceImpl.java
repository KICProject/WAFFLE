package com.waffle.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.waffle.dao.QReplyDAO;
import com.waffle.vo.QReplyVO;

@Service
public class QReplyServiceImpl implements QReplyService {
	@Inject
	private QReplyDAO dao;
	
	@Override
	public List<QReplyVO> readReply(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readReply(qbno);
	}
	//댓글 수정
	@Override
	public void updateReply(QReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateReply(vo);
		
	}
	//댓글 삭제
	@Override
	public void deleteReply(QReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(vo);
		
	}
	//댓글 조회
	   @Override
	   public QReplyVO selectReply(int qrno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectReply(qrno);
    }
	   
	   @Override
	public void writeReply(QReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		   dao.writeReply(vo);
		
	}


	

}
