package com.poorip.web.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.web.multipart.MultipartFile;

public class WebUtil {
	public static void forward(String path, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
	
	public static void sendRedirect(String url, HttpServletRequest request, HttpServletResponse response ) throws IOException{
		response.sendRedirect(url);
	}
	
	public static String checkNullParam(String s, String value) {
		return s != null ? s : value;
	}

	public static int checkNullParam(String s, int value) {
		return s != null ? checkIntParam(s, value) : value;
	}

	public static long checkNullParam(String s, long value) {
		return s != null ? checkLongParam(s, value) : value;
	}

	public static int checkIntParam(String s, int value) {
		return (s != null && s.matches("\\d*\\.?\\d+")) ? Integer.parseInt(s) : value;
	}
	
	public static int checkIntParam(Integer s, int value) {
		return (s != null ? s : value );
	}

	public static long checkLongParam(String s, long value) {
		return (s != null && s.matches("\\d*\\.?\\d+")) ? Long.parseLong(s) : value;
	}	
	
	
	public static String saveFile(MultipartFile multipartFile, String pathName) throws IOException{
		
		if (multipartFile.isEmpty() == true) {
			return "";
		}
		// 폴더가 없으면 폴더 생성
		File file = new File( pathName );
		if( file.isDirectory() == false )
			file.mkdirs();
		
		String orgFile = multipartFile.getOriginalFilename();
		String fileExtName = orgFile.substring( orgFile.lastIndexOf('.') + 1, orgFile.length() );
		String saveFile = generateSaveFileName( fileExtName );
		
		// 파일 저장
		IOUtils.copy( multipartFile.getInputStream(), new FileOutputStream( pathName + "/" + saveFile ) );
		
		// DB에 저장
		return saveFile;
		}
	
	public static String generateSaveFileName(String extName) {
		String fileName = "";
		Calendar calendar = Calendar.getInstance();

		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += ("." + extName);

		return fileName;
	}
	
}
