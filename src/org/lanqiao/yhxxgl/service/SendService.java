package org.lanqiao.yhxxgl.service;

import java.util.List;

import org.lanqiao.yhxxgl.dao.SendMapper;
import org.lanqiao.yhxxgl.entity.BookInfo;
import org.lanqiao.yhxxgl.entity.CommentBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SendService {
	@Autowired
	private SendMapper sendMapper;
	/**
	 * 功能描述：用户发书贴
	 * @param bookInfo
	 * @return 添加成功返回true,失败返回false
	 */
	public boolean send(BookInfo bookInfo) {
		boolean ret = sendMapper.Send(bookInfo);
		return ret;
	}
	/**
	 * 功能描述：删除书贴
	 * @param bookInfo
	 * @return 添加成功返回true,失败返回false
	 */
	public boolean deleteBookPost(String bookinfoId) {
		boolean ret = sendMapper.deleteBookPost(bookinfoId);
		return ret;
	}
	/**
	 * 功能描述：按书帖类型查询
	 * @param bookpostType
	 * @return bookInfo
	 */
	public List<BookInfo> select(String bookpostType) {
		List<BookInfo> bookInfo = sendMapper.select(bookpostType);
		return bookInfo;
	}
	/**
	 * 功能描述：按书帖类型查询
	 * @param bookpostType
	 * @return bookInfo
	 */
	public List<BookInfo> userPost(String userinfoId) {
		List<BookInfo> bookInfo = sendMapper.userPost(userinfoId);
		return bookInfo;
	}
	/**
	 * 功能描述：查询热门书帖
	 * @param bookpostType
	 * @return bookInfo
	 */
	public List<BookInfo> hotPost() {
		List<BookInfo> bookInfo = sendMapper.hotPost();
		return bookInfo;
	}
	/**
	 * 功能描述：根据主键查询书帖信息
	 * @param bookpostType
	 * @return bookInfo
	 */
	public BookInfo bookidselect(String bookinfoId) {
		// TODO Auto-generated method stub
		return sendMapper.uiquePost(bookinfoId);
	}
}
