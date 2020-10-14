package com.spring.biz;

import java.util.List;

import com.spring.biz.vo.AdminNoticeVO;
import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.RecruitListVO;

public interface CommonService {
	// 개인 회원가입
	int insertMemInfo(MemInfoVO memInfoVO);
	
	// 개인 회원가입 이메일 중복체크
	String selectEmailChk(String memEmail);

	// 구직자로그인
	MemInfoVO memberLogin(MemInfoVO memInfoVO);

	// 구직자 정보 수정
	int memUpdate(MemInfoVO memInfoVO);

	// 기업 회원가입
	int insertCompanyInfo(CompanyInfoVO companyInfoVO);

	// 기업 로그인
	CompanyInfoVO companyLogin(CompanyInfoVO companyInfoVO);

	// 관리자페이지 공지사항 글쓰기
	int insertNotice(AdminNoticeVO adminNoticeVO);

	// 관리자페이지 공지사항 글조회
	List<AdminNoticeVO> selectNotice();

	// 관리자 페이지 공지사항 글 상세보기
	AdminNoticeVO selectDetailNotice(int boardNumber);

	List<RecruitListVO> selectRecruitList();
	
	RecruitListVO selectDetailRecruit(RecruitListVO recruitListVO);
	
	
//	// 기업리스트 페이징처리
//	public int countBoard();
//
//	// 페이징 처리 게시글 조회
//	public List<BoardVO> selectBoard(PagingVO pagingVO);
}