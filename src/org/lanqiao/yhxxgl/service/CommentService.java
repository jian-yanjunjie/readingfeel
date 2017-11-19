package org.lanqiao.yhxxgl.service;

import java.util.List;

import org.lanqiao.yhxxgl.dao.BookCommentMapper;
import org.lanqiao.yhxxgl.entity.BookInfo;
import org.lanqiao.yhxxgl.entity.CommentBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CommentService {
	@Autowired
	private BookCommentMapper bookCommentMapper;
	/**
	 * 功能描述：用户发书贴
	 * @param bookInfo
	 * @return 添加成功返回true,失败返回false
	 */
	public boolean pinglun(CommentBook commentBook) {
		boolean ret = bookCommentMapper.pinglun(commentBook);
		return ret;
	}
	/**
	 * 功能描述：按主键查询书帖评论信息
	 * @param bookinfoId
	 * @return CommentBook
	 */
	public List<CommentBook> selectbookcomment(String bookinfoId) {
		List<CommentBook> ret = bookCommentMapper.selectbookcomment(bookinfoId);
		return ret;
	}
}
