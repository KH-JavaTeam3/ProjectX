package com.spring.biz.service;

import java.util.List;

import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.ForRecruitVO;
import com.spring.biz.vo.MemResumeVO;
import com.spring.biz.vo.RecruitListVO;

public interface CompanyService {
	//구인공고 작성
	int registHumanSeeker(RecruitListVO recruitListVO);
	//접속자에 한한 구인 공고 리스트
	List<RecruitListVO> recruitlist(String comNum);
	//구인 공고 상세보기
	RecruitListVO recruitDeteil(RecruitListVO recruitListVO);
	//구인 공고 수정
	int registHumanSeekerUpdate(RecruitListVO recruitListVO);
	//구인 공고 다중 삭제
	int recruitDeleteList(int[] announceNums);
	//기업 정보 조회
	CompanyInfoVO selectMyCom(CompanyInfoVO companyInfoVO);
	//기업 정보 수정
	int myComUpdate(CompanyInfoVO companyInfoVO);
	//기업이 받은 이력서 조회
	List<ForRecruitVO> resumeInquiryList(ForRecruitVO forRecruitVO);
	//기업이 받은 이력서 합격 여부 결정
	int resumeResultUpdate(MemResumeVO memResumeVO);
}