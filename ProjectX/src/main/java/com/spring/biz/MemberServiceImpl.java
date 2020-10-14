package com.spring.biz;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.MemResumeVO;

@Service("memberService") 
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertResume(MemResumeVO memResumeVO) {
		sqlSession.insert("insertResume", memResumeVO);
		insertLicense(memResumeVO);
		insertProfiles(memResumeVO);
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
	
}












