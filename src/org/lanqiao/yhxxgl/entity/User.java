package org.lanqiao.yhxxgl.entity;

public class User {
	private String yhbh;
	private String username;
	private String pwd;
	private String sfbz;
	private String zcsj;
	
	public User() {}

	public User(String yhbh, String username, String pwd, String sfbz, String zcsj) {
		super();
		this.yhbh = yhbh;
		this.username = username;
		this.pwd = pwd;
		this.sfbz = sfbz;
		this.zcsj = zcsj;
	}

	public String getYhbh() {
		return yhbh;
	}

	public void setYhbh(String yhbh) {
		this.yhbh = yhbh;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSfbz() {
		return sfbz;
	}

	public void setSfbz(String sfbz) {
		this.sfbz = sfbz;
	}

	public String getZcsj() {
		return zcsj;
	}

	public void setZcsj(String zcsj) {
		this.zcsj = zcsj;
	}

	@Override
	public String toString() {
		return "User [yhbh=" + yhbh + ", username=" + username + ", pwd=" + pwd
				+ ", sfbz=" + sfbz + ", zcsj=" + zcsj + "]";
	}
	

}
