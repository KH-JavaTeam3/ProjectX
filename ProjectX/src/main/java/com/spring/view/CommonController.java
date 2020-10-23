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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.service.CommonService;
import com.spring.biz.util.TimeUtil;
import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.ForRecruitVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.RecruitListVO;
import com.spring.biz.vo.SearchVO;



@Controller
public class CommonController {
	@Resource(name = "commonService")
	CommonService commonService;
	//*.do쓰셈
	//경로는 tiles/common/파일명
	//jsp는 tiles/common폴더안에 생성
	
//	private final static Logger logger = LoggerFactory.getLogger(CommonController.class);
	//로그 생성
	
	//메인화면
	@RequestMapping(value = "/main.do")
	public String Main(HttpSession session, MemInfoVO memInfoVO, String toDay, @CookieValue(value="loginCookie", required = false) String loginCookie) {
		//해당날짜를 받아서 모집기간이 지난 공고를 자동으로 업데이트 하는 작업.
				Calendar cal = Calendar.getInstance();
				System.out.println(cal);
				TimeUtil.getNowDateTime(); // 시간 가져오는 클래스
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
	
	//개인 회원가입 화면
	@RequestMapping(value = "/memberJoin.do")
	public String join() {
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
	public String memberLogin(MemInfoVO memInfoVO, String keepLogin, HttpSession session, HttpServletResponse response) {
		MemInfoVO vo = commonService.memberLogin(memInfoVO);
		if(vo != null) {
			vo.setMemBirth(vo.getMemBirth().substring(0, 10));
			session.setAttribute("memLogin", vo);
			
			//자동 로그인
			if(keepLogin != null) {
				Cookie loginCookie = new Cookie("loginCookie", session.getId());//자동로그인 체크시 쿠키 생성
				loginCookie.setMaxAge(60*60*24*3);//쿠키의 유지시간 설정(60초 * 60분 * 24시간) = 하루
				response.addCookie(loginCookie); //쿠키 등록
				Map<String, String> map = new HashMap<>(); //매퍼에 객체 한개던지려고 Map 만듬
				map.put("setId", session.getId());
				map.put("memEmail", vo.getMemEmail());
				commonService.updateCookie(map);//DB에 자동로그인정보 저장
			}
			return "result/mLoginSuccess";
		}else {
			return "result/mLoginFail";
		}
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
	public String companyLogin(CompanyInfoVO companyInfoVO, String keepLogin, HttpSession session, HttpServletResponse response) {
		CompanyInfoVO vo = commonService.companyLogin(companyInfoVO);
		if(vo != null) {
			session.setAttribute("comLogin", vo);
			if(keepLogin != null) {
				Cookie loginCookie = new Cookie("loginCookie", session.getId());//자동로그인 체크시 쿠키 생성
				loginCookie.setMaxAge(60*60*24);//쿠키의 유지시간 설정(60초 * 60분 * 24시간) = 하루
				response.addCookie(loginCookie); //쿠키 등록
				Map<String, String> map = new HashMap<>(); //매퍼에 객체 한개던지려고 Map 만듬
				map.put("setId", session.getId());
				map.put("comNum", vo.getComNum());
				commonService.updateComCookie(map);//DB에 자동로그인정보 저장
			}
			return "tiles/company/main2";
		}else {
			return "tiles/common/main";
		}
	}
	//로그아웃
	@ResponseBody
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.removeAttribute("memLogin");
		session.removeAttribute("comLogin");
		Cookie[] getCookie = request.getCookies();
		if(getCookie != null) {
			for(Cookie cookie : getCookie) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
			}
		}

		return "로그아웃";
	}
	
	
	
	
	
	
	//기업리스트 이동
	@RequestMapping(value = "/companyList.do")
	public String companyList(Model model, SearchVO searchVO) {
		if(searchVO.getKeyword() == null) {
			searchVO.setKeyword("");
		}
		if(searchVO.getPlace() == null) {
			searchVO.setPlace("");
		}
		if(searchVO.getJobtype() == null) {
			searchVO.setJobtype("");
		}
		model.addAttribute("companyList",commonService.selectRecruitList(searchVO));
		return "tiles/common/companyList";
	}
	
	//기업리스트 상세보기
	@RequestMapping(value = "/companyDetail.do")
	public String companyDetail(RecruitListVO recruitListVO, Model model) {
		commonService.updateViews(recruitListVO.getAnnounceNum());
		model.addAttribute("recruitDeteil",commonService.selectDetailRecruit(recruitListVO));
		
		
	//나이때 별 데이터 조회 및 넘기기(그래프)
		List<Integer> list =  commonService.selectMemberAge(recruitListVO);
//		list.forEach(t->System.out.println(t));
		
		int age20 = 0;
		int age30 = 0;
		int age40 = 0;
		int age50 = 0;
		int age60 = 0;
				
		for(int age : list) {
			if(age / 10 == 2) {
				age20 += 1;
			}
			else if(age / 10 == 3) {
				age30 += 1;
			}
			else if(age / 10 == 4) {
				age40 += 1;
			}
			else if(age / 10 == 5) {
				age50 += 1;
			}
			else {
				age60 += 1;
			}
		}
		
		model.addAttribute("age20", age20);
		model.addAttribute("age30", age30);
		model.addAttribute("age40", age40);
		model.addAttribute("age50", age50);
		model.addAttribute("age60", age60);
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
		return "tiles/common/main";
	}
}










