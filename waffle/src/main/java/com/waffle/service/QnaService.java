package com.waffle.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waffle.vo.QSearchCriteria;
import com.waffle.vo.QnaVO;

public interface QnaService {
	
	//게시물 목록 조회
	public List<QnaVO> qnaList(QSearchCriteria scri) throws Exception;
	//게시물 총 갯수
	public int listCount(QSearchCriteria scri) throws Exception;
	//게시물 상세보기
	public QnaVO qnaRead(int qbno) throws Exception;
	//글 작성하기,첨부파일 파라미터를 받을 MultipartHttpServletRequest 추가
	public void write(QnaVO boardVO,MultipartHttpServletRequest qnaRequest) throws Exception;
	//게시물 수정하기
	public void update(QnaVO boardVO) throws Exception;
	//게시물 삭제
	public void delete(int qbno) throws Exception;
	//첨부파일 조회
	public List<Map<String,Object>> selectFileList(int qbno) throws Exception;
	//첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	//첨부파일 수정
	public void update(QnaVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest qnaRequest) throws Exception;
	//비밀번호 체크
	public QnaVO qnaPass(int qbno) throws Exception;
	
}
