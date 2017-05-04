package com.poorip.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.PoolPartyVo;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.ReviewVo;
import com.poorip.vo.TravelInfoVo;
import com.poorip.web.util.WebUtil;

@Repository
public class SNSDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<TravelInfoVo> getTravelInfo() {
		return sqlSession.selectList( "travelInfo.getALLTravelInfo");
	}

	public List<ReviewVo> getpostList(int usrSeq, int page) {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put( "usrSeq", usrSeq);
		map.put( "page", page);
		
		return sqlSession.selectList( "post.getUserPostList", map );
	}

	public int getTotalCount(int usrSeq) {
		return sqlSession.selectOne( "post.getTotalCount", usrSeq );
	}

	public boolean addPost(ReviewVo reviewVo) {
		int count = sqlSession.insert( "post.addPost", reviewVo );
		return( count == 1 );
	}
	
	public boolean updatePost(ReviewVo reviewVo) {
		return 1 == sqlSession.update("post.updatePost", reviewVo);
	}

	public boolean addPostPic(PostPicVo postPicVo) {
		int count = sqlSession.insert( "postpic.insert", postPicVo );
		return ( count == 1 );
	}

	public List<ReviewVo> getAddPostList(int usrSeq) {
		return sqlSession.selectList( "post.getAddPostList", usrSeq );
	}

	public List<PostPicVo> getpostPicList(int postSeq) {
		return sqlSession.selectList( "postpic.getpostPicList", postSeq );
	}
	
	public List<ReviewVo> getPostListbyPoolSeq(int poolSeq, int page) {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put( "poolSeq", poolSeq);
		map.put( "page", page);
		return sqlSession.selectList( "post.getPostListbyPoolSeq", map );
	}
	
	public boolean increaseLike(int postSeq, int usrSeq) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("usrSeq", usrSeq);
		map.put("postSeq", postSeq);
		return 1== sqlSession.update("post.increasePostLike", map);
	}
	
	public Integer checkPostLike(int postSeq, int usrSeq) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("usrSeq", usrSeq);
		map.put("postSeq", postSeq);
		
		return sqlSession.selectOne("post.checkPostLike", map);
	}
	
	public boolean decreaseLike(int postSeq, int usrSeq) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("usrSeq", usrSeq);
		map.put("postSeq", postSeq);
		return 1== sqlSession.update("post.decreasePostLike", map);
	}
	
	public List<PostVo> showPostLike (int trvSeq, int usrSeq) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("trvSeq", trvSeq);
		map.put("usrSeq", usrSeq);
		
		return sqlSession.selectList("post.selectPostLike", map);
	}
	
	public List<PostVo> showAllPostSeqsofTravel(int trvSeq) {
		return sqlSession.selectList("post.selectAllPostSeqOfTravelInfo", trvSeq);
	}

	public boolean deletePost(PostVo postVo) {
		int count = sqlSession.delete( "post.delete", postVo);
		return ( count == 1 );
	}
	
	public boolean deletePicture(List<Integer> postPicSeqArray) {
		int count =0;
		for(int i=0; i < postPicSeqArray.size(); i++) {
			count = sqlSession.delete("postpic.delete", postPicSeqArray.get(i));
		}
		return count==1;
	}
	
	public PostVo showEditedPost(ReviewVo reviewVo) {
		return sqlSession.selectOne("post.getEditedPostList", reviewVo);
	}
	
	public boolean addPostOnly(ReviewVo reviewVo) {
		return 1== sqlSession.insert("post.insert", reviewVo);
	}

}
