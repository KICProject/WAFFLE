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
	
	//댓글 조회
	@Override
	public List<QReplyVO> readReply(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readReply(qbno);
	}
	//�뙎湲� �닔�젙
	@Override
	public void updateReply(QReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateReply(vo);
		
	}
	//�뙎湲� �궘�젣
	@Override
	public void deleteReply(QReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteReply(vo);
		
	}
	//�뙎湲� 議고쉶
	   @Override
	   public QReplyVO selectReply(int qrno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectReply(qrno);
    }
	//댓글 작성
	   @Override
	public void writeReply(QReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		   dao.writeReply(vo);
		
	}


	

}
