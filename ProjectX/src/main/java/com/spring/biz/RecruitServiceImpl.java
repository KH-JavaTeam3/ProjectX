package com.spring.biz;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.MemInfoVO;

@Service("recruitService") 
public class RecruitServiceImpl implements RecruitService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertMemInfo(MemInfoVO memInfoVO) {
		return sqlSession.insert("insertMemInfo", memInfoVO);
	}

	
}












