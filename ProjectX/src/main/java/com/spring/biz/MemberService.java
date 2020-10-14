package com.spring.biz;

import java.util.List;

import com.spring.biz.vo.LicenseVO;
import com.spring.biz.vo.ProfilesVO;
import com.spring.biz.vo.MemResumeVO;

public interface MemberService {
	//이력서 등록
	int insertResume(MemResumeVO memResumeVO);
	//자격증 다중 등록
	int insertLicense(MemResumeVO memResumeVO);
	//자기소개서 다중 등록
	int insertProfiles(MemResumeVO memResumeVO);
}