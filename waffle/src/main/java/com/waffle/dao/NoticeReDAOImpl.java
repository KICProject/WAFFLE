package com.waffle.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waffle.vo.NoticeReVO;

@Repository
public class NoticeReDAOImpl implements NoticeReDAO{
	
	@Inject 
	SqlSession sql;
	
	//댓글 조회
	@Override
	public List<NoticeReVO> readReply(int nno) throws Exception {
		return sql.selectList("nreplyMapper.readReply",  nno);
	}

	//댓글 작성 
	@Override
	public void writeReply(NoticeReVO vo) throws Exception {
		sql.insert("nreplyMapper.writeReply", vo);
		
	}
	//댓글 수정
	@Override
	public void updateReply(NoticeReVO vo) throws Exception {
		sql.update("nreplyMapper.updateReply", vo);
		
	}
	//댓글 삭제
	@Override
	public void deleteReply(NoticeReVO vo) throws Exception {
		sql.delete("nreplyMapper.deleteReply", vo);
		
	}
	//선택된 댓글 조회 
	@Override
	public NoticeReVO selectReply(int rno) throws Exception {
		
		return sql.selectOne("nreplyMapper.selectReply", rno);
	}	
}
