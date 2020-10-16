package com.spring.view;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.service.CommonService;
import com.spring.biz.util.GetSession;
import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.MemResumeVO;
import com.spring.biz.vo.RecruitListVO;
import com.spring.biz.vo.SearchVO;



@Controller
public class CommonController {
	@Resource(name = "commonService")
	CommonService commonService;
	//*.do쓰셈
	//경로는 tiles/common/파일명
	//jsp는 tiles/common폴더안에 생성
	
	private final static Logger logger = LoggerFactory.getLogger(CommonController.class);
	//로그 생성
	
	//메인화면
	@RequestMapping(value = "/main.do")
	public String Main() {
		logger.info("메인화면 이동");
		return "tiles/common/main";
	}
	
	//개인 회원가입 화면
	@RequestMapping(value = "/memberJoin.do")
	public String join() {
		logger.info("개인 회원가입 화면 ");
		return "join/memberJoin";
	}
	//개인 회원가입 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailChkAjax.do")
	public String emailChkAjax(String memEmail) {
		return commonService.selectEmailChk(memEmail);
	}
	//개인 회원가입
	@RequestMapping(value = "/initMemberJoin.do")
	public String initMemberJoin(MemInfoVO memInfoVO) {
		System.out.println(memInfoVO);
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
	public String memberLoginForm() {
		
		return "login/memberLogin";
	}
	//개인 로그인
	@RequestMapping(value = "/memberLogin.do")
	public String memberLogin(MemInfoVO memInfoVO, HttpSession session) {
		MemInfoVO vo = commonService.memberLogin(memInfoVO);
		vo.setMemBirth(vo.getMemBirth().substring(0, 10));
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
	//기업 로고 클릭시
		@RequestMapping(value = "/comLogin.do")
		public String comLogin() {
			return "tiles/company/main2";
		}
	//기업 로그인
	@RequestMapping(value = "/companyLogin.do")
	public String companyLogin(CompanyInfoVO companyInfoVO, HttpSession session) {
		CompanyInfoVO vo = commonService.companyLogin(companyInfoVO);
		System.out.println(vo);
		if(vo != null) {
			session.setAttribute("comLogin", vo);
			return "tiles/company/main2";
		}else {
			return "tiles/common/main";
		}
	}
	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("memLogin");
		session.removeAttribute("comLogin");
		return "redirect:main.do";
	}
	
	
	
	
	
	
	//기업리스트 이동
	@RequestMapping(value = "/companyList.do")
	public String companyList(Model model,SearchVO searchVO) {
		System.out.println(searchVO);
	
		model.addAttribute("companyList",commonService.selectRecruitList(searchVO));
		return "tiles/common/companyList";
	}
	
	//기업리스트 상세보기
	@RequestMapping(value = "/companyDetail.do")
	public String companyDetail(RecruitListVO recruitListVO, Model model) {

		model.addAttribute("recruitDeteil",commonService.selectDetailRecruit(recruitListVO));
		
		return "tiles/common/companyDetail";
	}
	
	//기업 이력서 넣기
	@RequestMapping(value = "/resumeApp.do")
	public String resumeApp(int resumeNum, int comNum) {
		System.out.println(resumeNum);
		System.out.println(comNum);
		
		return "tiles/common/";
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










