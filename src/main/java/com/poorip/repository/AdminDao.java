package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.CategoryVo;
import com.poorip.vo.CityVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.TravelInfoVo;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<CityVo> getCityName() {
		return sqlSession.selectList( "city.getALLCity");
	}
	
	public List<CategoryVo> getCategoryName() {
		return sqlSession.selectList( "category.getALLCategory");
	}

	public List<TravelInfoVo> getList() {
		return sqlSession.selectList( "travelInfo.getList" );
	}
	
	public boolean addInfo(TravelInfoVo travelInfoVo) {
		int count = sqlSession.insert( "travelInfo.insert", travelInfoVo );
		return( count == 1 );
	}

	public TravelInfoVo get(int trvSeq) {
		return sqlSession.selectOne( "travelInfo.getByNo", trvSeq );
	}

	public boolean deleteInfo(TravelInfoVo travelInfoVo) {
		int count = sqlSession.delete( "travelInfo.delete", travelInfoVo );
		return ( count == 1 );
	}

	public List<PostVo> getPostList() {
		return sqlSession.selectList( "post.getPostList" );
	}

	public boolean deletePost(PostVo postVo) {
		int count = sqlSession.delete( "post.delete", postVo );
		return (count ==1 );
	}

}
