package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.PostCommentVo;

@Repository
public class PostCommentDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public boolean write(PostCommentVo postCommentVo){
		return 1 == sqlSession.insert("postcomment.insert", postCommentVo);
	}
	
	public boolean delete(PostCommentVo postCommentVo){
		return 1 == sqlSession.delete("postcomment.delete",postCommentVo);
	}
	public boolean update(PostCommentVo postCommentVo){
		return 1 == sqlSession.update("postcomment.update",postCommentVo);
	}
		
	public List<PostCommentVo> getCommentListbyPostSeq(int seq){
		return sqlSession.selectList("postcomment.getcommentlist", seq);
	}
	
	public PostCommentVo getCommentbyPostCommentSeq(int commentSeq){
		return sqlSession.selectOne("postcomment.getcomment", commentSeq);
	}

}
