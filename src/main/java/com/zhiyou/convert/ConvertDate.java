package com.zhiyou.convert;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
/**
 * 定义日期转换
 * @author Administrator
 *
 */
public class ConvertDate implements Converter<String, Date>{

	public Date convert(String sdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = sdf.parse(sdate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}

}
