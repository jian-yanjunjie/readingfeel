package org.lanqiao.yhxxgl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.lanqiao.yhxxgl.entity.BookInfo;

public interface SendMapper {
	@Insert("insert into bookinfo(bookinfo_id,book_theme,book_words,book_user,book_creattime,book_postid) values(uuid(),#{bookTheme},#{bookWords},#{bookUser},SYSDATE(),#{bookPostid})")
	boolean Send(BookInfo bookInfo);
	//按书帖类型查询
	@Select("SELECT * from bookinfo b where b.book_postid =#{bookpostType} ORDER BY b.book_creattime desc" )
	@ResultMap("org.lanqiao.yhxxgl.dao.SendMapper.UserResult")
	List<BookInfo> select(String bookpostType);
	//按用户查询书帖
	@Select("SELECT * from bookinfo b where b.book_user =#{userinfoId} ORDER BY b.book_creattime desc")
	@ResultMap("org.lanqiao.yhxxgl.dao.SendMapper.UserResult")
	List<BookInfo> userPost(String userinfoId);
	//查询热门书帖
	@Select("SELECT * from bookinfo b  ORDER BY b.book_creattime desc")
	@ResultMap("org.lanqiao.yhxxgl.dao.SendMapper.UserResult")
	List<BookInfo> hotPost();
	
	//按主键查询书帖信息
	@Select("SELECT * from bookinfo b WHERE b.bookinfo_id=#{bookinfoId} ")
	@ResultMap("org.lanqiao.yhxxgl.dao.SendMapper.UserResult")
	BookInfo uiquePost(String bookinfoId);
	//按主键删除书帖
	@Delete("delete from bookinfo where bookinfo_id = #{bookinfoId}")
	boolean deleteBookPost(String bookinfoId);
}
