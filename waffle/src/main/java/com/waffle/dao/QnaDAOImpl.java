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
	
	@Override
	public List<QnaVO> qnaList(QSearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("qnaMapper.listPage",scri);
	}
	//寃뚯떆臾� 珥� 媛��닔
	@Override
	public int listCount(QSearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("qnaMapper.listCount",scri);
	}

	@Override
	public QnaVO qnaRead(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("qnaMapper.qnaRead",qbno);
	}
	@Override
	public void write(QnaVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("qnaMapper.insert", boardVO);
	}
	@Override
	public void update(QnaVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		sql.update("qnaMapper.update",boardVO);
		
	}
	@Override
	public void delete(int qbno) throws Exception {
		// TODO Auto-generated method stub
		sql.delete("qnaMapper.delete",qbno);
		
	}
	
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("qnaMapper.insertFile", map);
	}
	
	@Override
	public List<Map<String, Object>> selectFileList(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("qnaMapper.selectFileList",qbno);
	}
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("qnaMapper.selectFileInfo", map);
	}
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sql.update("qnaMapper.updateFile", map);
	}
	
	@Override
	public void boardHit(int qbno) throws Exception {
		// TODO Auto-generated method stub
		sql.update("qnaMapper.boardHit",qbno);
		
	}
	@Override
	public QnaVO qnaPass(int qbno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("qnaMapper.qnaPass",qbno);
	}
	
	
	
}
