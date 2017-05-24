package com.poorip.security;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.poorip.service.UserService;
import com.poorip.vo.UserVo;
public class AuthLoginInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(AuthLoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String email = request.getParameter("email");
		String addinfo = request.getParameter("addinfo");
		// 컨테이너 가져오는 코드
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext( request.getServletContext() );		
		UserService userService = applicationContext.getBean( UserService.class );
		UserVo userVo = new UserVo();
		userVo.setUsrEmail(email);


//		logger.debug("before:"+userVo.toString());
		userVo = userService.getUser(userVo);
//		logger.debug("after:"+userVo.toString());
		
		if(userVo == null || userVo.getUsrSeq() == 0 || userVo.getUsrEmail() == null) {
//			response.sendRedirect(request.getContextPath());
			request.setAttribute("login", "fail");
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/PooripMain.jsp");
			rd.forward(request, response);
			return false;
		}
		
		// 로그인 시간 저장
		userService.UpdateLoginTime(userVo);

		// 인증 처리
		HttpSession session = request.getSession( true );
		
		// 이미 세션이 있으면 저장 하지 않음
		if(session.getAttribute("authUser") != null ){
			response.sendRedirect(request.getContextPath()+"/user/facebookinfo");
		} else {
			session.setAttribute("authUser", userVo);
		}
		
		logger.info("Login OK "+email);
		
		// 최초 가입의 경우 세션에 저장하고 addinfo로 리턴하기 위해
		if (addinfo != null && "addinfo".equals(addinfo) ){
			response.sendRedirect(request.getContextPath()+"/user/addrtninfo");
		} else {
			response.sendRedirect(request.getContextPath()+"/user/facebookinfo");
		}
		
		return false; 
	}

	
}
