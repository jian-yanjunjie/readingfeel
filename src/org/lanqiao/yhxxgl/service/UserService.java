package org.lanqiao.yhxxgl.service;

import java.util.Iterator;
import java.util.List;

import org.lanqiao.yhxxgl.dao.UserMapper;
import org.lanqiao.yhxxgl.entity.Pager;
import org.lanqiao.yhxxgl.entity.User;
import org.lanqiao.yhxxgl.entity.UserInfo;
import org.lanqiao.yhxxgl.util.DateUtil;
import org.lanqiao.yhxxgl.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserService {
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 功能描述：获取单个用户
	 * @return 用户user
	 */
	public UserInfo getUser(UserInfo user){
//		user = userMapper.getUser(user);
//		if(null != user){
//			//数据加工处理
//			String sf = user.getSfbz();
//			if("1".equals(sf)){
//				sf = "管理员";
//			}else if("3".equals(sf)){
//				sf = "学生";
//			}else if("5".equals(sf)){
//				sf = "老师";
//			}
//			user.setSfbz(sf);
//			String zcsj = user.getZcsj();
//			zcsj = DateUtil.fmtDateStr(zcsj, "yyyyMMddHHmmss", "yyyy-MM-dd");
//			user.setZcsj(zcsj);
//		}
		return user;
	}
	
	/**
	 * 功能描述：获取单个用户
	 * @param name 用户名
	 * @param password 密码
	 * @return 用户user
	 */
	public List<User> getUsers(String username,String sfbz,Pager pager){
		int totalRows = userMapper.getTotalRows(username, sfbz);
		pager.setTotalPages(totalRows);
		List<User> list = userMapper.getUsers(username, sfbz, pager);
		//数据加工处理
		Iterator<User> it = list.iterator();
		while(it.hasNext()) {
			User user = (User) it.next();
			String sf = user.getSfbz();
			if("3".equals(sf)){
				sf = "学生";
			}else if("5".equals(sf)){
				sf = "老师";
			}
			user.setSfbz(sf);
			String zcsj = user.getZcsj();
			zcsj = DateUtil.fmtDateStr(zcsj, "yyyyMMddHHmmss", "yyyy-MM-dd");
			user.setZcsj(zcsj);
		}
		return list;
	}
	
	/**
	 * 功能描述：新增用户
	 * @param user
	 * @return 添加成功返回true,失败返回false
	 */
	public boolean addUser(User user) {
		String yhbh = UUIDUtil.getUUID();//生成用户编号
		String zcsj = DateUtil.getNow();//获取当前日期（14位字符串形式）
		user.setYhbh(yhbh);
		user.setZcsj(zcsj);
//		boolean ret = userMapper.addUser(user);
		return false;
	}
	
	/**
	 * 功能描述：更新用户密码
	 * @return 更新成功返回true,失败返回false
	 */
//	public boolean updateUser(User user) {
//		return userMapper.updateUser(user);
//	}
	
	/**
	 * 功能描述：删除用户（通过主键删除用户）
	 * @param yhbh 用户编号
	 * @return 删除成功返回true，失败返回false
	 */
	public boolean deleteUser(String yhbh) {
		return userMapper.deleteUser(yhbh);
	}

	/**
	 * 功能描述：判断用户名是否已经存在
	 * @param username 用户名
	 * @return 用户名存在返回true，不存在返回false
	 */
	public boolean isExisted(String username) {
		return userMapper.isExisted(username)!= null;
	}
}
