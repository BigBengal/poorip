package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poorip.vo.CategoryVo;
import com.poorip.vo.CityVo;
import com.poorip.vo.CountryVo;
import com.poorip.vo.TravelInfoVo;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSession sqlSession;

	public boolean addInfo(TravelInfoVo travelInfoVo) {
		int count = sqlSession.insert( "travelInfo.insert", travelInfoVo );
		return( count == 1 );
		
	}

//	public List<CityVo> getCityName(CityVo cityVo) {
//		return sqlSession.selectList( "city.getCityName", cityVo);
//	}

	public List<CityVo> getCityName() {
		return sqlSession.selectList( "city.getALLCity");
	}

//	public List<CategoryVo> getCategoryName(CategoryVo categoryVo) {
//		return sqlSession.selectList( "category.getCategoryName", categoryVo);
//	}
	
	public List<CategoryVo> getCategoryName() {
		return sqlSession.selectList( "category.getALLCategory");
	}

<<<<<<< HEAD
=======
	public List<TravelInfoVo> getList(int page) {
		return sqlSession.selectList( "travelInfo.getListByPage", page );
	}

>>>>>>> branch 'master' of https://github.com/BigBengal/poorip.git
//	public List<CountryVo> getCountryName(CountryVo countryVo) {
//		return sqlSession.selectList( "country.getCountryName", countryVo);
//	}


}
