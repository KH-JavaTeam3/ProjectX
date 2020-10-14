package com.spring.biz;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.MemInfoVO;


@Service("adminService") 
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CompanyInfoVO> selectCompanyListAD() {
		return sqlSession.selectList("selectCompanyListAD");
	}

	@Override
	public List<MemInfoVO> selectMemberListAD() {
		return sqlSession.selectList("selectMemberListAD");
	}

	@Override
	public CompanyInfoVO selectCompanyAD(String comName) {
		return sqlSession.selectOne("selectCompnayAD", comName);
	}

	@Override
	public MemInfoVO selectMemberAD(String memName) {
		return sqlSession.selectOne("selectMemberAD", memName);
	}

	
}