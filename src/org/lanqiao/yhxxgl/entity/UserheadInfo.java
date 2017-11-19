package org.lanqiao.yhxxgl.entity;

import java.io.Serializable;

public class UserheadInfo implements Serializable{
	private String userheadinfoId;
	private String userinfoId;
	private String userheadinfoImg;
	private String userheadinfoNum;
	public UserheadInfo(String userheadinfoId, String userinfoId, String userheadinfoImg, String userheadinfoNum) {
		super();
		this.userheadinfoId = userheadinfoId;
		this.userinfoId = userinfoId;
		this.userheadinfoImg = userheadinfoImg;
		this.userheadinfoNum = userheadinfoNum;
	}
	public UserheadInfo() {
		super();
	}
	@Override
	public String toString() {
		return "UserheadInfo [userheadinfoId=" + userheadinfoId + ", userinfoId=" + userinfoId + ", userheadinfoImg="
				+ userheadinfoImg + ", userheadinfoNum=" + userheadinfoNum + "]";
	}
	public String getUserheadinfoId() {
		return userheadinfoId;
	}
	public void setUserheadinfoId(String userheadinfoId) {
		this.userheadinfoId = userheadinfoId;
	}
	public String getUserinfoId() {
		return userinfoId;
	}
	public void setUserinfoId(String userinfoId) {
		this.userinfoId = userinfoId;
	}
	public String getUserheadinfoImg() {
		return userheadinfoImg;
	}
	public void setUserheadinfoImg(String userheadinfoImg) {
		this.userheadinfoImg = userheadinfoImg;
	}
	public String getUserheadinfoNum() {
		return userheadinfoNum;
	}
	public void setUserheadinfoNum(String userheadinfoNum) {
		this.userheadinfoNum = userheadinfoNum;
	}

}
