package com.poorip.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public List<PostVo> getpostList(int usrSeq, int page) {
		Map<String , Object> map = new HashMap<String, Object>();
		map.put( "usrSeq", usrSeq);
		map.put( "page", page);
		
		return sqlSession.selectList( "post.getUserPostList", map );
	}

	public int getTotalCount(int usrSeq) {
		return sqlSession.selectOne( "post.getTotalCount", usrSeq );
	}

}
