package org.lanqiao.yhxxgl.service;

import org.lanqiao.yhxxgl.dao.UserMapper;
import org.lanqiao.yhxxgl.entity.UserInfo;
import org.lanqiao.yhxxgl.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserInfoService {
	@Autowired
	private UserMapper userMapper;
	/**
	 * 功能描述：新增用户
	 * @param user
	 * @return 添加成功返回true,失败返回false
	 */
	public boolean addUser(UserInfo userInfo) {
		boolean ret = userMapper.addUser(userInfo);
		return ret;
	}
	/**
	 * 功能描述：获取单个用户
	 * @return 用户user
	 */
	public UserInfo getUser(UserInfo userinfo){
		userinfo = userMapper.getUser(userinfo);
		return userinfo;
	}
	/**
	 * 功能描述：修改用户密码
	 * @param UserInfo
	 * @return 添加成功返回true,失败返回false
	 */
	public boolean updatePwd(UserInfo userInfo) {
		boolean ret = userMapper.updatePwd(userInfo);
		return ret;
	}
}
