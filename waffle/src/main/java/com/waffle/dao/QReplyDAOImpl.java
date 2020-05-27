package com.waffle.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waffle.vo.QReplyVO;


@Repository
public class QReplyDAOImpl implements QReplyDAO {

	@Inject SqlSession sql;
	
	//댓글 조회
	@Override
	public List<QReplyVO> readReply(int qbno) throws Exception {
		// TODO Auto-generated method stub
			return sql.selectList("qreplyMapper.readReply",qbno);		
	}
	
	//�뙎湲� �닔�젙
    @Override
    public void updateReply(QReplyVO vo) throws Exception {
    	// TODO Auto-generated method stub
    	sql.update("qreplyMapper.updateReply",vo);
    	
    }
    //�뙎湲� �궘�젣
    @Override
    public void deleteReply(QReplyVO vo) throws Exception {
    	// TODO Auto-generated method stub
    	sql.delete("qreplyMapper.deleteReply",vo);
    	
    }
    //�뙎湲� 議고쉶
    @Override
    public QReplyVO selectReply(int qrno) throws Exception {
    	// TODO Auto-generated method stub
    	return sql.selectOne("qreplyMapper.selectReply",qrno);
    }
    
    //댓글 작성
    @Override
    public void writeReply(QReplyVO vo) throws Exception {
    	// TODO Auto-generated method stub
    	sql.insert("qreplyMapper.writeReply",vo);
    	
    }

	

	
	
}
