package com.poorip.service;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.	junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.poorip.vo.UserVo;
//spring-test안에 들어있는 클래스로, spring을 띄워주고 annotation들을 사용할수 있게 해준다.
@RunWith(SpringJUnit4ClassRunner.class)

//context configuration이다. mybatis와 spring securiry를 사용하는 경우 대부분 아래와 같을 것이다.
@ContextConfiguration(locations = {
 "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
 "file:src/main/webapp/WEB-INF/spring/root-context.xml",
})
//ServletContext 을 autowired하면 서블릿 설정들을 가져올수 있다.
//그러려면 @WebAppCongifuration 이 필요하다.
@WebAppConfiguration
public class UserServiceTest {

	@Autowired
	public UserService userService;
	private UserVo userVo; 
	
	@Before
	public void setUp() throws Exception {
		userVo = new UserVo();
		userVo.setUsrSeq(13);
	}

	@Test
	public void testIsExistUser() {
		userVo.setUsrEmail("hanys123@gmail.com");
		assertEquals(userService.isExistUser(userVo), true);
		
	}

	@Test
	public void testGetUser() {
		userVo.setUsrEmail("hanys123@gmail.com");
		assertEquals(userService.getUser(userVo), userVo);
	}

	@Test
	public void testUpdateLoginTime() {
		assertEquals(userService.UpdateLoginTime(userVo), true);
	}

	@Test
	public void testUpdateRequiredInfo() {
		// 필수 정보 추가
		userVo.setUsrLang("KOR");
		userVo.setUsrGender("F");
		userVo.setUsrNick("Nick");
		userVo.setUsrBd("2010/01/01");
		assertEquals(userService.UpdateRequiredInfo(userVo), true);
	}

	@Test
	public void testUpdateOptionInfo() {
		// 옵션 정보 추가
		userVo.setUsrPref1("usrPref1");
		userVo.setUsrPref2("usrPref2");
		userVo.setUsrPref3("usrPref3");
		userVo.setUsrPref4("usrPref4");
		userVo.setUsrPref5("usrPref5");
		userVo.setUsrInfo("usrInfo");
		userVo.setUsrHashtag("usrHashtag");
		userVo.setUsrNoti("Y");
		assertEquals(userService.UpdateOptionInfo(userVo), true);
	}

	@Test
	public void testUpdateLang() {
		// 언어 정보 추가
		userVo.setUsrLang("KOR");
		assertEquals(userService.UpdateLang(userVo), true);
	}

	@Test
	public void testUpdateGender() {
		// 성별 정보 추가
		userVo.setUsrGender("F");
		assertEquals(userService.UpdateGender(userVo), true);
	}

	@Test
	public void testUpdateNick() {
		userVo.setUsrNick("Nick");
		assertEquals(userService.UpdateNick(userVo), true);
	}

	@Test
	public void testUpdateBirthday() {
		userVo.setUsrBd("2010/01/01");
		assertEquals(userService.UpdateBirthday(userVo), true);
	}

	@Test
	public void testUpdatePrefer() {
		userVo.setUsrPref1("usrPref1");
		userVo.setUsrPref2("usrPref2");
		userVo.setUsrPref3("usrPref3");
		userVo.setUsrPref4("usrPref4");
		userVo.setUsrPref5("usrPref5");
		assertEquals(userService.UpdatePrefer(userVo), true);
	}

	@Test
	public void testUpdateupdateinfohash() {
		userVo.setUsrInfo("usrInfo");
		userVo.setUsrHashtag("usrHashtag");
		assertEquals(userService.UpdateInfoHash(userVo), true);
	}

	@Test
	public void testUpdateNoti() {
		userVo.setUsrNoti("Y");
		assertEquals(userService.UpdateNoti(userVo), true);
	}
	
	@Test
	public void testUpdateBlack() {
		userVo.setUsrBlackYN("Y");
		assertEquals(userService.UpdateBlack(userVo), true);
	}

}
