package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.PostVo;
import com.poorip.vo.TravelInfoVo;

@Repository
public class SNSDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<TravelInfoVo> getTravelInfo() {
		return sqlSession.selectList( "travelInfo.getALLTravelInfo");
	}

	public List<PostVo> getpostList() {
		return sqlSession.selectList( "post.getUserPostList");
	}

}
