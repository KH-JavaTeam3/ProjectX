package com.spring.biz.service;


import java.util.List;

import com.spring.biz.vo.LicenseVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.MemResumeVO;
import com.spring.biz.vo.ProfilesVO;

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
	
	//이력서 모음
	List<MemResumeVO> selectResumeList(String memEmail);
	
	//이력서 상세
	MemResumeVO selectResumeDetail(int resumeNum);
	
	//이력서 상세 중 자격증 모음
	List<LicenseVO> selectLicenseList(int resumeNum);
	
	//이력서 상세 중 자소서 모음
	List<ProfilesVO> selectProfilesList(int resumeNum);
}