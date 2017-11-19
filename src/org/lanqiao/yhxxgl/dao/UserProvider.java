package org.lanqiao.yhxxgl.dao;

import java.util.Map;

import org.lanqiao.yhxxgl.common.PagerComm;
import org.lanqiao.yhxxgl.entity.Pager;
import org.lanqiao.yhxxgl.util.StrUtil;

public class UserProvider {
	public String getUsers(Map<String, Object> map) {
		String username = (String) map.get("param1");
		String sfbz = (String) map.get("param2");
		Pager pager = (Pager) map.get("param3");

		StringBuffer sql = new StringBuffer();
		sql.append("select * from user_info where sfbz > 1 ");
		if (StrUtil.isNotEmpty(username)) {
			sql.append(" and username like '%" + username + "%'");
		}
		if (StrUtil.isNotEmpty(sfbz)) {
			sql.append(" and sfbz = " + sfbz);
		}
		String pagerSql = PagerComm.getMySqlPagerSql(sql.toString(), pager);

		return pagerSql;
	}

	public String getTotalRows(Map<String, Object> map) {
		String username = (String) map.get("param1");
		String sfbz = (String) map.get("param2");

		StringBuffer sql = new StringBuffer();
		sql.append("select count(*) from user_info where sfbz > 1 ");
		if (StrUtil.isNotEmpty(username)) {
			sql.append(" and username like '%" + username + "%'");
		}
		if (StrUtil.isNotEmpty(sfbz)) {
			sql.append(" and sfbz = " + sfbz);
		}

		return sql.toString();
	}
}
