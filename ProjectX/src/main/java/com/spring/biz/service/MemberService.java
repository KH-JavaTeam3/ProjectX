package com.spring.biz.service;


import java.util.List;

import com.spring.biz.vo.CareerVO;
import com.spring.biz.vo.LicenseVO;
import com.spring.biz.vo.LikeCompanyVO;
import com.spring.biz.vo.LikeRecruitVO;
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
	
	//경력사항 다중 등록
	int insertCareer(MemResumeVO memResumeVO);
	
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
	
	//이력서 상세 중 경력 사항 모음
	List<CareerVO> selectCareerList(int resumeNum);
	
	//이력서 수정
	void updateMemResume(MemResumeVO memResumeVO);
	
	//자격증 수정
	void mergeLicense(LicenseVO licenseVO);
	
	//자기소개서 수정
	void mergeProfiles(ProfilesVO profilesVO);
	
	//경력사항 수정
	void mergeCareer(CareerVO careerVO);
	
	//하트 눌렀는지 확인
	LikeCompanyVO chkHeart(LikeCompanyVO likeCompanyVO);
	
	//관심기업 추가
	int insertLikeCompany(LikeCompanyVO likeCompanyVO);
	
	//관심기업 삭제
	int deleteLikeCompany(LikeCompanyVO likeCompanyVO);
	
	//관심기업 조회 리스트
	List<LikeCompanyVO> selectLikeCompany(String memEmail);
	
	//관심공고 조회 리스트
	List<LikeRecruitVO> selectLikeRecruitList(String memEmail);
	
	//관심 공고로 추가
	int insertHeartOfLikeRecruit(LikeRecruitVO likeRecruitVO);
	
	//관심 공고에서 취소
	int deleteHeartOfLikeRecruit(LikeRecruitVO likeRecruitVO);
	
	//자격증 식별번호 중 최고값 조회
	int selectMaxLicNum();
	
	//자기소개서 식별번호 중 최고값 조회
	int selectMaxProfilesNum();

	//경력사항 식별번호 중 최고값 조회
	int selectMaxCareerNum();
	
	//자격증 삭제
	int deleteLic(int licNum);
	
	//자기소개 삭제
	int deleteProfiles(int proNum);
	
	//경력사항 삭제
	int deleteCareer(int carNum);
	
	//이력서 삭제
	int deleteResume(int resumeNum);
}