package com.spring.view;


import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.service.CommonService;
import com.spring.biz.service.MemberService;
import com.spring.biz.util.Statics;
import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.ForRecruitVO;
import com.spring.biz.vo.LikeCompanyVO;
import com.spring.biz.vo.LikeRecruitVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.RecruitListVO;
import com.spring.biz.vo.SearchVO;

@Controller
public class CommonController {
	@Resource(name = "commonService")
	CommonService commonService;
	
	@Resource(name="memberService")
	MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//*.do쓰셈
	//경로는 tiles/common/파일명
	//jsp는 tiles/common폴더안에 생성
	
//	private final static Logger logger = LoggerFactory.getLogger(CommonController.class);
	//로그 생성
	
	//메인화면
	@RequestMapping(value = "/main.do")
	public String Main(Model model,HttpSession session, MemInfoVO memInfoVO,RecruitListVO recruitListVO, String toDay, @CookieValue(value="loginCookie", required = false) String loginCookie) {
		//조회수가 높은 기업공고를 뽑는 쿼리.
		model.addAttribute("selectViewsList", commonService.selectViewsList());
		
		//해당날짜를 받아서 모집기간이 지난 공고를 자동으로 업데이트 하는 작업.
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;
				int day = cal.get(Calendar.DAY_OF_MONTH);
				toDay = year + "-" + month + "-" + day;
				
				List<RecruitListVO> list = commonService.selectOldList(toDay);
				for(int i = 0; i < list.size(); i++) {
					int a = list.get(i).getAnnounceNum();
					commonService.oldListUpdate(a);
				}
		if(loginCookie != null) {
			
			//자동로그인을 한 개인 조회
			MemInfoVO findMember = commonService.findMember(loginCookie);
			if(findMember != null) { // 있으면
				MemInfoVO memberLogin = commonService.memberLogin(findMember); //로그인 쿼리
				if(memberLogin != null) {// 로그인 정보가 있으면
					memberLogin.setMemBirth(memberLogin.getMemBirth().substring(0, 10)); // 날짜 자르기
					session.setAttribute("memLogin", memberLogin);  // 세션담기
				}
			}
			//자동로그인을 한 기업 조회
			CompanyInfoVO findComMember = commonService.findComMember(loginCookie);
			if(findComMember != null) { // 있으면
				CompanyInfoVO companyLogin = commonService.companyLogin(findComMember); //기업 로그인 쿼리
				if(companyLogin != null) { // 로그인 정보 있으면
					session.setAttribute("comLogin", companyLogin); //세션담기
					return "tiles/company/main2";
				}
			}
		}
		return "tiles/common/main";
	}
	
	//개인 회원가입 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailChkAjax.do")
	public String emailChkAjax(String memEmail) {
		return commonService.selectEmailChk(memEmail);
	}
	//개인 회원가입
	@RequestMapping(value = "/memberJoin.do")
	public String initMemberJoin(MemInfoVO memInfoVO, Model model) {
		commonService.insertMemInfo(memInfoVO);
		model.addAttribute("result", "mJoin");
		return "result/result";
	}
	//기업 회원가입시 사업자번호 중복체크
	@ResponseBody
	@RequestMapping(value = "/comNumChkAjax.do")
	public String comNumChkAjax(String comNum) {
		return commonService.selectComNumChk(comNum);
	}
	//기업 회원가입
	@RequestMapping(value = "/companyJoin.do")
	public String initCompanyJoin(CompanyInfoVO companyInfoVO, Model model) {
		commonService.insertCompanyInfo(companyInfoVO);
		model.addAttribute("result", "cJoin");
		return "result/result";
	}
	//개인 로그인
	@RequestMapping(value = "/memberLogin.do")
	public String memberLogin(MemInfoVO memInfoVO, String keepLogin, HttpSession session, HttpServletResponse response, Model model) {
		MemInfoVO vo = commonService.memberLogin(memInfoVO);
		String result = "mLoginFail";
		if(vo != null) {
			vo.setMemBirth(vo.getMemBirth().substring(0, 10));
			session.setAttribute("memLogin", vo);
			
			//자동 로그인
			if(keepLogin != null) {
				commonService.updateCookie(Statics.makeCookie(session.getId(), vo.getMemEmail(), response));//쿠쿠키쿠키
			}
			result = "mLoginSuccess";
		}
		model.addAttribute("result", result);
		return "result/result";
	}
	
	//기업 로고 클릭시
	@RequestMapping(value = "/comLogin.do")
	public String comLogin() {
		return "tiles/company/main2";
	}
	
