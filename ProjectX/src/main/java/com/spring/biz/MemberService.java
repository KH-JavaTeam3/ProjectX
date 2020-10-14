package com.spring.biz;


import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.MemResumeVO;

public interface MemberService {
	//이력서 등록
	void insertResume(MemResumeVO memResumeVO);
	//자격증 다중 등록
	int insertLicense(MemResumeVO memResumeVO);
	//자기소개서 다중 등록
	int insertProfiles(MemResumeVO memResumeVO);
	//개인 기본정보 수정
	int updateMemInfo(MemInfoVO memInfoVO);
	
	//개인 기본정보 조회
	MemInfoVO selectMemInfoME(MemInfoVO memInfoVO);
}