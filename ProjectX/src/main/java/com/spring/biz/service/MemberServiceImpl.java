package com.spring.biz.service;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.biz.vo.LicenseVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.MemResumeVO;
import com.spring.biz.vo.ProfilesVO;

@Service("memberService") 
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertResume(MemResumeVO memResumeVO) {
		sqlSession.insert("insertResume", memResumeVO);
	}
	
	
	@Override
	public int insertLicense(MemResumeVO memResumeVO) {
		 return sqlSession.insert("insertLicense", memResumeVO);
		 
	}

	@Override
	public int insertProfiles(MemResumeVO memResumeVO) {
		return sqlSession.insert("insertProfiles", memResumeVO);
	}

	@Override
	public int updateMemInfo(MemInfoVO memInfoVO) {
		return sqlSession.update("updateMemInfo", memInfoVO);
	}

	@Override
	public MemInfoVO selectMemInfoME(MemInfoVO memInfoVO) {
		return sqlSession.selectOne("selectMemInfoME", memInfoVO);
	}


	@Override
	public List<MemResumeVO> selectResumeList(String memEmail) {
		return sqlSession.selectList("selectResumeList", memEmail);
	}


	@Override
	public MemResumeVO selectResumeDetail(int resumeNum) {
		return sqlSession.selectOne("selectResumeDetail", resumeNum);
	}


	@Override
	public List<LicenseVO> selectLicenseList(int resumeNum) {
		return sqlSession.selectList("selectLicenseList", resumeNum);
	}


	@Override
	public List<ProfilesVO> selectProfilesList(int resumeNum) {
		return sqlSession.selectList("selectProfilesList", resumeNum);
	}
	
}