	//기업 로그인
	@RequestMapping(value = "/companyLogin.do")
	public String companyLogin(CompanyInfoVO companyInfoVO, String keepLogin, HttpSession session, HttpServletResponse response, Model model) {
		CompanyInfoVO vo = commonService.companyLogin(companyInfoVO);
		String result = "cLoginFail";
		if(vo != null) {
			session.setAttribute("comLogin", vo);
			if(keepLogin != null) {
				commonService.updateComCookie(Statics.makeCookie(session.getId(), vo.getComNum(), response)); //쿠쿠키쿠키
			}
			result = "cLoginSuccess";
		}
		model.addAttribute("result", result);
		return "result/result";
	}
	//기업 홈버튼 클릭
	@RequestMapping(value = "/companyHome.do")
	public String companyHome() {
		return "tiles/company/main2";
	}
	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
		session.removeAttribute("memLogin");
		session.removeAttribute("comLogin");
		Cookie[] getCookie = request.getCookies();
		if(getCookie != null) {
			for(Cookie cookie : getCookie) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
			}
		}
		model.addAttribute("result", "logout");
		return "result/result";
	}
	
	//기업리스트 이동
	@RequestMapping(value = "/companyList.do")
	public String companyList(Model model, SearchVO searchVO, HttpSession session) {
		SearchVO vo = Statics.searchNullChk(searchVO);
		//2. 공고목록 list
		List<RecruitListVO> list1 = commonService.selectRecruitList(vo);
		if(session.getAttribute("memLogin") != null) {
			String memEmail = ((MemInfoVO)session.getAttribute("memLogin")).getMemEmail();
			
			//1. like목록 list
			List<LikeRecruitVO> list = memberService.selectLikeRecruitList(memEmail);
			
			list1 =  Statics.makeLiLike(list1, list);
		}
		
		model.addAttribute("companyList",list1);
		return "tiles/common/companyList";
	}
	
	//좋아요 버튼으로 공고목록 
	@RequestMapping(value = "/heartedRecruitList.do")
	public String heartedRecruitList(boolean isChecked, int announceNum, HttpSession session) {
		
			String memEmail = ((MemInfoVO)session.getAttribute("memLogin")).getMemEmail();
			LikeRecruitVO likeRecruitVO = new LikeRecruitVO();
			likeRecruitVO.setMemEmail(memEmail);
			likeRecruitVO.setAnnounceNum(announceNum);
			if(isChecked){
				memberService.deleteHeartOfLikeRecruit(likeRecruitVO);
			}
			else {
				memberService.insertHeartOfLikeRecruit(likeRecruitVO);
			}
		return "redirect:companyList.do";
	}
	
	
	
	
	//좋아요 버튼으로 기업목록 
		@RequestMapping(value = "/heartedCompanyList.do")
		public String heartedCompanyList(boolean isChecked, String comNum, HttpSession session) {
			
			String memEmail = ((MemInfoVO)session.getAttribute("memLogin")).getMemEmail();
			LikeCompanyVO likeCompany = new LikeCompanyVO();
			likeCompany.setMemEmail(memEmail);
			likeCompany.setComNum(comNum);
			
			if(isChecked){
				memberService.deleteLikeCompany(likeCompany);
			}
			else {
				memberService.insertLikeCompany(likeCompany);
			}
			return "redirect:comList.do";
		}
	
	//기업리스트 상세보기
	@RequestMapping(value = "/companyDetail.do")
	public String companyDetail(RecruitListVO recruitListVO, Model model) {
		commonService.updateViews(recruitListVO.getAnnounceNum());
		model.addAttribute("recruitDeteil",commonService.selectDetailRecruit(recruitListVO));
		
		
		//나이때 별 데이터 조회 및 넘기기(그래프)
		List<Integer> list =  commonService.selectMemberAge(recruitListVO);
		
		int[] arr = Statics.countAge(list);
		int num = 2;
		for(int e : arr) {
			model.addAttribute("age" + num + "0", e);
			num++;
		}
		
		//성별 데이터 조회 및 넘기기(그래프)
		List<String> list1 =  commonService.selectMemberGender(recruitListVO.getAnnounceNum());
		
		int genderM =0;
		int genderW =0;
		for(String gender : list1) {
			if(gender.equals("M")) {
				genderM +=1;
			}
			else {
				genderW +=1;
			}
		}
		int non = 0;
		if(genderM == 0 && genderW == 0) {
			non = 1;
		}
		model.addAttribute("genderM",genderM);
		model.addAttribute("genderW",genderW);
		model.addAttribute("non",non);
	//공고 마감 카운트 다운		
		model.addAttribute("hireDate",commonService.selectTime(recruitListVO.getAnnounceNum()));
		
	//주소 api 가져오기		
		model.addAttribute("addr",commonService.selectAddress(recruitListVO.getAnnounceNum()));
		return "tiles/common/companyDetail";
	}
	
	//기업 이력서 넣기
	@RequestMapping(value = "/resumeApp.do")
	public String resumeApp(ForRecruitVO forRecruitVO) {
		Map<String, Object> map = new HashMap<>();
		map.put("comNum", forRecruitVO.getComNum());
		map.put("announceNum",forRecruitVO.getAnnounceNum());
		map.put("resumeNum",forRecruitVO.getResumeNum());
		commonService.insertComMypage(map);
		return "redirect:main.do";
	}
	
	//기업 리스트 조회
	@RequestMapping(value = "/comList.do")
	public String comList(Model model, SearchVO searchVO, HttpSession session) {
		
		List<RecruitListVO> comNameList = commonService.selectComNameList();
		if(session.getAttribute("memLogin") != null) {
			String memEmail = ((MemInfoVO)session.getAttribute("memLogin")).getMemEmail();
			List<LikeCompanyVO> likeComList = memberService.selectLikeCompany(memEmail);
			comNameList = Statics.makeLike(comNameList, likeComList);
		}
		model.addAttribute("comNameRList", commonService.selectComNameAsRecruitList());
		model.addAttribute("comNameList", comNameList);
		return "tiles/common/company";
	}
		
	//개인 비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "/findMemPass.do")
	public String findMemPass(String memEmail) {
		return Statics.sendPassEmail(memEmail, mailSender);
	}
	//개인 비밀번호 변경
	@RequestMapping(value = "/updateMemPass.do")
	public String updateMemPass(MemInfoVO memInfoVO, Model model) {
		commonService.updateMemCodePass(memInfoVO);
		model.addAttribute("result", "pass");
		return "result/result";
	}
	
	//기업 비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "/findComPass.do")
	public String findComPass(String comEmail) {
		return Statics.sendPassEmail(comEmail, mailSender);
	}
	//기업 비밀번호 변경
	@RequestMapping(value = "/updateComPass.do")
	public String updateComPass(CompanyInfoVO companyInfoVO, Model model) {
		commonService.updateComCodePass(companyInfoVO);
		model.addAttribute("result", "pass");
		return "result/result";
	}
		
		
		
}







