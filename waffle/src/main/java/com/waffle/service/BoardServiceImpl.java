package com.waffle.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.waffle.dao.BoardDAO;
import com.waffle.vo.BoardVO;
import com.waffle.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}
	
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);		
	}
	
	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception{
		return dao.read(bno);
	}
	@Override
	public void update(BoardVO boardVO) throws Exception {

		dao.update(boardVO);
	}

	@Override
	public void delete(int bno) throws Exception {
		
		dao.delete(bno);
	}
}