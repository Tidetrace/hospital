package com.zhiyou.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils
{
	/**
	 * 以yyyy-MM-dd HH:mm:ss格式获取当前时间
	 * @param date
	 * @return
	 */
	public static String getCurrTime()
	{
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(date);
	}
	
	/**
	 * 计算两个时间的分钟差 格式yyyy-MM-dd HH:mm:ss
	 * @param fromDate
	 * @param toDate
	 * @return
	 * @throws ParseException 
	 */
	public static String getMinute(String fromDate, String toDate) throws ParseException
	{
		// 获取日期格式化工具
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 将字符串时间转换为毫秒数
		long from = dateFormat.parse(fromDate).getTime();
		long to = dateFormat.parse(toDate).getTime();
		//计算分钟差
		Integer minutes = (int)((to - from) / (1000 * 60));
		return minutes.toString();
		
	}
	public static void main(String[] args) throws ParseException
	{
		System.out.println(getMinute("2017-5-20 15:00:30", "2017-5-20 15:30:31"));
	}
}
