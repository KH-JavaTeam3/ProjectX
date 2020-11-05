package com.spring.biz.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import com.spring.biz.vo.LikeCompanyVO;
import com.spring.biz.vo.LikeRecruitVO;
import com.spring.biz.vo.RecruitListVO;
import com.spring.biz.vo.SearchVO;

public class Statics {
	
	//검색 널체크 메소드
	public static SearchVO searchNullChk(SearchVO searchVO) {
		if (searchVO.getKeyword() == null) {
			searchVO.setKeyword("");
		}
		if (searchVO.getPlace() == null) {
			searchVO.setPlace("");
		}
		if (searchVO.getJobtype() == null) {
			searchVO.setJobtype("");
		}
		return searchVO;
	}
	
	//비밀번호 찾기 이메일 메소드
	public static String sendPassEmail(String email, JavaMailSender mailSender) {
		// 난수발생 문자
		String uuid = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 6); 
		
		//여기만 바꾸면 가능
		String setfrom = "FinDream"; // 보내는 이(한글 안먹던데)
		String tomail = email; // 받는 사람 이메일
		String title = "구인구직 사이트 파인드림입니다."; // 제목(생략가능)
		String content = "인증번호를 보내드립니다. \n 인증번호 : " + uuid; // 내용
		
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() { 
			@Override public void prepare(MimeMessage mimeMessage) throws Exception { 
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
				helper.setFrom(setfrom); 
				helper.setTo(tomail); 
				helper.setSubject(title); 
				helper.setText(content); 
			} 
		}; 
		mailSender.send(preparator);
		return uuid;
	}
	//공고 좋아요 메소드
	public static List<RecruitListVO> makeLike(List<RecruitListVO> comNameList, List<LikeCompanyVO> likeComList){
		for(int i =0; i < comNameList.size(); i++) {
			for(int j = 0; j < likeComList.size(); j++) {
				if(comNameList.get(i).getComNum().equals(likeComList.get(j).getComNum())) {
					comNameList.get(i).setIsLike(true);
				}
			}
		}
		return comNameList;
	}
	//기업 좋아요 메소드
	public static List<RecruitListVO> makeLiLike(List<RecruitListVO> list1, List<LikeRecruitVO> list){
		for(int i =0; i < list1.size(); i++) {
			for(int j = 0; j < list.size(); j++) {
				if(list1.get(i).getAnnounceNum() == list.get(j).getAnnounceNum()) {
					list1.get(i).setIsLike(true);
				}
			}
		}
		return list1;
	}
	//쿠키 메소드
	public static Map<String, String> makeCookie(String getId, String account, HttpServletResponse response){
		Cookie loginCookie = new Cookie("loginCookie", account);//자동로그인 체크시 쿠키 생성
		loginCookie.setMaxAge(60*60*24);//쿠키의 유지시간 설정(60초 * 60분 * 24시간) = 하루
		response.addCookie(loginCookie); //쿠키 등록
		Map<String, String> map = new HashMap<>(); //매퍼에 객체 한개던지려고 Map 만듬
		map.put("setId", getId);
		map.put("comNum", account);
		return map;
	}
	//나이 세는 메소드
	public static int[] countAge(List<Integer> list) {
		int age20 = 0, age30 = 0, age40 = 0, age50 = 0, age60 = 0;
		
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
		return new int[] {age20, age30, age40, age50, age60};
	}
}
