package com.spring.view;

import java.io.File;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.biz.service.CompanyService;
import com.spring.biz.util.TimeUtil;
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
			//사진 이름(현재시분초)
			String nowDate = TimeUtil.getNowDateTime();
			
			//첨부파일에 대한 encoding 설정
			multi.setCharacterEncoding("UTF-8");
			
			//multipartRequest에서 첨부파일에 대한 데이터 받기
			Iterator<String> enu = multi.getFileNames();
			
			//첨부파일이 존재하면 첨부파일 개수만큼 반복
			while(enu.hasNext()){
				String fileName = enu.next();
				
				//서버에 업로드 되는 파일명
				MultipartFile mf = multi.getFile(fileName);
				String originFileName = mf.getOriginalFilename();
				String realName = nowDate + "_" + originFileName;
				
				//용량이 0이 아닐 경우
				if(mf.getSize() != 0){
					//실제 첨부파일이 들어갈 경로
					String realPath = request.getSession().getServletContext().getRealPath("resources/images/comProfile");
					mf.transferTo(new File(realPath + "/" + realName));
					recruitListVO.setRegistImage(realName);
				}
			}
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
		public String registHumanSeekerUpdate(RecruitListVO recruitListVO, Model model, MultipartHttpServletRequest multi, HttpServletRequest request)throws Exception{
			//사진 이름(현재시분초)
			String nowDate = TimeUtil.getNowDateTime();
			
			//첨부파일에 대한 encoding 설정
			multi.setCharacterEncoding("UTF-8");
			
			//multipartRequest에서 첨부파일에 대한 데이터 받기
			Iterator<String> enu = multi.getFileNames();
			
			//첨부파일이 존재하면 첨부파일 개수만큼 반복
			while(enu.hasNext()){
				String fileName = enu.next();
				
				
				//서버에 업로드 되는 파일명
				MultipartFile mf = multi.getFile(fileName);
				
				String originFileName = mf.getOriginalFilename();
				System.out.println(originFileName);
				String realName = nowDate + "_" + originFileName;
				
				//용량이 0이 아닐 경우
				if(mf.getSize() != 0){
					//실제 첨부파일이 들어갈 경로
					String realPath = request.getSession().getServletContext().getRealPath("resources/images/comProfile");
					mf.transferTo(new File(realPath + "/" + realName));
					recruitListVO.setRegistImage(realName);
				}
			}
				
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
		public String myComUpdate(HttpSession session,CompanyInfoVO companyInfoVO, MultipartHttpServletRequest multi, HttpServletRequest request)throws Exception {
			//사진 이름(현재시분초)
			String nowDate = TimeUtil.getNowDateTime();
			
			//첨부파일에 대한 encoding 설정
			multi.setCharacterEncoding("UTF-8");
			
			//multipartRequest에서 첨부파일에 대한 데이터 받기
			Iterator<String> enu = multi.getFileNames();
			
			//첨부파일이 존재하면 첨부파일 개수만큼 반복
			while(enu.hasNext()){
				String fileName = enu.next();
				
				//서버에 업로드 되는 파일명
				MultipartFile mf = multi.getFile(fileName);
				String originFileName = mf.getOriginalFilename();
				String realName = nowDate + "_" + originFileName;
				
				//용량이 0이 아닐 경우
				if(mf.getSize() != 0){
					//실제 첨부파일이 들어갈 경로
					String realPath = request.getSession().getServletContext().getRealPath("resources/images/comProfile");
					mf.transferTo(new File(realPath + "/" + realName));
					companyInfoVO.setComImage(realName);
				}
			}
			int vo = companyService.myComUpdate(companyInfoVO);
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
		public int acceptanceAndrejectBtn(MemResumeVO memResumeVO) {
			//여기만 바꾸면 가능
			String setfrom = "FinDream"; // 보내는 이(한글 안먹던데)
			String tomail = memResumeVO.getMemEmail(); // 받는 사람 이메일
			String title = "구인구직 사이트 파인드림입니다."; // 제목(생략가능)
			String content = "귀하께서 신청 하신 "+ memResumeVO.getComName() +"기업의 공고에서 최종 합격 되셨습니다. \n 감사합니다.";
			String content2 = "귀하께서 신청 하신 "+ memResumeVO.getComName() +"기업의 공고에서 최종 불합격 되셨습니다. \n 감사합니다.";
			
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
			
			int result = companyService.resumeResultUpdate(memResumeVO);
			return result;
		}
}










