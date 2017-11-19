package org.lanqiao.yhxxgl.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.lanqiao.yhxxgl.entity.Pager;
import org.lanqiao.yhxxgl.entity.User;
import org.lanqiao.yhxxgl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@RequestMapping("yhxxgl")
@Component
@SessionAttributes("userinfo")//@SessionAttributes({"userinfo",{"temp"})//多个参数   注解方式将信息封装到session中
public class Controller{
	@Autowired
	private UserService userService;
		
	/**
	 * 功能描述：获取用户
	 */
	@RequestMapping("getUsers")
	private String getUsers(Model model,String yhm,String sfbz,Integer pageNo) throws ServletException, IOException {
		Pager pager = new Pager();
		if(null != pageNo){
			pager.setPageNo(pageNo);
		}
		List<User> list = userService.getUsers(yhm,sfbz,pager);
		
		//3、将加工好的数据交给页面		
		model.addAttribute("users", list);
		model.addAttribute("pager", pager);
		
		return "center";//请求转发
		//return "redirect:/center.jsp";//重定向
	}

	/**
	 * 功能描述：控制用户登录
	 */
	@RequestMapping("login")
	@ResponseBody
	private User login(Model model,User user){
//		user = userService.getUser(user);
//		if(null != user){
//			model.addAttribute("userinfo", user);//将用户信息放入session中
//		}
		return user;
	}
		
	/**
	 * 功能描述：控制用户注册
	 */
	@RequestMapping("register")
	@ResponseBody
	public boolean register(User user){
		return userService.addUser(user);
	}
	
	/**
	 * 功能描述：更新用户
	 */
//	@RequestMapping("updateUser")
//	@ResponseBody
//	public boolean updateUser(User user){
//		return userService.updateUser(user);
//	}
	
	/**
	 * 功能描述：删除用户
	 */
	@RequestMapping("deleteUser")
	@ResponseBody
	public boolean deleteUser(User user){
		return userService.deleteUser(user.getYhbh());
	}
}
