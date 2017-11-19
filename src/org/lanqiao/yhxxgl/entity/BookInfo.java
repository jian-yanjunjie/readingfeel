package org.lanqiao.yhxxgl.entity;

import java.io.Serializable;

public class BookInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String bookinfoId;
	private String bookTheme;
	private String bookWords;
	private String bookUser;
	private String bookCreattime;
	private String bookHitcount;
	private String bookIstop;
	private String bookPostid;
	private String bookAnswertime;
	private String bookUpperid;
	public BookInfo() {
		super();
	}
	public BookInfo(String bookinfoId, String bookTheme, String bookWords, String bookUser, String bookCreattime,
			String bookHitcount, String bookIstop, String bookPostid, String bookAnswertime, String bookUpperid) {
		super();
		this.bookinfoId = bookinfoId;
		this.bookTheme = bookTheme;
		this.bookWords = bookWords;
		this.bookUser = bookUser;
		this.bookCreattime = bookCreattime;
		this.bookHitcount = bookHitcount;
		this.bookIstop = bookIstop;
		this.bookPostid = bookPostid;
		this.bookAnswertime = bookAnswertime;
		this.bookUpperid = bookUpperid;
	}
	@Override
	public String toString() {
		return "BookInfo [bookinfoId=" + bookinfoId + ", bookTheme=" + bookTheme + ", bookWords=" + bookWords
				+ ", bookUser=" + bookUser + ", bookCreattime=" + bookCreattime + ", bookHitcount=" + bookHitcount
				+ ", bookIstop=" + bookIstop + ", bookPostid=" + bookPostid + ", bookAnswertime=" + bookAnswertime
				+ ", bookUpperid=" + bookUpperid + "]";
	}
	public String getBookinfoId() {
		return bookinfoId;
	}
	public void setBookinfoId(String bookinfoId) {
		this.bookinfoId = bookinfoId;
	}
	public String getBookTheme() {
		return bookTheme;
	}
	public void setBookTheme(String bookTheme) {
		this.bookTheme = bookTheme;
	}
	public String getBookWords() {
		return bookWords;
	}
	public void setBookWords(String bookWords) {
		this.bookWords = bookWords;
	}
	public String getBookUser() {
		return bookUser;
	}
	public void setBookUser(String bookUser) {
		this.bookUser = bookUser;
	}
	public String getBookCreattime() {
		return bookCreattime;
	}
	public void setBookCreattime(String bookCreattime) {
		this.bookCreattime = bookCreattime;
	}
	public String getBookHitcount() {
		return bookHitcount;
	}
	public void setBookHitcount(String bookHitcount) {
		this.bookHitcount = bookHitcount;
	}
	public String getBookIstop() {
		return bookIstop;
	}
	public void setBookIstop(String bookIstop) {
		this.bookIstop = bookIstop;
	}
	public String getBookPostid() {
		return bookPostid;
	}
	public void setBookPostid(String bookPostid) {
		this.bookPostid = bookPostid;
	}
	public String getBookAnswertime() {
		return bookAnswertime;
	}
	public void setBookAnswertime(String bookAnswertime) {
		this.bookAnswertime = bookAnswertime;
	}
	public String getBookUpperid() {
		return bookUpperid;
	}
	public void setBookUpperid(String bookUpperid) {
		this.bookUpperid = bookUpperid;
	}

}
