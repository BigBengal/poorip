package com.poorip.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.poorip.vo.UserVo;

public class AuthUserHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		// 파라미터에 @AuthUser가 달려 있는지
		// 파라미터 형식이 authUser가 맞는지
		if( supportsParameter(parameter) == false ) {
			return WebArgumentResolver.UNRESOLVED;
		}

		// request 객체를 각각의 WAS의 종류에 따라 스프링에서 타입 반환
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		HttpSession session = request.getSession( false );
		if( session == null ){
			return WebArgumentResolver.UNRESOLVED;
		}
				
		return session.getAttribute("authUser");
	}
	
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		// @AuthUser 이노테이션이 달려 있지 않는지 확인
		AuthUser authUser = parameter.getParameterAnnotation(AuthUser.class );
		if( authUser == null) {
			return false;
		}
		
		// 파라미터 타입이 UserVo 인지 확인
		if (parameter.getParameterType().equals(UserVo.class) == false ) {
			return false;	
		}
			
		return true;
	}


}
