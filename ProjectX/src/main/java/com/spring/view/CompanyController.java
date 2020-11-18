package com.spring.view;

import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.biz.service.CompanyService;
import com.spring.biz.util.Statics;
import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.ForRecruitVO;
import com.spring.biz.vo.MemResumeVO;
import com.spring.biz.vo.RecruitListVO;



@Controller
public class CompanyController {
	@Resource(name = "companyService")
	CompanyService companyService;
	
	@Autowired
	private JavaMailSender mailSender;
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
	public String registHumanSeeker(HttpSession session, RecruitListVO recruitListVO, MultipartHttpServletRequest multi, HttpServletRequest request)throws Exception {
		companyService.registHumanSeeker(Statics.uploadImage(multi, request, recruitListVO));
		return "tiles/company/main2";
	}
	
	//기업 공고 수정 폼
	@RequestMapping(value = "/registHumanSeekerUpdateForm.co")
	public String registHumanSeekerUpdateForm(RecruitListVO recruitListVO, Model model) {
		model.addAttribute("recruitDeteil", companyService.recruitDeteil(recruitListVO));
		return "tiles/company/registHumanSeekerUpdateForm";
	}
	
	//기업 공고 수정
	@RequestMapping(value = "/registHumanSeekerUpdate.co")
	public String registHumanSeekerUpdate(RecruitListVO recruitListVO, Model model, MultipartHttpServletRequest multi, HttpServletRequest request)throws Exception{
		companyService.registHumanSeekerUpdate(Statics.uploadImage(multi, request, recruitListVO));
		return "redirect:recruitDeleteList.co";
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
		companyService.recruitDeleteList(announceNums);
		return "redirect:recruitDeleteList.co";
	}

	//기업 마이페이지 이동
	@RequestMapping(value = "/comMypage.co")
	public String comMypage(HttpSession session,CompanyInfoVO companyInfoVO) {
		CompanyInfoVO comvo = (CompanyInfoVO) session.getAttribute("comLogin");
		session.setAttribute("comLogin", companyService.selectMyCom(comvo));
		return "tiles/company/comMypage";
	}
	
	//기업 정보 수정 폼 
	@RequestMapping(value = "/myComUpdateForm.co")
	public String myComUpdateForm() {
		return "tiles/company/myComUpdateForm";
	}
	
	//기업 마이페이지 수정 
	@RequestMapping(value = "/myComUpdate.co")
	public String myComUpdate(HttpSession session,CompanyInfoVO companyInfoVO, MultipartHttpServletRequest multi, HttpServletRequest request)throws Exception {
		int vo = companyService.myComUpdate(Statics.uploadComImage(multi, request, companyInfoVO));
		CompanyInfoVO comNum = (CompanyInfoVO) session.getAttribute("comLogin");
		if(vo != 0) {
			session.removeAttribute("comLogin");
			session.setAttribute("comLogin", companyService.selectMyCom(comNum));
		}
		return "redirect:comMypage.co";
	}
	
	//기업에 넣은 이력서 확인
	@RequestMapping(value = "/resumeInquiry.co")
	public String resumeInquiry(ForRecruitVO forRecruitVO, Model model, HttpSession session) {
		CompanyInfoVO  vo = (CompanyInfoVO) session.getAttribute("comLogin");
		List<ForRecruitVO> list = companyService.resumeInquiryList(vo.getComNum());
		model.addAttribute("resumeInquiryList", list);
		return "tiles/company/resumeInquiryList";
	}
	
	//이력서 합격 불합격 에이작스
	@ResponseBody
	@RequestMapping(value = "/acceptanceAndrejectBtn.co")
	public int acceptanceAndrejectBtn(MemResumeVO memResumeVO,HttpSession session, CompanyInfoVO companyInfoVO) {
		//여기만 바꾸면 가능
		String setfrom = "FinDream"; // 보내는 이(한글 안먹던데)
		String tomail = memResumeVO.getMemEmail(); // 받는 사람 이메일
		companyInfoVO = (CompanyInfoVO) session.getAttribute("comLogin");
		String comName = companyInfoVO.getComName();
		String title = "구인구직 사이트 파인드림입니다."; // 제목(생략가능)
		String content = "귀하께서 신청 하신 "+ comName +"기업의 공고에서 최종 합격 되셨습니다. \n 감사합니다.";
		String content2 = "귀하께서 신청 하신 "+ comName +"기업의 공고에서 최종 불합격 되셨습니다. \n 감사합니다.";
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
			@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
				helper.setFrom(setfrom); 
				helper.setTo(tomail); 
				helper.setSubject(title); 
				if(memResumeVO.getYnN() == 1) {
					helper.setText(content); 
				}else {
					helper.setText(content2); 
				}
			} 
		}; 
		mailSender.send(preparator);
		
		companyService.resumeResultUpdate(memResumeVO);
		companyService.updateApply(memResumeVO);
		
		return 0;
	}
}










