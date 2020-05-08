package com.waffle.service;


import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.waffle.dao.NoticeDAO;
import com.waffle.vo.NoticeCri;
import com.waffle.vo.NoticeSearchCri;
import com.waffle.vo.NoticeVO;

	@Service
	public class NoticeServiceImpl implements NoticeService {
	
	@Inject
	private NoticeDAO dao;
		
	// 게시글 작성
	@Override
	public void write(NoticeVO boardVO) throws Exception {
		dao.write(boardVO);
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
	
	//게시물 수정 
	@Override
	public void update(NoticeVO boardVO) throws Exception {
		
		dao.update(boardVO);
		
		
		
		
	}
}
