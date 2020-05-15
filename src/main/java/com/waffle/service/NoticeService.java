package com.waffle.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waffle.vo.NoticeCri;
import com.waffle.vo.NoticeSearchCri;
import com.waffle.vo.NoticeVO;

public interface NoticeService {
	
	// 게시글 작성
	public void write(NoticeVO boardVO) throws Exception;
	
	//게시물 목록 조회
	public List<NoticeVO> list(NoticeSearchCri scri) throws Exception;
	
	//게시물 총 개수
	public int listCount(NoticeSearchCri scri) throws Exception;
	
	//게시물 조회 
	public NoticeVO read(int nno) throws Exception;
	
	// 게시물 수정
	public void update(NoticeVO boardVO) throws Exception;
	
	//게시물 삭제 
	public void delete(int nno) throws Exception;	
	
}
