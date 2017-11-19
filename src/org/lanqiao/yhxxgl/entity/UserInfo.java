package org.lanqiao.yhxxgl.entity;

import java.io.Serializable;

public class UserInfo implements Serializable{
	private String userinfoId;
	private String userinfoNum;
	private String userinfoPwd;
	private String userinfoNick;
	private String userinfoEmail;
	private String userinfoIntroduce;
	public UserInfo() {
		super();
	}
	
	@Override
	public String toString() {
		return "UserInfo [userinfoId=" + userinfoId + ", userinfoNum=" + userinfoNum + ", userinfoPwd=" + userinfoPwd
				+ ", userinfoNick=" + userinfoNick + ", userinfoEmail=" + userinfoEmail + ", userinfoIntroduce="
				+ userinfoIntroduce + "]";
	}

	public UserInfo(String userinfoId, String userinfoNum, String userinfoPwd, String userinfoNick,
			String userinfoEmail, String userinfoIntroduce) {
		super();
		this.userinfoId = userinfoId;
		this.userinfoNum = userinfoNum;
		this.userinfoPwd = userinfoPwd;
		this.userinfoNick = userinfoNick;
		this.userinfoEmail = userinfoEmail;
		this.userinfoIntroduce = userinfoIntroduce;
	}

	public String getUserinfoId() {
		return userinfoId;
	}
	public void setUserinfoId(String userinfoId) {
		this.userinfoId = userinfoId;
	}
	public String getUserinfoNum() {
		return userinfoNum;
	}
	public void setUserinfoNum(String userinfoNum) {
		this.userinfoNum = userinfoNum;
	}
	public String getUserinfoPwd() {
		return userinfoPwd;
	}
	public void setUserinfoPwd(String userinfoPwd) {
		this.userinfoPwd = userinfoPwd;
	}
	public String getUserinfoNick() {
		return userinfoNick;
	}
	public void setUserinfoNick(String userinfoNick) {
		this.userinfoNick = userinfoNick;
	}
	public String getUserinfoEmail() {
		return userinfoEmail;
	}
	public void setUserinfoEmail(String userinfoEmail) {
		this.userinfoEmail = userinfoEmail;
	}

	public String getUserinfoIntroduce() {
		return userinfoIntroduce;
	}

	public void setUserinfoIntroduce(String userinfoIntroduce) {
		this.userinfoIntroduce = userinfoIntroduce;
	}
	
}
