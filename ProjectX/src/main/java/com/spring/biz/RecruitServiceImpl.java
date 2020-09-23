package com.spring.biz;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("recruitService") 
public class RecruitServiceImpl implements RecruitService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	
}












