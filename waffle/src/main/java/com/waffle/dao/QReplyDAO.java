package com.waffle.dao;

import java.util.List;

import com.waffle.vo.NoticeReVO;
import com.waffle.vo.QReplyVO;


public interface QReplyDAO {
	//댓글조회
	public List<QReplyVO> readReply(int qbno) throws Exception;
	
	// 댓글 수정
	public void updateReply(QReplyVO vo) throws Exception;
		
	// 댓글 삭제
	public void deleteReply(QReplyVO vo) throws Exception;
		
	// 선택된 댓글 조회
	public QReplyVO selectReply(int qrno) throws Exception;
	
	//댓글 작성
	public void writeReply(QReplyVO vo) throws Exception;
}
