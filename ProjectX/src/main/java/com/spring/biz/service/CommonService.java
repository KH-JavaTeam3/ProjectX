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
	
	//인증 후 비밀번호 업데이트
	void updateMemCodePass(MemInfoVO memInfoVO);
	
	//인증 후 비밀번호 업데이트
	void updateComCodePass(CompanyInfoVO companyInfoVO);
	
	// 구직자 정보 수정
	int memUpdate(MemInfoVO memInfoVO);

	// 기업 회원가입
	int insertCompanyInfo(CompanyInfoVO companyInfoVO);
	
	// 기업 회원가입 사업자번호 중복 체크
	String selectComNumChk(String comNum);

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
		
	//지원한 사람 나이 가져오기
	List<Integer> selectMemberAge(RecruitListVO recruitListVO);
	//지원한 사람 성별 가져오기
	List<String> selectMemberGender(int announceNum);
	//공고 마감 시간 가져오기
	String selectTime(int announceNum);
	//주소값 가져오기 api
	String selectAddress(int announceNum);
	//기업 이름 뽑기
	List<RecruitListVO> selectComNameList();
	
	//이름뽑은 기업의 공고 찾기
	List<RecruitListVO> selectComNameAsRecruitList();
	
	//메인페이지 조회수 높은것 뽑기
	List<RecruitListVO> selectViewsList();
		
//	// 기업리스트 페이징처리
//	public int countBoard();
//
//	// 페이징 처리 게시글 조회
//	public List<BoardVO> selectBoard(PagingVO pagingVO);
}