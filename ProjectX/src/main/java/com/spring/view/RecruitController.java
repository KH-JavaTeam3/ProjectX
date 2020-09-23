package com.spring.view;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.spring.biz.RecruitService;

@Controller
public class RecruitController {
	@Resource(name = "recruitService")
	RecruitService recruitService;
	
	@RequestMapping(value = "/recruit.do")
	public String recruitMain() {
		return "recruit/main";
	}
	
}










