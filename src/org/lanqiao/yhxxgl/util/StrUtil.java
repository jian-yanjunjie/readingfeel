package org.lanqiao.yhxxgl.util;

public final class StrUtil {
	/**
	 * 功能描述：判断字符串是否为空
	 * @param str 待判断字符串
	 * @return str为空返回true，否则返回false
	 */
	public static final boolean isEmpty(String str){
		if(null == str){
			return true;
		}
		if(str.trim().equals("")){
			return true;
		}
		return false;
	}
	
	public static final boolean isNotEmpty(String str){
		return !isEmpty(str);
	}
}
