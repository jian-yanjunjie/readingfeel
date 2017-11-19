package org.lanqiao.yhxxgl.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.lanqiao.yhxxgl.entity.BookInfo;
import org.lanqiao.yhxxgl.entity.UserInfo;
import org.lanqiao.yhxxgl.service.SendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("send")
@Component
public class BookPost {
	@Autowired
	SendService sendService;
	/**
	 * 功能描述：用户发书贴
	 * @param bookInfo
	 * @return 添加成功返回true,失败返回false
	 */
	@RequestMapping("sendbookfeel")
	@ResponseBody
	public boolean addUser(Model model,BookInfo bookInfo,HttpSession session) {
		if (null == bookInfo.getBookWords()) {
			return false;
		}
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		bookInfo.setBookUser(userInfo.getUserinfoNick());
		boolean ret = sendService.send(bookInfo);
		return ret;
	}
	/**
	 * 功能描述：按书帖类型查询
	 * @param bookpostType
	 * @return bookInfo
	 */
	@RequestMapping("bookselect")
	@ResponseBody
	public List<BookInfo> select(Model model,String bookpostType){
		if (null == bookpostType || "".equals(bookpostType)) {
			return null;
		}
		List<BookInfo> bookInfos = sendService.select(bookpostType);
		model.addAttribute("bookinfos", bookInfos);
		return bookInfos;
	}
	/**
	 * 功能描述：按用户查询
	 * @param bookpostType
	 * @return bookInfo
	 */
	@RequestMapping("userPost")
	@ResponseBody
	public List<BookInfo> userPost(Model model,HttpSession session){
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		List<BookInfo> bookInfos = sendService.userPost(userInfo.getUserinfoNick());
		model.addAttribute("bookinfos", bookInfos);
		return bookInfos;
	}
	/**
	 * 功能描述：热门书帖
	 * @param bookpostType
	 * @return bookInfo
	 */
	@RequestMapping("hotPost")
	@ResponseBody
	public List<BookInfo> hotPost(Model model){
		List<BookInfo> bookInfos = sendService.hotPost();
		model.addAttribute("bookinfos", bookInfos);
		return bookInfos;
	}
	/**
	 * 功能描述：根据主键删除书帖
	 * @param bookpostType
	 * @return bookInfo
	 */
	@RequestMapping("deleteBookPost")
	@ResponseBody
	public boolean deleteBookPost(String bookinfoId){
		
		return sendService.deleteBookPost(bookinfoId);
	}
}
