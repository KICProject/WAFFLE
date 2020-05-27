package com.waffle.dao;

import java.util.List;

import com.waffle.vo.NoticeReVO;
import com.waffle.vo.QReplyVO;


public interface QReplyDAO {
	//댓글 조회
	public List<QReplyVO> readReply(int qbno) throws Exception;
	
	//
	public void updateReply(QReplyVO vo) throws Exception;
		
	// �뙎湲� �궘�젣
	public void deleteReply(QReplyVO vo) throws Exception;
		
	// �꽑�깮�맂 �뙎湲� 議고쉶
	public QReplyVO selectReply(int qrno) throws Exception;
	
	//댓글 작성
	public void writeReply(QReplyVO vo) throws Exception;
}
