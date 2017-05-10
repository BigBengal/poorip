package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.ScrapCityVo;

@Repository
public class ScrapCityDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public boolean insert(ScrapCityVo scrapcityvo){
		return 1 == sqlSession.insert("scrapcity.insert", scrapcityvo);
	}
	
	public boolean update(ScrapCityVo scrapcityvo){
		return 1 == sqlSession.delete("scrapcity.update",scrapcityvo);
	}
	
	public ScrapCityVo select(ScrapCityVo scrapcityvo) {
		ScrapCityVo vo = sqlSession.selectOne("scrapcity.selectbyseq", scrapcityvo);
		return vo;
	}
	
	public List<ScrapCityVo> showCity(int usrSeq) {
		return sqlSession.selectList("scrap.showCity", usrSeq);
	}
	
	public boolean updateDate(ScrapCityVo scrapcityvo) {
		return 1== sqlSession.update("scrapcity.update", scrapcityvo);
	}
	
	public ScrapCityVo showTravelDuration (int usrSeq) {
		sqlSession.delete("scrapcity.deletetrvduration", usrSeq);
		return sqlSession.selectOne("scrapcity.selecttrvlduration", usrSeq);
	}
	
	
}
