package org.lanqiao.yhxxgl.entity;

public class CommentBook {
	private String id;
	private String bookinfoId;
	private String users;
	private String answertime;
	private String object;
	private String sortId;
	private String words;
	public CommentBook() {
		super();
	}
	
	public CommentBook(String id, String bookinfoId, String users, String answertime, String object, String sortId,
			String words) {
		super();
		this.id = id;
		this.bookinfoId = bookinfoId;
		this.users = users;
		this.answertime = answertime;
		this.object = object;
		this.sortId = sortId;
		this.words = words;
	}

	@Override
	public String toString() {
		return "CommentBook [id=" + id + ", bookinfoId=" + bookinfoId + ", users=" + users + ", answertime="
				+ answertime + ", object=" + object + ", sortId=" + sortId + ", words=" + words + "]";
	}

	public String getSortId() {
		return sortId;
	}

	public void setSortId(String sortId) {
		this.sortId = sortId;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBookinfoId() {
		return bookinfoId;
	}
	public void setBookinfoId(String bookinfoId) {
		this.bookinfoId = bookinfoId;
	}
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}
	public String getAnswertime() {
		return answertime;
	}
	public void setAnswertime(String answertime) {
		this.answertime = answertime;
	}
	public String getObject() {
		return object;
	}
	public void setObject(String object) {
		this.object = object;
	}
	public String getWords() {
		return words;
	}
	public void setWords(String words) {
		this.words = words;
	}
	
	
}
