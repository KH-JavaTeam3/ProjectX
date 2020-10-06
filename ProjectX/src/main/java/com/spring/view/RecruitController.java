package com.spring.view;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.RecruitService;
import com.spring.biz.vo.MemInfoVO;

@Controller
public class RecruitController {
	@Resource(name = "recruitService")
	RecruitService recruitService;
	
	
	//메인화면
	@RequestMapping(value = "/main.do")
	public String Main() {
		return "tiles/main";
	}
	
	//개인 회원가입 화면
	@RequestMapping(value = "/memberJoin.do")
	public String join() {
		return "join/memberJoin";
	}
	//기업 회원가입 화면
	@RequestMapping(value = "/companyJoin.do")
	public String join2() {
		return "join/companyJoin";
	}
	//개인 회원가입
	@RequestMapping(value = "/initMemberJoin.do")
	public String initMemberJoin(MemInfoVO memInfoVO) {
		recruitService.insertMemInfo(memInfoVO);
		
		
		
		
		return "redirect:main.do";
	}
	
	
	
	
	
	//개인 로그인 화면
	@RequestMapping(value = "/memberLogin.do")
	public String memberLogin() {
		return "login/memberLogin";
	}
	
	//기업 로그인 화면
	@RequestMapping(value = "/companyLogin.do")
	public String companyLogin() {
		return "login/companyLogin";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping(value = "/cover.do")
//	public String cover() {
//		return "sample/cover";
//	}
//	
//	@RequestMapping(value = "/carousel.do")
//	public String carousel() {
//		return "sample/carousel";
//	}
//	
//	@RequestMapping(value = "/dashBoard.do")
//	public String dashBoard() {
//		return "sample/dashBoard";
//	}
//	
//	@RequestMapping(value = "/startBootstrap.do")
//	public String startBootstrap() {
//		return "sample/startBootstrap";
//	}
	
}










