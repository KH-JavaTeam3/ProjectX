package com.spring.biz.util;

import java.util.Calendar;

public class TimeUtil {
	//현재 날짜시분초 메소드
	public static String getNowDateTime(){
		Calendar cal = Calendar.getInstance();
		String year = cal.get(Calendar.YEAR) + "";
		String month = cal.get(Calendar.MONTH) + 1 + "";
		String day = cal.get(Calendar.DAY_OF_MONTH) + "";
		String hour = cal.get(Calendar.HOUR) + "";
		String minute = cal.get(Calendar.MINUTE) + "";
		String second = cal.get(Calendar.SECOND) + "";
		
		return year+month+day+hour+minute+second;
	}
}
