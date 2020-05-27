package com.waffle.service;

import java.util.List;

import com.waffle.vo.NoticeReVO;
import com.waffle.vo.QReplyVO;


public interface QReplyService {
	
	//댓글 조회
	public List<QReplyVO> readReply(int qbno) throws Exception;
	
	//�뙎湲� �닔�젙
	public void updateReply(QReplyVO vo) throws Exception;
		
	//�뙎湲� �궘�젣
	public void deleteReply(QReplyVO vo) throws Exception;
		
	//�꽑�깮�맂 �뙎湲� 議고쉶
	public QReplyVO selectReply(int qrno) throws Exception;
	
	//댓글 작성
	public void writeReply(QReplyVO vo) throws Exception;

}
