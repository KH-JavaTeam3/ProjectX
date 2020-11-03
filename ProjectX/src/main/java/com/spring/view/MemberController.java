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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.biz.service.CommonService;
import com.spring.biz.service.MemberService;
import com.spring.biz.util.TimeUtil;
import com.spring.biz.vo.CareerVO;
import com.spring.biz.vo.ForRecruitVO;
import com.spring.biz.vo.LicenseVO;
import com.spring.biz.vo.LikeCompanyVO;
import com.spring.biz.vo.LikeRecruitVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.MemResumeVO;
import com.spring.biz.vo.MultiCareerVO;
import com.spring.biz.vo.MultiLicenseVO;
import com.spring.biz.vo.MultiProfilesVO;
import com.spring.biz.vo.ProfilesVO;



@Controller
public class MemberController {
	@Resource(name = "memberService")
	MemberService memberService;
	
	@Resource(name = "commonService")
	CommonService commonService;
	
	
	
	// *.me쓰셈
	//경로는 tiles/member/파일명
	//jsp는 tiles/member폴더안에 생성
	//첨부파일: 외부경로(D드라이브)에 저장(server.xml에서도 설정해줘야함- 조장컴퓨터의 D드라이브에 저장됨)
	
	//개인 마이페이지 화면 이동
	@RequestMapping(value = "/memberMypage.me")
	public String memberMypage() {
		return "tiles/member/memberMypage";
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
					String realPath = request.getSession().getServletContext().getRealPath("resources/images/memberProfile");
					mf.transferTo(new File(realPath + "/" + realName));
					memInfoVO.setMemImage(realName);
					System.out.println(realPath);
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
	
	//이력서 작성페이지로 이동
	@RequestMapping(value = "/writeResume.me")
	public String writeResume(HttpSession session, Model model) {
		
		return "tiles/member/writeResume";
	}
	
	//이력서 등록하기 
	@RequestMapping(value = "/regResume.me")
	public String regResume(MultiLicenseVO multiLicenseVO, MultiProfilesVO multiProfilesVO, MultiCareerVO multiCareerVO, HttpServletRequest request, MemResumeVO memResumeVO) {
		
		
		//이력서 등록
		memberService.insertResume(memResumeVO);
		
		//다중 자격증 담기
		if(multiLicenseVO.getLicName() != null && multiLicenseVO.getLicName().length > 0) {
			List<LicenseVO> licenseList = new ArrayList<LicenseVO>();
			
			for(int i = 0; i < multiLicenseVO.getLicDate().length; i++) {
				LicenseVO license = new LicenseVO();
				license.setLicName(multiLicenseVO.getLicName()[i]);
				license.setLicLoc(multiLicenseVO.getLicLoc()[i]);
				license.setLicGrade(multiLicenseVO.getLicGrade()[i]);
				license.setLicDate(multiLicenseVO.getLicDate()[i]);
				
				licenseList.add(license);
			}
			MemResumeVO vo = new MemResumeVO();
			vo.setLicenseList(licenseList);
			memberService.insertLicense(vo);
		}
		//다중 자기소개서 담기
		if(multiProfilesVO.getProTitle() != null && multiProfilesVO.getProTitle().length > 0) {
			List<ProfilesVO> profilesList = new ArrayList<ProfilesVO>();
			
			for(int i = 0; i < multiProfilesVO.getProTitle().length; i++) {
				ProfilesVO profiles = new ProfilesVO();
				profiles.setProTitle(multiProfilesVO.getProTitle()[i]);
				profiles.setProContent(multiProfilesVO.getProContent()[i]);
				
				profilesList.add(profiles);
			}
			MemResumeVO vo = new MemResumeVO();
			vo.setProfilesList(profilesList);
			memberService.insertProfiles(vo);
		}
		
		//다중 경력사항 담기
		if(multiCareerVO.getCarCompany() != null && multiCareerVO.getCarCompany().length > 0) {
			List<CareerVO> careerList = new ArrayList<>();
			
			for(int i = 0; i < multiCareerVO.getCarCompany().length; i++) {
				CareerVO careerVO = new CareerVO();
				careerVO.setCarCompany(multiCareerVO.getCarCompany()[i]);
				careerVO.setCarCareer(multiCareerVO.getCarCareer()[i]);
				careerVO.setCarPosition(multiCareerVO.getCarPosition()[i]);
				careerVO.setCarType(multiCareerVO.getCarType()[i]);
				
				careerList.add(careerVO);
			}
			MemResumeVO vo = new MemResumeVO();
			vo.setCareerList(careerList);
			memberService.insertCareer(vo);
		}
		
		return "redirect:resumeList.me";
	}
	
	//이력서 모음페이지로 이동
		@RequestMapping(value = "/resumeList.me")
		public String resumeList(HttpSession session, Model model) {
			model.addAttribute("resumeList", memberService.selectResumeList(((MemInfoVO)session.getAttribute("memLogin")).getMemEmail()));
			return "tiles/member/resumeList";
		}
		
		//이력서 상세 페이지
		@RequestMapping(value = "/moveToResumeDetail.me")
		public String moveToResumeDetail(HttpSession session, Model model, MemResumeVO memResumeVO, int resumeNum, CareerVO careerVO) {
			MemResumeVO vo = memberService.selectResumeDetail(memResumeVO.getResumeNum());
			vo.setResumeNum(resumeNum);
			List<LicenseVO> licenseList = memberService.selectLicenseList(memResumeVO.getResumeNum());
			
			//날짜 포맷 변경
			licenseList.forEach((t) -> {
				t.setLicDate(t.getLicDate().substring(0, 10));
			});
			
			vo.setLicenseList(licenseList);
			vo.setProfilesList(memberService.selectProfilesList(memResumeVO.getResumeNum()));
			vo.setCareerList(memberService.selectCareerList(memResumeVO.getResumeNum()));
			
			model.addAttribute("memResume", vo);
			return "tiles/member/resumeDetail";
		}
			
		//이력서 수정 페이지로 이동
		@RequestMapping(value = "/updateResume.me",  method = RequestMethod.GET)
		public String UpdateResumePage(Model model, MemResumeVO memResumeVO) {
			MemResumeVO vo = memberService.selectResumeDetail(memResumeVO.getResumeNum());
			List<LicenseVO> licenseList = memberService.selectLicenseList(memResumeVO.getResumeNum());
			
			//날짜 포맷 변경
			licenseList.forEach((t) -> {
				t.setLicDate(t.getLicDate().substring(0, 10));
			});
			
			vo.setLicenseList(licenseList);
			vo.setProfilesList(memberService.selectProfilesList(memResumeVO.getResumeNum()));
			vo.setCareerList(memberService.selectCareerList(memResumeVO.getResumeNum()));
			
			model.addAttribute("memResume", vo);
			return "tiles/member/updateResume";
		}
		
		//자격증 삭제 ajax
		@ResponseBody
		@RequestMapping(value = "/licRemove.me")
		public String licRemove(int licNum) {
		  String result = memberService.deleteLic(licNum)+"";
		  return result;
		} 
		
		//자기소개 삭제 ajax
		@ResponseBody
		@RequestMapping(value = "/profilesRemove.me")
		public String profilesRemove(int proNum) {
			String result = memberService.deleteProfiles(proNum)+"";
			return result;
		}
		
		//경력사항 삭제 ajax
		@ResponseBody
		@RequestMapping(value = "/careerRemove.me")
		public String careerRemove(int carNum) {
			String result = memberService.deleteCareer(carNum)+"";
			return result;
		}

		//이력서 수정하기
		@RequestMapping(value = "/updateResume.me",  method = RequestMethod.POST)
		public String updateResume(MemResumeVO memResumeVO, MultiLicenseVO multiLicenseVO, MultiProfilesVO multiProfilesVO, MultiCareerVO multiCareerVO, Model model) {
			//자격증의 max값을 불러온다.
			int maxLicNum = memberService.selectMaxLicNum();
			//자기소개서 max값 불러오기
			int maxProfilesNum = memberService.selectMaxProfilesNum();
			//경력사항 max값 불러오기
			int maxCarNum = memberService.selectMaxCareerNum();

			//자격증 리스트 객체 생성
			List<LicenseVO> list = new ArrayList<>();
			
			//현재 등록된 자격증의 수
			int registedLicneseCnt = multiLicenseVO.getLicNum().length;
			
			//배열 형태의 자격증의 크기만큼 돌면서 list저장
			for(int i = 0 ; i <multiLicenseVO.getLicLoc().length ; i++) {
				LicenseVO vo = new LicenseVO();
				
//				if(i < registedLicneseCnt) {
//					vo.setLicNum(multiLicenseVO.getLicNum()[i]);
//				}else {
//					vo.setLicNum(maxLicNum++);
//				}
				
				//현재 등록된 자격증의 수보다 작을 땐 현재 자격증번호에, 클 땐 자격증 번호 새로 추가
				vo.setLicNum(i < registedLicneseCnt ? multiLicenseVO.getLicNum()[i] : ++maxLicNum);
				vo.setLicName(multiLicenseVO.getLicName()[i]);
				vo.setLicLoc(multiLicenseVO.getLicLoc()[i]);
				vo.setLicGrade(multiLicenseVO.getLicGrade()[i]);
				vo.setLicDate(multiLicenseVO.getLicDate()[i]);
				vo.setResumeNum(memResumeVO.getResumeNum());
				list.add(vo);
			}
			memResumeVO.setLicenseList(list);
			
			//자기소개서 list객체 생성
			List<ProfilesVO> proList = new ArrayList<>();
			
			//현재 등록된 자기소개서의 수
			int regProfilesCnt = multiProfilesVO.getProNum().length;
			
			for(int i = 0; i < multiProfilesVO.getProTitle().length; i++) {
				
				ProfilesVO pvo = new ProfilesVO();
				
				pvo.setProNum(i < regProfilesCnt ? multiProfilesVO.getProNum()[i] : ++maxProfilesNum);
				pvo.setProTitle(multiProfilesVO.getProContent()[i]);
				pvo.setProContent(multiProfilesVO.getProContent()[i]);
				pvo.setResumeNum(memResumeVO.getResumeNum());
				proList.add(pvo);
			}
			memResumeVO.setProfilesList(proList);
			
			//경력사항 list객체 생성
			List<CareerVO> carList = new ArrayList<>();
			
			//현재 등록된 경력사항의 수
			int regCareerCnt = multiCareerVO.getCarNum().length;
			
			for(int i = 0; i < multiCareerVO.getCarCompany().length; i++) {
				
				CareerVO cvo = new CareerVO();
				cvo.setCarNum(i < regCareerCnt ? multiCareerVO.getCarNum()[i] : ++maxCarNum);
				cvo.setCarCompany(multiCareerVO.getCarCompany()[i]);
				cvo.setCarCareer(multiCareerVO.getCarCareer()[i]);
				cvo.setCarPosition(multiCareerVO.getCarPosition()[i]);
				cvo.setCarType(multiCareerVO.getCarType()[i]);
				cvo.setResumeNum(memResumeVO.getResumeNum());
				carList.add(cvo);
			}
			memResumeVO.setCareerList(carList);
			
			//이력서 수정
			memberService.updateMemResume(memResumeVO);
			
			model.addAttribute("resumeNum", memResumeVO.getResumeNum());
			return "redirect:moveToResumeDetail.me";
		}
		
		//이력서 삭제
		@ResponseBody
		@RequestMapping(value = "/deleteResume.me")
		public String deleteResume(int resumeNum) {
			//memberService.deleteLic(licNum);
			//memberService.deleteCareer(carNum);
			//memberService.deleteProfiles(proNum);
			String result = memberService.deleteResume(resumeNum)+"";
			System.out.println(result);
			return result;
		}
		
		//공고 지원 클릭시 이력서 상세 페이지
		@RequestMapping(value = "/resumeApplication.me")
		public String resumeApplication(HttpSession session, Model model, String comNum, int announceNum) {
			ForRecruitVO vo = new ForRecruitVO();
			vo.setComNum(comNum);
			vo.setAnnounceNum(announceNum);
			vo.setResumeList(memberService.selectResumeList(((MemInfoVO)session.getAttribute("memLogin")).getMemEmail()));
			
			model.addAttribute("resumeList", vo);
			return "tiles/common/resumeApplication";
		}	
	
		//선호 공고리스트로 이동
		@RequestMapping(value = "/likeRecruit.me")
		public String likeRecruit(Model model, LikeRecruitVO likeRecruitVO, HttpSession session) {
			
			MemInfoVO member = (MemInfoVO) session.getAttribute("memLogin");
			model.addAttribute("likeRecruitList", memberService.selectLikeRecruitList(member.getMemEmail()));
			
			return "tiles/member/likeRecruit";
		}
		
		//관심 기업
		  @RequestMapping(value = "/likeCompany.me") public String likeCompany(Model
		  model, LikeCompanyVO likeCompanyVO,HttpSession session, String a) { 
			  MemInfoVO member = (MemInfoVO) session.getAttribute("memLogin");
		  
			  if(a != null) { 
				  LikeCompanyVO vo = memberService.chkHeart(likeCompanyVO);
			  
			  if(vo != null) { 
				  memberService.deleteLikeCompany(likeCompanyVO); 
			  }
			  
			  else { 
				  memberService.insertLikeCompany(likeCompanyVO); 
			  	} 
			  
			  }
			  model.addAttribute("likeCompanyList", memberService.selectLikeCompany(member.getMemEmail()));
			  
			  return "tiles/member/likeCompany"; 
		  }
	 
		
		
		//기업에 넣은 이력서 상세 보기
		@RequestMapping(value = "/comMoveToResumeDetail.me")
		public String comMoveToResumeDetail(HttpSession session, Model model, int resumeNum, MemInfoVO memInfoVO,int comMypageNum) {
			
			MemResumeVO vo = memberService.selectResumeDetail(resumeNum);
			List<LicenseVO> licenseList = memberService.selectLicenseList(resumeNum);
			
			//날짜 포맷 변경
			licenseList.forEach((t) -> {
				t.setLicDate(t.getLicDate().substring(0, 10));
			});
			vo.setComMypageNum(comMypageNum);
			vo.setMemInfoVO(memberService.selectMemInfoME(memInfoVO));
			vo.setLicenseList(licenseList);
			vo.setProfilesList(memberService.selectProfilesList(resumeNum));
			
			model.addAttribute("memResume", vo);
			return "tiles/company/comResumeDetail";
		}
		
		
		
		
		
}










