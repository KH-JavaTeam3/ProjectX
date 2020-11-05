package com.spring.biz.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	public MemInfoVO findMember(String getId) {
		return sqlSession.selectOne("findMember", getId);
	}
	@Override
	public void updateCookie(Map<String, String> map) {
		sqlSession.update("updateCookie", map);
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
	public String selectComNumChk(String comNum) {
		return sqlSession.selectOne("selectComNumChk", comNum);
	}
	@Override
	public CompanyInfoVO companyLogin(CompanyInfoVO companyInfoVO) {
		return sqlSession.selectOne("companyLogin", companyInfoVO);
	}
	@Override
	public void updateComCookie(Map<String, String> map) {
		sqlSession.update("updateComCookie", map);
	}
	@Override
	public CompanyInfoVO findComMember(String getId) {
		return sqlSession.selectOne("findComMember", getId);
	}
	@Override
	public List<RecruitListVO> selectRecruitList(SearchVO searchVO) {
		return sqlSession.selectList("selectRecruitList",searchVO);
	}
	@Override
	public RecruitListVO selectDetailRecruit(RecruitListVO recruitListVO) {
		return sqlSession.selectOne("selectDetailRecruit",recruitListVO);
	}
	@Override
	public void updateViews(int announceNum) {
		sqlSession.update("commonMapper.updateViews", announceNum);
		
	}
	@Override
	public List<RecruitListVO> selectOldList(String toDay) {
		return sqlSession.selectList("selectOldList", toDay);
	}
	@Override
	public int oldListUpdate(int i) {
		return sqlSession.update("oldListUpdate", i);
	}
	@Override
	public int insertComMypage(Map<String, Object> map) {
		return sqlSession.insert("insertComMypage", map);
	}
	@Override
	public List<Integer> selectMemberAge(RecruitListVO recruitListVO) {
		
		return sqlSession.selectList("selectMemberAge",recruitListVO);
	}
	@Override
	public List<String> selectMemberGender(int announceNum) {
		
		return sqlSession.selectList("selectMemberGender",announceNum);
	}
	@Override
	public String selectTime(int announceNum) {
		
		return sqlSession.selectOne("selectTime",announceNum);
	}
	@Override
	public String selectAddress(int announceNum) {
		
		return sqlSession.selectOne("selectAddress",announceNum);
	}
	@Override
	public List<RecruitListVO> selectComNameList() {
		return sqlSession.selectList("selectComNameList");
	}
	@Override
	public List<RecruitListVO> selectComNameAsRecruitList() {
		return sqlSession.selectList("selectComNameAsRecruitList");
	}
	@Override
	public List<RecruitListVO> selectViewsList() {
		return sqlSession.selectList("selectViewsList");
	}
	@Override
	public void updateMemCodePass(MemInfoVO memInfoVO) {
		sqlSession.update("updateMemCodePass", memInfoVO);
	}
	@Override
	public void updateComCodePass(CompanyInfoVO companyInfoVO) {
		sqlSession.update("updateComCodePass", companyInfoVO);
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












