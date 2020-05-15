package com.waffle.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waffle.dao.QnaDAO;
import com.waffle.utils.QFileUtils;
import com.waffle.vo.QSearchCriteria;
import com.waffle.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Resource(name="qfileUtils")
	private QFileUtils qfileUtils;

	@Inject
	QnaDAO dao;
	
	@Override
	public List<QnaVO> qnaList(QSearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.qnaList(scri);
	}
	//寃뚯떆臾� 珥� 媛��닔
	@Override
	public int listCount(QSearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}

	@Override
	public QnaVO qnaRead(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return dao.qnaRead(qbno);
	}
	
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
	@Override
	public void update(QnaVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		dao.update(boardVO);
	}
	@Override
	public void delete(int qbno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(qbno);
	}
	@Override
	public List<Map<String, Object>> selectFileList(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(qbno);
	}
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(map);
	}
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
}
