package com.spring.biz.service;

import java.util.List;

import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.MemInfoVO;

public interface AdminService {
	List<CompanyInfoVO> selectCompanyListAD();
	List<MemInfoVO> selectMemberListAD();
	CompanyInfoVO selectCompanyAD(String comName);
	MemInfoVO selectMemberAD(String memName);
}