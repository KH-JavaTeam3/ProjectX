package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.biz.vo.AdminNoticeVO;
import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.RecruitListVO;
import com.spring.biz.vo.SearchVO;

@Service("commonService") 
public class CommonServiceImpl implements CommonService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMemInfo(MemInfoVO memInfoVO) {
		return sqlSession.insert("insertMemInfo", memInfoVO);
	}
	@Override
	public String selectEmailChk(String memEmail) {
		return sqlSession.selectOne("selectEmailChk", memEmail);
	}
	@Override
	public MemInfoVO memberLogin(MemInfoVO memInfoVO) {
		return sqlSession.selectOne("memberLogin", memInfoVO);
	}

	@Override
	public int memUpdate(MemInfoVO memInfoVO) {
		return sqlSession.update("memUpdate", memInfoVO);
	}

	@Override
	public int insertCompanyInfo(CompanyInfoVO companyInfoVO) {
		return sqlSession.insert("insertCompanyInfo", companyInfoVO);
	}

	@Override
	public CompanyInfoVO companyLogin(CompanyInfoVO companyInfoVO) {
		return sqlSession.selectOne("companyLogin", companyInfoVO);
	}
	@Override
	public int insertNotice(AdminNoticeVO adminNoticeVO) {
		
		return sqlSession.insert("insertNotice",adminNoticeVO);
	}

	@Override
	public List<AdminNoticeVO> selectNotice() {
		
		return sqlSession.selectList("selectNotice");
	}

	@Override
	public AdminNoticeVO selectDetailNotice(int boardNumber) {
	
		return sqlSession.selectOne("selectDetailNotice",boardNumber);
	}

	@Override
	public List<RecruitListVO> selectRecruitList(SearchVO searchVO) {
		
		return sqlSession.selectList("selectRecruitList",searchVO);
	}

	@Override
	public RecruitListVO selectDetailRecruit(RecruitListVO recruitListVO) {
		
		return sqlSession.selectOne("selectDetailRecruit",recruitListVO);
	}

	

	

	
	
	
	
//	@Override
//	public int countBoard() {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public List<BoardVO> selectBoard(PagingVO pagingVO) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
}












