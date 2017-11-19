package org.lanqiao.yhxxgl.entity;

import java.io.Serializable;

public class BooktypeiInfo implements Serializable{
	private String booktypeinfoId;
	private String booktypeinfoNum;
	private String booktypeinfoName;
	public BooktypeiInfo(String booktypeinfoId, String booktypeinfoNum, String booktypeinfoName) {
		super();
		this.booktypeinfoId = booktypeinfoId;
		this.booktypeinfoNum = booktypeinfoNum;
		this.booktypeinfoName = booktypeinfoName;
	}
	public BooktypeiInfo() {
		super();
	}
	@Override
	public String toString() {
		return "BooktypeiInfo [booktypeinfoId=" + booktypeinfoId + ", booktypeinfoNum=" + booktypeinfoNum
				+ ", booktypeinfoName=" + booktypeinfoName + "]";
	}
	public String getBooktypeinfoId() {
		return booktypeinfoId;
	}
	public void setBooktypeinfoId(String booktypeinfoId) {
		this.booktypeinfoId = booktypeinfoId;
	}
	public String getBooktypeinfoNum() {
		return booktypeinfoNum;
	}
	public void setBooktypeinfoNum(String booktypeinfoNum) {
		this.booktypeinfoNum = booktypeinfoNum;
	}
	public String getBooktypeinfoName() {
		return booktypeinfoName;
	}
	public void setBooktypeinfoName(String booktypeinfoName) {
		this.booktypeinfoName = booktypeinfoName;
	}

}
