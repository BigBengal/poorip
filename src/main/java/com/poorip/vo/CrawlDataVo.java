package com.poorip.vo;

public class CrawlDataVo {
	int crawl_sequence;
	String title;
	String content;
	String pubDate;
	public int getCrawl_sequence() {
		return crawl_sequence;
	}
	public void setCrawl_sequence(int crawl_sequence) {
		this.crawl_sequence = crawl_sequence;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	@Override
	public String toString() {
		return "CrawlDataVo [crawl_sequence=" + crawl_sequence + ", title=" + title + ", content=" + content
				+ ", pubDate=" + pubDate + "]";
	}
	
	
}
