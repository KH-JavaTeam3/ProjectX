package com.spring.view;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.CommonService;
import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.MemInfoVO;



@Controller
public class CommonController {
	@Resource(name = "commonService")
	CommonService commonService;
	//*.do쓰셈
	//경로는 tiles/common/파일명
	//jsp는 tiles/common폴더안에 생성
	
	//메인화면
	@RequestMapping(value = "/main.do")
	public String Main() {
		return "tiles/common/main";
	}
	
	//개인 회원가입 화면
	@RequestMapping(value = "/memberJoin.do")
	public String join() {
		return "join/memberJoin";
	}
	//개인 회원가입
	@RequestMapping(value = "/initMemberJoin.do")
	public String initMemberJoin(MemInfoVO memInfoVO) {
		commonService.insertMemInfo(memInfoVO);
		return "redirect:main.do";
	}
	//기업 회원가입 화면
	@RequestMapping(value = "/companyJoin.do")
	public String join2() {
		return "join/companyJoin";
	}
	//기업 회원가입
	@RequestMapping(value = "/initCompanyJoin.do")
	public String initCompanyJoin(CompanyInfoVO companyInfoVO) {
		commonService.insertCompanyInfo(companyInfoVO);
		return "redirect:main.do";
	}
	//개인 로그인 화면
	@RequestMapping(value = "/memberLoginForm.do")
	public String memberLogin() {
		
		return "login/memberLogin";
	}
	//개인 로그인
	@RequestMapping(value = "/memberLogin.do")
	public String memberLogin(MemInfoVO memInfoVO, HttpSession session) {
		MemInfoVO vo = commonService.memberLogin(memInfoVO);
		System.out.println(vo);
		if(vo != null) {
			session.setAttribute("memLogin", vo);
			if(vo.getMemEmail().equals("admin@admin")) {
				return "tiles/admin/adminPage";
			}
		}
		return "tiles/common/main";
	}
	//기업 로그인 화면
	@RequestMapping(value = "/companyLoginForm.do")
	public String companyLoginForm() {
		return "login/companyLogin";
	}
	//기업 로그인
	@RequestMapping(value = "/companyLogin.do")
	public String companyLogin(CompanyInfoVO companyInfoVO, HttpSession session) {
		CompanyInfoVO vo = commonService.companyLogin(companyInfoVO);
		System.out.println(vo);
		if(vo != null) {
			session.setAttribute("comLogin", vo);
		}
		return "tiles/company/main2";
	}
	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("memLogin");
		return "redirect:main.do";
	}
	
	
	
	
	
	
	//기업리스트 이동
	@RequestMapping(value = "/companyList.do")
	public String companyList() {
		
		return "tiles/common/companyList";
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










