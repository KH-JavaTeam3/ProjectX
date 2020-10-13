package com.spring.view;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.AdminService;
import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.MemInfoVO;


//관리자용 컨트롤러
@Controller
public class AdminController {
	@Resource(name = "adminService")
	AdminService adminService;
	//*.ad 쓰셈
	//경로는 tiles/admin/파일명
	//jsp는 tiles/admin폴더안에 생성
	
	//관리자용 페이지
	@RequestMapping(value = "/adminPage.ad")
	public String adminPage() {
		return "tiles/admin/adminPage";
	}
	//기업목록 ajax
	@ResponseBody
	@RequestMapping(value = "/companyListAjax.ad")
	public List<CompanyInfoVO> companyListAjax() {
		return adminService.selectCompanyListAD();
	}
	//개인목록 ajax
	@ResponseBody
	@RequestMapping(value = "/memberListAjax.ad")
	public List<MemInfoVO> memberListAjax() {
		return adminService.selectMemberListAD();
	}
	//기업상세 ajax
	@ResponseBody
	@RequestMapping(value = "/companyDetailAjax.ad")
	public CompanyInfoVO companyListAjax(String comName) {
		return adminService.selectCompanyAD(comName);
	}
	//개인상세 ajax
	@ResponseBody
	@RequestMapping(value = "/memberDetailAjax.ad")
	public MemInfoVO membeDetailAjax(String memName) {
		return adminService.selectMemberAD(memName);
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










