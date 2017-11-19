package org.lanqiao.yhxxgl.common;

import org.lanqiao.yhxxgl.entity.Pager;

public final class PagerComm {
	/**
	 * 功能描述：Orcal
	 */
	public static String getPagerSql(String innerSql,Pager pager){
		int minRow = pager.getPageSize() * (pager.getPageNo() - 1) + 1;
		int maxRow = pager.getPageSize() * pager.getPageNo();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from(");
		sql.append("select t1.* ,rownum rn from(");
		sql.append(innerSql);
		sql.append(")t1 where rownum <= " + maxRow);
		sql.append(")where rn >= " + minRow);
		return sql.toString();
	}
	
	/**
	 * 功能描述：MySql
	 */
	public static String getMySqlPagerSql(String sql,Pager pager){
		int minRow = pager.getPageSize() * (pager.getPageNo() - 1);
		sql += " limit "+minRow+" , "+pager.getPageSize();
		return sql;
		
		
	}
	
}
