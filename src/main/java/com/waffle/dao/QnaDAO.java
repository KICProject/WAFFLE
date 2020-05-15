package com.waffle.dao;

import java.util.List;
import java.util.Map;

import com.waffle.vo.QSearchCriteria;
import com.waffle.vo.QnaCri;
import com.waffle.vo.QnaVO;

public interface QnaDAO {

	//湲� 紐⑸줉 蹂닿린 
	public List<QnaVO> qnaList(QSearchCriteria scri) throws Exception;
	//게시물 총 갯수
	public int listCount(QSearchCriteria scri) throws Exception;
	//湲� �긽�꽭 蹂닿린 
	public QnaVO qnaRead(int qbno) throws Exception;
	//寃뚯떆湲� �옉�꽦
	public void write(QnaVO boardVO) throws Exception;
	//寃뚯떆臾� �닔�젙
	public void update(QnaVO boardVO) throws Exception;
	//寃뚯떆臾� �궘�젣
	public void delete(int qbno) throws Exception;
	//첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	//첨부파일 조회
	public List<Map<String,Object>> selectFileList(int qbno) throws Exception;
	//첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	//첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
	
}
