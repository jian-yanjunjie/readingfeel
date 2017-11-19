package org.lanqiao.yhxxgl.dao;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.lanqiao.yhxxgl.entity.BookInfo;
import org.lanqiao.yhxxgl.entity.CommentBook;

public interface BookCommentMapper {
	//按主键查询书帖评论信息
	@Select("SELECT * from commentbook c where c.bookinfo_id=#{bookinfoId} ORDER BY answertime")
	@ResultMap("org.lanqiao.yhxxgl.dao.BookCommentMapper.UserResult")
	List<CommentBook> selectbookcomment(String bookinfoId);
	
	@Insert("insert into commentbook(id,bookinfo_id,users,answertime,object,words,sort_id) values(uuid(),#{bookinfoId},#{users},#{answertime},#{object},#{words},#{sortId})")
	boolean pinglun(CommentBook commentBook);
}
