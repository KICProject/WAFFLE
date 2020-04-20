
package com.waffle.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waffle.vo.NoticeCri;
import com.waffle.vo.NoticeSearchCri;
import com.waffle.vo.NoticeVO;

	@Repository
	public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(NoticeVO boardVO) throws Exception {
		sqlSession.insert("noticeMapper.insert", boardVO);		
	}
	
	//게시물 조회
	@Override
	public NoticeVO read(int nno) throws Exception {
		
		return sqlSession.selectOne("noticeMapper.read", nno);
	}
	// 게시물 수정
	@Override
	public void update(NoticeVO boardVO) throws Exception {
			
		sqlSession.update("noticeMapper.update", boardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int nno) throws Exception {
			
		sqlSession.delete("noticeMapper.delete", nno);
	}

	// 게시물 목록 조회 
	@Override
	public List<NoticeVO> list(NoticeSearchCri scri) throws Exception {
		
		return sqlSession.selectList("noticeMapper.listPage", scri);
	}

	// 게시물 총 개수 
	@Override
	public int listCount(NoticeSearchCri scri) throws Exception {
		
		return sqlSession.selectOne("noticeMapper.listCount", scri);
	}

	// 첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("noticeMapper.insertFile", map);
	}
	
	//첨부파일 조회 
	@Override
	public List<Map<String, Object>> selectFileList(int nno) throws Exception {
		
		return sqlSession.selectList("noticeMapper.selectFileList", nno);
	}

	// 첨부파일 다운로드 
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		
		return sqlSession.selectOne("noticeMapper.selectFileInfo", map);
	}

	//첨부파일 수정
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		
		sqlSession.update("noticeMapper.updateFile", map);		
	}

	//게시판 조회수 
	@Override
	public void boardHit(int nno) throws Exception {
	
		sqlSession.update("noticeMapper.boardHit", nno);
		
	}
	
}