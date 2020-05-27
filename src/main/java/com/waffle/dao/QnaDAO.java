package com.waffle.dao;

import java.util.List;
import java.util.Map;

import com.waffle.vo.QSearchCriteria;
import com.waffle.vo.QnaCri;
import com.waffle.vo.QnaVO;

public interface QnaDAO {

	//疫뀐옙 筌뤴뫖以� 癰귣떯由� 
	public List<QnaVO> qnaList(QSearchCriteria scri) throws Exception;
	//寃뚯떆臾� 珥� 媛��닔
	public int listCount(QSearchCriteria scri) throws Exception;
	//疫뀐옙 占쎄맒占쎄쉭 癰귣떯由� 
	public QnaVO qnaRead(int qbno) throws Exception;
	//野껊슣�뻻疫뀐옙 占쎌삂占쎄쉐
	public void write(QnaVO boardVO) throws Exception;
	//野껊슣�뻻�눧占� 占쎈땾占쎌젟
	public void update(QnaVO boardVO) throws Exception;
	//野껊슣�뻻�눧占� 占쎄텣占쎌젫
	public void delete(int qbno) throws Exception;
	//泥⑤��뙆�씪 �뾽濡쒕뱶
	public void insertFile(Map<String, Object> map) throws Exception;
	//泥⑤��뙆�씪 議고쉶
	public List<Map<String,Object>> selectFileList(int qbno) throws Exception;
	//泥⑤��뙆�씪 �떎�슫
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	//泥⑤��뙆�씪 �닔�젙
	public void updateFile(Map<String, Object> map) throws Exception;
	//게시판 조회수
	public void boardHit(int qbno) throws Exception;
	
	public QnaVO qnaPass(int qbno) throws Exception;
	
}
