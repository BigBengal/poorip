package com.poorip.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.poorip.vo.CategoryVo;
import com.poorip.vo.CityVo;
import com.poorip.vo.CountryVo;
import com.poorip.vo.PostPicVo;
import com.poorip.vo.PostVo;
import com.poorip.vo.ReviewVo;
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
	
	public List<PostPicVo> getPostPicList() {
		return sqlSession.selectList( "postpic.getList" );
	}
	
	public List<CountryVo> getCountryList() {
		return sqlSession.selectList( "country.getList" );
	}

	public List<CityVo> getCityList() {
		return sqlSession.selectList( "city.getList" );
	}
	
	public boolean deletePostPic(PostPicVo postPicVo) {
		int count = sqlSession.delete( "postpic.delete", postPicVo );
		return ( count == 1 );
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
		return (count == 1 );
	}

	public boolean addPost(PostVo postVo) {
		int count = sqlSession.insert( "post.addPost", postVo );
		return( count == 1 );
	}

	public boolean addPostPic(PostPicVo postPicVo ) {
		int count = sqlSession.insert( "postpic.addPostPic", postPicVo );
		return ( count == 1 );
	}
	
	public boolean deleteCountry(CountryVo countryVo) {
		int count = sqlSession.delete( "country.deleteBySeq", countryVo );
		return ( count == 1 );
	}

	public boolean deleteCity(CityVo cityVo) {
		int count = sqlSession.delete( "city.deleteBySeq", cityVo );
		return ( count == 1 );
	}

	public boolean addCity(CityVo cityVo) {
		int count = sqlSession.insert( "city.addcity", cityVo );
		return ( count == 1 );
	}
	
}
