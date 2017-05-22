package com.poorip.crawling;

import java.io.File;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class HtmlParser {
	public static void main(String[] args) throws IOException {

		for (int i = 0; i < 60000; i++) {

			Document doc = Jsoup.parse(new File("C:/phantomjs-javascript/testTexts/navercafe-" + i + ".html"), "UTF-8");

			Elements elements = doc.select("#postContent, #commentArea");
			/* Elements elements2 = doc.select("#commentArea"); */
			Elements elements3 = doc.select(".post_title a.tit_menu span.ellip");
			Elements elements4 = doc.select(".post_title .info em");

			String text = elements.text();
			/* String text2 = elements2.text(); */
			String text3 = elements3.text();
			String text4 = elements4.text();

			if (text3.equals("이탈리아")) {
				System.out.println(text);
				System.out.println(text4);
			}
		}
	}
}
