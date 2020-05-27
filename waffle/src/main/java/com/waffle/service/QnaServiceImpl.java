package com.waffle.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waffle.dao.QnaDAO;
import com.waffle.utils.QFileUtils;
import com.waffle.vo.QSearchCriteria;
import com.waffle.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {
	
	//QFileUtils를 사용할 수 있게 추가
	@Resource(name="qfileUtils")
	private QFileUtils qfileUtils;

	@Inject
	QnaDAO dao;
	//게시물 목록 조회
	@Override
	public List<QnaVO> qnaList(QSearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.qnaList(scri);
	}
	
	//게시물 총 갯수
	@Override
	public int listCount(QSearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
    //게시물 목록 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public QnaVO qnaRead(int qbno) throws Exception {
		// TODO Auto-generated method stub
		dao.boardHit(qbno);
		return dao.qnaRead(qbno);
	}
	
	//게시글 작성하기,Map타입의 List타입으로 list라는 이름에 qfileUtils.parseInsertFileInfo(boardVO, qnaRequest);를 받아온다.
	//for문을 써서 list의 size만큼 넣어주는 이유는 나중에 여러개의 첨부파일을 등록해주기 위함이다.
	@Override
	public void write(QnaVO boardVO,MultipartHttpServletRequest qnaRequest) throws Exception {
		// TODO Auto-generated method stub
		dao.write(boardVO);
		
		List<Map<String,Object>> list = qfileUtils.parseInsertFileInfo(boardVO, qnaRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
		
	}
	
	//게시물 수정하기
	@Override
	public void update(QnaVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		dao.update(boardVO);
	}
	
	//게시물 삭제
	@Override
	public void delete(int qbno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(qbno);
	}
	
	//첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(qbno);
	}
	
	//첨부파일 다운
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(map);
	}
	
	//게시물 수정하기
	@Override
	public void update(QnaVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest qnaRequest)
			throws Exception {
		dao.update(boardVO);
		
		List<Map<String, Object>> list = qfileUtils.parseUpdateFileInfo(boardVO, files, fileNames, qnaRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				dao.insertFile(tempMap);
			}else {
				dao.updateFile(tempMap);
			}
		
	}

  }
	
	//게시물 비밀번호 등록
	@Override
	public QnaVO qnaPass(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return dao.qnaPass(qbno);
	}
	
}
