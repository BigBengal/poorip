package com.poorip.crawling;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class GetCrawling {
	public static void main(String[] args) {
        String clientId = "hFvgx9eBosjhlAvLoofT";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "q01mjmJBnU";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode("런던", "UTF-8");
            String apiURL = "http://blog.naver.com/ch3495?Redirect=Log&amp;logNo=221006592099"; // json 결과
            String cafeURL = "https://openapi.naver.com/v1/search/cafearticle?query=" + text;
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            URL url2 = new URL(cafeURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            HttpURLConnection con2 = (HttpURLConnection)url2.openConnection();
            con.setRequestMethod("GET");
            con2.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con2.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            con2.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            int responseCode2 = con2.getResponseCode();
            System.out.println(responseCode2);
            System.out.println(responseCode);
            BufferedReader br;
            BufferedReader br2;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            if(responseCode2==200) {
            	br2 = new BufferedReader(new InputStreamReader(con2.getInputStream()));
            	System.out.println(br2);
            }else {  // 에러 발생
                br2 = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            String inputLine;
            StringBuffer response = new StringBuffer();
            StringBuffer response2 = new StringBuffer();
            
            while ((inputLine = br.readLine()) != null) {
            	System.out.println(inputLine.toString());
                response.append(inputLine);
                
            }
            while ((inputLine = br2.readLine()) != null) {
                response2.append(inputLine);
                
            }
            BufferedWriter bwr = new BufferedWriter(new FileWriter(new File("d:/demo.txt")));
            br.close();
            System.out.println(response.toString());
            bwr.write(response.toString());
            bwr.write(response2.toString());
            bwr.flush();
            bwr.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
