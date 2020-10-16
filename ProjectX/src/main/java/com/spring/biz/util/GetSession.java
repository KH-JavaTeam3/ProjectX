package com.spring.biz.util;

import javax.servlet.http.HttpSession;

import com.spring.biz.vo.MemInfoVO;

public class GetSession {
	public static MemInfoVO getMem(HttpSession session) {
		return ((MemInfoVO) session.getAttribute("memLogin"));
	}

	public static String getMemEmail(HttpSession session) {
		return ((MemInfoVO) session.getAttribute("memLogin")).getMemEmail();
	}
}
