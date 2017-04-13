package com.poorip.security;

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
		
		// 컨테이너 가져오는 코드
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext( request.getServletContext() );		
		UserService userService = applicationContext.getBean( UserService.class );
		UserVo userVo = new UserVo();
		userVo.setUsrEmail(email);

		System.out.println("OK");
		logger.debug("before:"+userVo.toString());
		userVo = userService.getUser(userVo);
		logger.debug("after:"+userVo.toString());
		
		if(userVo == null || userVo.getUsrSeq() == 0) {
			response.sendRedirect(request.getContextPath()+"/user/loginform?result=fail");
			return false;
		}

		// 인증 처리
		HttpSession session = request.getSession( true );
		session.setAttribute("authUser", userVo);
		response.sendRedirect(request.getContextPath());
		
		return false; 
	}

	
}
