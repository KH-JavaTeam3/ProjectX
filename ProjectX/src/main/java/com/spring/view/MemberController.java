package com.spring.view;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.biz.service.MemberService;
import com.spring.biz.util.GetSession;
import com.spring.biz.util.Time;
import com.spring.biz.vo.LicenseVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.MultiLicenseVO;
import com.spring.biz.vo.MultiProfilesVO;
import com.spring.biz.vo.ProfilesVO;
import com.spring.biz.vo.MemResumeVO;



@Controller
public class MemberController {
	@Resource(name = "memberService")
	MemberService memberService;
	// *.me쓰셈
	//경로는 tiles/member/파일명
	//jsp는 tiles/member폴더안에 생성
	//첨부파일: 외부경로(D드라이브)에 저장(server.xml에서도 설정해줘야함- 조장컴퓨터의 D드라이브에 저장됨)
	
	//개인 마이페이지 화면 이동
	@RequestMapping(value = "/memberMypage.me")
	public String memberMypage() {
		return "tiles/member/memberMypage";
	}
	
	//이력서 작성페이지로 이동
	@RequestMapping(value = "/writeResume.me")
	public String writeResume(HttpSession session, Model model) {
		
		return "tiles/member/writeResume";
	}
	
	//이력서 등록하기 
	@RequestMapping(value = "/regResume.me")
	public String regResume(MultiLicenseVO multiLicenseVO, MultiProfilesVO multiProfilesVO, MemResumeVO memResumeVO) {
			
		//다중 자격증 담기
		List<LicenseVO> licenseList = new ArrayList<LicenseVO>();
		for(int i = 0; i < multiLicenseVO.getLicDate().length; i++) {
			LicenseVO license = new LicenseVO();
			license.setLicName(multiLicenseVO.getLicName()[i]);
			license.setLicLoc(multiLicenseVO.getLicLoc()[i]);
			license.setLicGrade(multiLicenseVO.getLicGrade()[i]);
			license.setLicDate(multiLicenseVO.getLicDate()[i]);
			
			licenseList.add(license);
		}
		//다중 자기소개서 담기
		List<ProfilesVO> profilesList = new ArrayList<ProfilesVO>();
		for(int i = 0; i < multiProfilesVO.getProTitle().length; i++) {
			ProfilesVO profiles = new ProfilesVO();
			profiles.setProTitle(multiProfilesVO.getProTitle()[i]);
			profiles.setProContent(multiProfilesVO.getProContent()[i]);
			
			profilesList.add(profiles);
		}
		
		memResumeVO.setLicenseList(licenseList);
		memResumeVO.setProfilesList(profilesList);
		
		//이력서 등록
		memberService.insertResume(memResumeVO);
		
		return "redirect:resumeList.me";
	}
		
		
	//개인 정보수정 폼 화면으로 이동
	@RequestMapping(value = "/memUpdateForm.me")
	public String memUpdateForm() {
		return "tiles/member/memUpdateForm";
	}
			
	//개인 정보수정 화면
	@RequestMapping(value = "/updateMemInfo.me")
	public String updateMemInfo(MemInfoVO memInfoVO, HttpSession session, MultipartHttpServletRequest multi, HttpServletRequest request)throws Exception{
		//사진 이름(현재시분초)
		String nowDate = Time.getNowDateTime();
		
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
				String realPath = request.getSession().getServletContext().getRealPath("resources/images/memberProfile");
				mf.transferTo(new File(realPath + "/" + realName));
				memInfoVO.setMemImage(realName);
			}
		}

		memberService.updateMemInfo(memInfoVO);
		MemInfoVO vo = memberService.selectMemInfoME(memInfoVO);
		vo.setMemBirth(vo.getMemBirth().substring(0, 10));
		if(vo != null) {
			session.removeAttribute("memLogin");
			session.setAttribute("memLogin", vo);
		}
		return "redirect:memberMypage.me";
	}
	
	//이력서 모음페이지로 이동
	@RequestMapping(value = "/resumeList.me")
	public String resumeList(HttpSession session, Model model) {
		model.addAttribute("resumeList", memberService.selectResumeList(GetSession.getMemEmail(session)));
		return "tiles/member/resumeList";
	}
	
	//이력서 상세 페이지
	@RequestMapping(value = "/moveToResumeDetail.me")
	public String moveToResumeDetail(HttpSession session, Model model, int resumeNum) {
		MemResumeVO vo = memberService.selectResumeDetail(resumeNum);
		List<LicenseVO> licenseList = memberService.selectLicenseList(resumeNum);
		
		//날짜 포맷 변경
		licenseList.forEach((t) -> {
			t.setLicDate(t.getLicDate().substring(0, 10));
		});
		
		vo.setLicenseList(licenseList);
		vo.setProfilesList(memberService.selectProfilesList(resumeNum));
		
		model.addAttribute("memResume", vo);
		return "tiles/member/resumeDetail";
	}
		
	//이력서 수정 페이지
	@RequestMapping(value = "/updateResume.me",  method = RequestMethod.GET)
	public String UpdateResumePage() {
		
		return "tiles/member/updateResume";
	}
	//이력서 수정 
	@RequestMapping(value = "/updateResume.me",  method = RequestMethod.POST)
	public String updateResume() {
		
		return "redirect:updateResume.me";
	}
	
		
		
		
		
		
		
		
}










