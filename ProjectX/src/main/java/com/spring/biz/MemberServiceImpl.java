package com.spring.biz;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.MemResumeVO;

@Service("memberService") 
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertResume(MemResumeVO memResumeVO) {
		return sqlSession.insert("regResume", memResumeVO);
	}

	@Override
	public int insertLicense(MemResumeVO memResumeVO) {
		return sqlSession.insert("insertLicense", memResumeVO);
	}

	@Override
	public int insertProfiles(MemResumeVO memResumeVO) {
		return sqlSession.insert("insertProfiles", memResumeVO);
	}

	
	
}












