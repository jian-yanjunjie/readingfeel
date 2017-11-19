package org.lanqiao.yhxxgl.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.lanqiao.yhxxgl.entity.BookInfo;
import org.lanqiao.yhxxgl.entity.CommentBook;
import org.lanqiao.yhxxgl.entity.UserInfo;
import org.lanqiao.yhxxgl.service.CommentService;
import org.lanqiao.yhxxgl.service.SendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("Comment")
@Component
public class CommentController {
	@Autowired
	CommentService commentService;
	@Autowired
	SendService sendService;
	/**
	 * 功能描述：用户发表评论
	 * @param bookInfo
	 * @return 添加成功返回true,失败返回false
	 */
	@RequestMapping("pinglun")
	@ResponseBody
	public boolean pinglun(Model model,CommentBook commentBook,HttpSession session) {
		if (null == commentBook) {
			return false;
		}
		boolean ret = commentService.pinglun(commentBook);
		return ret;
	}
	/**
	 * 功能描述：根据主键查询书帖详细信息
	 * @param bookinfoId
	 * @return BookInfo
	 */
	@RequestMapping("bookidselect")
	@ResponseBody
	public BookInfo bookidselect(Model model,String bookinfoId){
		BookInfo bookInfo = sendService.bookidselect(bookinfoId);
		model.addAttribute("CommentBook", bookInfo);
		return bookInfo;
	}
	/**
	 * 功能描述：查询书帖评论信息
	 * @param bookinfoId
	 * @return BookInfo
	 */
	@RequestMapping("selectbookcomment")
	@ResponseBody
	public List<CommentBook> selectbookcomment(Model model,String bookinfoId){
		List<CommentBook> commentBook = commentService.selectbookcomment(bookinfoId);
		model.addAttribute("CommentBook", commentBook);
		return commentBook;
	}
}
