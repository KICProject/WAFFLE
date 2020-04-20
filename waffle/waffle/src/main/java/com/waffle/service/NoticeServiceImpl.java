package com.waffle.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.waffle.dao.NoticeDAO;
import com.waffle.util.FileUtils;
import com.waffle.vo.NoticeCri;
import com.waffle.vo.NoticeSearchCri;
import com.waffle.vo.NoticeVO;

	@Service
	public class NoticeServiceImpl implements NoticeService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
		
	@Inject
	private NoticeDAO dao;
		
	// 게시글 작성
	@Override
	public void write(NoticeVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(boardVO);
			
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(boardVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	}
	
	//게시물 조회 
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public NoticeVO read(int nno) throws Exception {
			dao.boardHit(nno);
		return dao.read(nno);
	}
	
	//게시물 삭제 
	@Override
	public void delete(int nno) throws Exception {
		
		dao.delete(nno);
		
	}

	//게시물 목록 조회
	@Override
	public List<NoticeVO> list(NoticeSearchCri scri) throws Exception {
		
		return dao.list(scri);
	}

	//게시물 총 개수 
	@Override
	public int listCount(NoticeSearchCri scri) throws Exception {
		
		return dao.listCount(scri);
	}

	//첨부파일 조회 
	@Override
	public List<Map<String, Object>> selectFileList(int nno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(nno);
	}

	//첨부파일 다운로드 
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		
		return dao.selectFileInfo(map);
	}

	//게시물 수정 
	@Override
	public void update(NoticeVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		
		dao.update(boardVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(boardVO, files, fileNames, mpRequest);
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
