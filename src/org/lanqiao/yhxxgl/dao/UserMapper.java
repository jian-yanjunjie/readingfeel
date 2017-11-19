package org.lanqiao.yhxxgl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.lanqiao.yhxxgl.entity.Pager;
import org.lanqiao.yhxxgl.entity.User;
import org.lanqiao.yhxxgl.entity.UserInfo;

public interface UserMapper {
	
	@Select("select * from userinfo where userinfo_num=#{userinfoNum} and userinfo_pwd=#{userinfoPwd}")
	@ResultMap("org.lanqiao.yhxxgl.dao.UserMapper.UserResult")
	UserInfo getUser(UserInfo userInfo);
	
	@SelectProvider(type=UserProvider.class,method="getUsers")
	@ResultMap("org.lanqiao.yhxxgl.dao.UserMapper.UserResult")
	List<User> getUsers(String username,String sfbz,Pager pager);
	
	@SelectProvider(type=UserProvider.class,method="getTotalRows")
	int getTotalRows(String username,String sfbz);
	
	@Select("select '' from user_info where username = #{username}")
	@ResultMap("org.lanqiao.yhxxgl.dao.UserMapper.UserResult")
	User isExisted(String username);
	
	@Insert("insert into userinfo(userinfo_id,userinfo_num,userinfo_nick,userinfo_pwd,userinfo_email,userinfo_introduce) values(uuid(),#{userinfoNum},#{userinfoNick},#{userinfoPwd},#{userinfoEmail},#{userinfoIntroduce})")
	boolean addUser(UserInfo userinfo);
	
	@Delete("delete from user_info where yhbh = #{yhbh}")
	boolean deleteUser(String yhbh);
	
	@Update("update userinfo set userinfo_pwd = #{userinfoPwd} where userinfo_id = #{userinfoId}")
	boolean updatePwd(UserInfo userInfo);

	
}
