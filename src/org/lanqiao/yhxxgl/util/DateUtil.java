package org.lanqiao.yhxxgl.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 描述：日期处理工具<br>
 * @author lsy<br>
 * @date 2016年4月5日<br>
 * @version V1.0<br>
 * email:lsy@lanqiao.org<br>
 * pos:衡水学院
 */
public final class DateUtil {
	/**
	 * 功能描述：获取格式器
	 * @param fmt 给定的格式
	 * @return 格式器
	 */
	public static SimpleDateFormat getSdf(String fmt) {
		SimpleDateFormat sdf = (SimpleDateFormat) DateFormat.getInstance();
		sdf.applyPattern(fmt);
		return sdf;
	}
	
	/**
	 * 功能描述：按格式获取当前日期的字符串形式
	 * @param fmt 日期格式
	 * @return 格式化的日期串
	 */
	public static String getNow(String fmt){
		return getSdf(fmt).format(new Date());
	}

	
	/**
	 * 功能描述：获取当前日期的14位字符串形式
	 * @return 日期
	 */
	public static String getNow(){
		return getNow("yyyyMMddHHmmss");
	}
	
	/**
	 * 功能描述：将日期字符串由 旧格式 转为指定的 新格式 形式
	 * @param dateStr 日期字符串
	 * @param oldFmt 日期原有的格式
	 * @param newFmt 新格式
	 * @return 新格式日期
	 */
	public static String fmtDateStr(String dateStr,String oldFmt,String newFmt){
		String ds = null;
		try {
			SimpleDateFormat sdf = getSdf(oldFmt);
			Date date = sdf.parse(dateStr);
			SimpleDateFormat sdf2 = getSdf(newFmt);
			ds = sdf2.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return ds;
	}
}
