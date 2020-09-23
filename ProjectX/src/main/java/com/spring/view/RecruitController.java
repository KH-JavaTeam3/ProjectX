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
	
	@RequestMapping(value = "/cover.do")
	public String cover() {
		return "template/cover";
	}
	
	@RequestMapping(value = "/carousel.do")
	public String carousel() {
		return "template/carousel";
	}
	
	@RequestMapping(value = "/dashBoard.do")
	public String dashBoard() {
		return "template/dashBoard";
	}
	
	@RequestMapping(value = "/startBootstrap.do")
	public String startBootstrap() {
		return "template/startBootstrap";
	}
	
}










