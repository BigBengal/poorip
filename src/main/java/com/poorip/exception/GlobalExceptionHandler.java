package com.poorip.exception;

import java.io.PrintWriter;
import java.io.StringWriter;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.poorip.controller.AdminController;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	private static final Logger LOG = LoggerFactory.getLogger(AdminController.class);
	
	@ExceptionHandler( Exception.class )
	public String handleException( Exception e ) {
		// 1. log 처리
		StringWriter errors = new StringWriter();
		e.printStackTrace( new PrintWriter( errors ) );
		LOG.error( errors.toString() );
		
		// 2. 화면처리( 사용자한테 사과... )
		return "error/exception";
	}
}
