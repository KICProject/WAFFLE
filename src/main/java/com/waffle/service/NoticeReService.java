package com.waffle.service;

import java.util.List;

import com.waffle.vo.NoticeReVO;

public interface NoticeReService {
	
	// 댓글 조회 
	public List<NoticeReVO> readReply(int nno) throws Exception;
	
	//댓글 작성
	public void writeReply(NoticeReVO vo) throws Exception;
	
	//댓글 수정
	public void updateReply(NoticeReVO vo) throws Exception;
	
	//댓글 삭제
	public void deleteReply(NoticeReVO vo) throws Exception;
	
	//선택된 댓글 조회
	public NoticeReVO selectReply(int rno) throws Exception;
}
