package org.lanqiao.yhxxgl.control;

import javax.servlet.http.HttpSession;

import org.lanqiao.yhxxgl.entity.UserInfo;
import org.lanqiao.yhxxgl.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@RequestMapping("User")
@Component
@SessionAttributes("user")
public class UserController {
	@Autowired
	private UserInfoService userInfoService;
	/**
	 * 功能描述：控制用户注册
	 */
	@RequestMapping("register")
	@ResponseBody
	public boolean register(Model model,UserInfo userInfo){
		if (null == userInfo.getUserinfoNum()) {
			return false;
		}
		boolean ret = userInfoService.addUser(userInfo);
		if (ret) {
			UserInfo user = userInfoService.getUser(userInfo);
			model.addAttribute("user", user);
		}
		return ret;
	}
	/**
	 * 功能描述：控制用户登录
	 */
	@RequestMapping("login")
	@ResponseBody
	private UserInfo login(Model model,UserInfo userInfo){
		userInfo = userInfoService.getUser(userInfo);
		if(null != userInfo){
			model.addAttribute("user", userInfo);//将用户信息放入session中
			return userInfo;
		}
		return userInfo;
	}
	/**
	 * 功能描述：用户修改密码
	 */
	@RequestMapping("updatePwd")
	@ResponseBody
	public boolean updatePwd(Model model,UserInfo userInfo,HttpSession session){
		if (null == userInfo.getUserinfoPwd()) {
			return false;
		}
		UserInfo olduserInfo = (UserInfo) session.getAttribute("user");
		userInfo.setUserinfoId(olduserInfo.getUserinfoId());
		boolean ret = userInfoService.updatePwd(userInfo);
//		if (ret) {
//			UserInfo user = userInfoService.getUser(userInfo);
//			model.addAttribute("user", user);
//		}
		return ret;
	}
}
