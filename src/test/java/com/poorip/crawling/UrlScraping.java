package com.poorip.crawling;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class UrlScraping {
	public static void main(String[] args) throws IOException {
		
		String urlParameters = "param1=a&param2=b&param3=c";
	String request = "http://cafe.naver.com/CommentView.nhn?search.clubid=10209062&search.articleid=4722870&search.page=1";
	URL url = new URL(request);
	
	HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	System.out.println(connection);
	
	connection.setDoOutput(true);
	connection.setDoInput(true);
	connection.setInstanceFollowRedirects(false); 
	connection.setRequestMethod("POST"); 
	connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded"); 
	connection.setRequestProperty("charset", "utf-8");
	connection.setRequestProperty("Content-Length", "" + Integer.toString(urlParameters.getBytes().length));
	connection.setUseCaches (false);
	System.out.println(connection);
	DataOutputStream wr = new DataOutputStream(connection.getOutputStream ());
	wr.writeBytes(urlParameters);
	
	wr.flush();
	System.out.println(wr);
	wr.close();
	connection.disconnect();
	}
}
