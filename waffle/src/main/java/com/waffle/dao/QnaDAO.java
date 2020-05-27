package com.waffle.dao;

import java.util.List;
import java.util.Map;

import com.waffle.vo.QSearchCriteria;
import com.waffle.vo.QnaCri;
import com.waffle.vo.QnaVO;

public interface QnaDAO {

	//게시물 목록 조회
	public List<QnaVO> qnaList(QSearchCriteria scri) throws Exception;
	//게시물 총 갯수
	public int listCount(QSearchCriteria scri) throws Exception;
	//게시물 상세보기
	public QnaVO qnaRead(int qbno) throws Exception;
	//게시판 글 작성
	public void write(QnaVO boardVO) throws Exception;
	//게시판 글 수정
	public void update(QnaVO boardVO) throws Exception;
	//게시판 글 삭제
	public void delete(int qbno) throws Exception;
	//첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	//첨부파일 조회
	public List<Map<String,Object>> selectFileList(int qbno) throws Exception;
	//첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	//첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
	//게시판 조회수
	public void boardHit(int qbno) throws Exception;
	//게시판 비밀번호 등록
	public QnaVO qnaPass(int qbno) throws Exception;
	
}
