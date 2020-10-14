package com.spring.view;

import java.util.Arrays;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.CompanyService;
import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.RecruitListVO;



@Controller
public class CompanyController {
	@Resource(name = "companyService")
	CompanyService companyService;
	// *.co쓰셈
	//경로는 tiles/company/파일명
	//jsp는 tiles/company폴더안에 생성
	
	
	//기업 공고 등록 폼
		@RequestMapping(value = "/registHumanSeekerForm.co")
		public String registHumanSeekerForm(HttpSession session) {
			if(session.getAttribute("comLogin") == null) {
				return "redirect:main.do";
			}
			
			return "tiles/company/registHumanSeekerForm";
		}
		//기업 공고 등록
		@RequestMapping(value = "/registHumanSeeker.co")
		public String registHumanSeeker(HttpSession session, RecruitListVO recruitListVO) {
			System.out.println(recruitListVO);
			companyService.registHumanSeeker(recruitListVO);
			return "tiles/company/main2";
		}
		//기업 공고 수정으로 가는 리스트
		@RequestMapping(value = "/recruitlist.co")
		public String recruitlist(HttpSession session, RecruitListVO recruitListVO, Model model, CompanyInfoVO companyInfoVO) {
			CompanyInfoVO vo = (CompanyInfoVO)(session.getAttribute("comLogin"));
			String comNum = vo.getComNum();
			model.addAttribute("recruitlist", companyService.recruitlist(comNum));
			return "tiles/company/recruitlist";
		}
		//기업 공고 수정 폼
		@RequestMapping(value = "/registHumanSeekerUpdateForm.co")
		public String registHumanSeekerUpdateForm(RecruitListVO recruitListVO, Model model) {
			model.addAttribute("recruitDeteil", companyService.recruitDeteil(recruitListVO));
			return "tiles/company/registHumanSeekerUpdateForm";
		}
		//기업 공고 수정
		@RequestMapping(value = "/registHumanSeekerUpdate.co")
		public String registHumanSeekerUpdate(RecruitListVO recruitListVO, Model model) {
			System.out.println(recruitListVO);
			companyService.registHumanSeekerUpdate(recruitListVO);
			return "redirect:recruitlist.co";
		}
		//기업 공고 삭제로 가는 리스트
		@RequestMapping(value = "/recruitDeleteList.co")
		public String recruitDeleteList(HttpSession session, RecruitListVO recruitListVO, Model model, CompanyInfoVO companyInfoVO) {
			CompanyInfoVO vo = (CompanyInfoVO)(session.getAttribute("comLogin"));
			String comNum = vo.getComNum();
			model.addAttribute("recruitlist", companyService.recruitlist(comNum));
			return "tiles/company/recruitDeleteList";
		}
		//기업 공고 삭제 폼
		@RequestMapping(value = "/recruitDeleteForm.co")
		public String recruitDeleteForm(RecruitListVO recruitListVO, Model model) {
			model.addAttribute("recruitDeteil", companyService.recruitDeteil(recruitListVO));
			return "tiles/company/registHumanSeekerUpdateForm";
		}
		//공고 다중 삭제
		@RequestMapping(value = "/recruitDelete.co")
		public String recruitDeleteList(int[] announceNums, RecruitListVO recruitListVO) {
//			recruitListVO.setAnnounceNumList((Arrays.asList(announceNums))); // Arrays.asList = 배열을 리스트형식으로 바꿔주는 함수
			companyService.recruitDeleteList(announceNums);
			
			return "redirect:recruitlist.co";
		}
	
		//기업 마이페이지 이동
		@RequestMapping(value = "/comMypage.co")
		public String comMypage() {
			return "tiles/company/comMypage";
		}
		//기업 정보 수정 폼 
		@RequestMapping(value = "/myComUpdateForm.co")
		public String myComUpdateForm() {
			return "tiles/company/myComUpdateForm";
		}
		//기업 마이페이지 수정 
		@RequestMapping(value = "/myComUpdate.co")
		public String myComUpdate(HttpSession session,CompanyInfoVO companyInfoVO) {
			int vo = companyService.myComUpdate(companyInfoVO);
			CompanyInfoVO comNum = (CompanyInfoVO) session.getAttribute("comLogin");
			if(vo != 0) {
				session.removeAttribute("comLogin");
				session.setAttribute("comLogin", companyService.selectMyCom(comNum));
			}
			return "redirect:comMypage.co";
		}
}










