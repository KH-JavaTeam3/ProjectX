package com.spring.biz.service;

import java.util.List;
import java.util.Map;

import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.RecruitListVO;
import com.spring.biz.vo.SearchVO;

public interface CommonService {
	// 개인 회원가입
	int insertMemInfo(MemInfoVO memInfoVO);
	
	// 개인 회원가입 이메일 중복체크
	String selectEmailChk(String memEmail);

	// 개인로그인
	MemInfoVO memberLogin(MemInfoVO memInfoVO);
	
	// 자동로그인용 개인 조회
	MemInfoVO findMember(String getId);
	
	// 자동로그인 갱신
	void updateCookie(Map<String, String> map);
	
	// 구직자 정보 수정
	int memUpdate(MemInfoVO memInfoVO);

	// 기업 회원가입
	int insertCompanyInfo(CompanyInfoVO companyInfoVO);

	// 기업 로그인
	CompanyInfoVO companyLogin(CompanyInfoVO companyInfoVO);
	
	// 기업 자동로그인 갱신
	void updateComCookie(Map<String, String> map);
	
	// 기업 자동로그인용 기업 조회
	CompanyInfoVO findComMember(String getId);


	List<RecruitListVO> selectRecruitList(SearchVO searchVO);
	
	RecruitListVO selectDetailRecruit(RecruitListVO recruitListVO);
	
	//채용공고 조회수 증가
	void updateViews(int announceNum);
	
	//날짜가 지난 공고 리스트 뽑기
		List<RecruitListVO> selectOldList(String toDay);
		
		//날짜가 지난 공고 업데이트
		int oldListUpdate(int i);
		
		//이력서 넣기
		int insertComMypage(Map<String, Object> map);
//	// 기업리스트 페이징처리
//	public int countBoard();
//
//	// 페이징 처리 게시글 조회
//	public List<BoardVO> selectBoard(PagingVO pagingVO);
}