package com.waffle.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waffle.vo.NoticeCri;
import com.waffle.vo.NoticeSearchCri;
import com.waffle.vo.NoticeVO;

public interface NoticeService {
	
	//게시글 작성
	//public void write(BoardVO boardVO) throws Exception;
	
	// 게시글 작성
	public void write(NoticeVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception;
	
	//게시물 목록 조회
	public List<NoticeVO> list(NoticeSearchCri scri) throws Exception;
	
	//게시물 총 개수
	public int listCount(NoticeSearchCri scri) throws Exception;
	
	//게시물 조회 
	public NoticeVO read(int nno) throws Exception;
	
	// 게시물 수정
	public void update(NoticeVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
	
	//게시물 삭제 
	public void delete(int nno) throws Exception;	
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int nno) throws Exception;
	
	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	
	
	
}
