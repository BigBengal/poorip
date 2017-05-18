package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.ReviewVo;
import com.poorip.vo.ScrapVo;
import com.poorip.vo.TravelInfoVo;
import com.poorip.web.util.WebUtil;

@Repository
public class TravelInfoDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<TravelInfoVo> getInfo( int ctySeq ) {
		return sqlSession.selectList( "travelInfo.getInfo", ctySeq );
	}
	
	public List<TravelInfoVo> getMainInfo() {
		return sqlSession.selectList("travelInfo.getInfomain");
	}
	
	public List<ScrapVo> categoryList( String userEmail ) {
		return sqlSession.selectList( "travelInfo.getScrapInfo", userEmail );
	}
	
	public List<ReviewVo> getReviews(int trvSeq) {
		return sqlSession.selectList("post.selectbytravelseq", trvSeq);
	}
	
	public List<ReviewVo> getReviewPics(int postSeq) {
		return sqlSession.selectList("postpic.selectreviewpic", postSeq);
	}
	
	public boolean insert( TravelInfoVo travelInfoVo ) {
		return 1 == sqlSession.insert( "travelInfo.insert", travelInfoVo );
	}
	
	public boolean update( TravelInfoVo travelInfoVo ) {
		return 1 == sqlSession.update( "travelInfo.update", travelInfoVo );
	}
	
	public boolean delete( TravelInfoVo travelInfoVo ) {
		return 1 == sqlSession.delete( "travelInfo.delete", travelInfoVo );
	}

	public List<TravelInfoVo> getKwdData( String keyword ) {
		return sqlSession.selectList( "travelInfo.getKwdData", keyword );
	 }
	
	public int getCitySeq( String cityName ) {
//		String cityName = WebUtil.checkNullParam("", cityName);
		return WebUtil.checkIntParam((Integer)sqlSession.selectOne( "travelInfo.getCitySeq", cityName ),0);
		
	}
	
	public List<ReviewVo> getReviewsByLikes(int trvSeq) {
		return sqlSession.selectList("post.getReviewsByLikes", trvSeq);
	}
	
	public int getPostLikeAjax(int postSeq) {
		if(sqlSession.selectOne("post.selectPostLikeAjax", postSeq)!=null) {
		return sqlSession.selectOne("post.selectPostLikeAjax", postSeq);
		}
		else {
			return 0;
		}
	}

	public int getCatSeq(int trvSeq1) {
		return sqlSession.selectOne( "travelInfo.getCatSeq", trvSeq1 );
	}
	
}
