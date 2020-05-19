package com.waffle.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waffle.vo.QReplyVO;


@Repository
public class QReplyDAOImpl implements QReplyDAO {

	@Inject SqlSession sql;
	
	@Override
	public List<QReplyVO> readReply(int qbno) throws Exception {
		// TODO Auto-generated method stub
			return sql.selectList("qreplyMapper.readReply",qbno);		
	}
	
	//댓글 수정
    @Override
    public void updateReply(QReplyVO vo) throws Exception {
    	// TODO Auto-generated method stub
    	sql.update("qreplyMapper.updateReply",vo);
    	
    }
    //댓글 삭제
    @Override
    public void deleteReply(QReplyVO vo) throws Exception {
    	// TODO Auto-generated method stub
    	sql.delete("qreplyMapper.deleteReply",vo);
    	
    }
    //댓글 조회
    @Override
    public QReplyVO selectReply(int qrno) throws Exception {
    	// TODO Auto-generated method stub
    	return sql.selectOne("qreplyMapper.selectReply",qrno);
    }
    
    @Override
    public void writeReply(QReplyVO vo) throws Exception {
    	// TODO Auto-generated method stub
    	sql.insert("qreplyMapper.writeReply",vo);
    	
    }

	

	
	
}
