package com.poorip.test;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.poorip.vo.UserVo;

public class userDaoTest {

//	@Autowired
//	private SqlSession sqlSession;
//	
//	public static void main(String[] args) {
//		System.out.println("User 테이블 Test 자료 추가");
//		// user table 추가
//		insert();
//		
//		//Database 확인 후 테스트 자료 삭제
//		//delete("testUser");
//	}
//
//	private static void delete(String email) {
//		sqlSession.delete("user.delete", email);
//	}
//
//
//	public static void insert() {
//		UserVo uservo = new UserVo();
//		uservo.setUsrEmail("teseUser");
//		
//		sqlSession.insert("user.insert", uservo);
//	}


}
