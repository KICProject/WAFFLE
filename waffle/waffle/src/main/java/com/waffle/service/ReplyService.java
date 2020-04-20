package com.waffle.service;

import java.util.List;

import com.waffle.vo.ReplyVO;

public interface ReplyService {
	
	//댓글 조회
	public List<ReplyVO> readReply(int bno) throws Exception;
	//댓글 작성
	public void writeReply(ReplyVO vo) throws Exception;
	//댓글수정
	public void updateReply(ReplyVO vo) throws Exception;
	//댓글삭제
	public void deleteReply(ReplyVO vo) throws Exception;
	//선택댓글조회
	public ReplyVO selectReply(int rno) throws Exception;
	
}
