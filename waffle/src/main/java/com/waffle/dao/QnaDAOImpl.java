package com.waffle.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;


import com.waffle.vo.QSearchCriteria;
import com.waffle.vo.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject
	SqlSession sql;
	
	//게시물 목록보기
	@Override
	public List<QnaVO> qnaList(QSearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("qnaMapper.listPage",scri);
	}
	
	//게시물 총 갯수
	@Override
	public int listCount(QSearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("qnaMapper.listCount",scri);
	}
    
	//게시물 상세보기
	@Override
	public QnaVO qnaRead(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("qnaMapper.qnaRead",qbno);
	}
	
	//게시글 작성
	@Override
	public void write(QnaVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("qnaMapper.insert", boardVO);
	}
	
	//게시물 수정
	@Override
	public void update(QnaVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sql.update("qnaMapper.update",boardVO);
		
	}
	
	//게시물 삭제
	@Override
	public void delete(int qbno) throws Exception {
		// TODO Auto-generated method stub
		sql.delete("qnaMapper.delete",qbno);
		
	}
	//첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("qnaMapper.insertFile", map);
	}
	
	//첨부파일 조회,타입이 List 형식으로 한 이유는 나중에 여러개의 파일을 등록할 수 있도록 위함이다.
	@Override
	public List<Map<String, Object>> selectFileList(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("qnaMapper.selectFileList",qbno);
	}
	
	//첨부파일 다운
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("qnaMapper.selectFileInfo", map);
	}
	
	//첨부파일 수정,Map형태의 파라미터(map)를 받아 보내준다.(FILE_NO)
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sql.update("qnaMapper.updateFile", map);
	}
	
	//조회수 확인
	@Override
	public void boardHit(int qbno) throws Exception {
		// TODO Auto-generated method stub
		sql.update("qnaMapper.boardHit",qbno);
		
	}
	
	//비밀번호 체크
	@Override
	public QnaVO qnaPass(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("qnaMapper.qnaPass",qbno);
	}
	
	
	
}
