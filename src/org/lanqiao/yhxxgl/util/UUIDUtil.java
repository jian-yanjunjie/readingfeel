package org.lanqiao.yhxxgl.util;

import java.util.UUID;

/**
 * 描述：UUID 获取工具<br>
 * @author lsy<br>
 * @date 2016年4月5日<br>
 * @version V1.0<br>
 * email:lsy@lanqiao.org<br>
 * pos:衡水学院
 */
public final class UUIDUtil {
	/**
	 * 功能描述：获取32位的uuid，以作为数据库中的主键
	 * @return uuid
	 */
	public static final String getUUID(){
		UUID uuid = UUID.randomUUID(); 
		return uuid.toString().replace("-", "");
	}
}
