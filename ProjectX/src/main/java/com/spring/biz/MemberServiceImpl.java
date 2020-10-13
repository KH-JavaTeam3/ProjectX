package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.AdminNoticeVO;
import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.MemInfoVO;

@Service("memberService") 
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	
}












