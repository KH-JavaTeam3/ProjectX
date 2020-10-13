package com.spring.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.AdminNoticeVO;
import com.spring.biz.vo.CompanyInfoVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.RecruitListVO;

@Service("companyService") 
public class CompanyServiceImpl implements CompanyService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int registHumanSeeker(RecruitListVO recruitListVO) {
		return sqlSession.insert("registHumanSeeker", recruitListVO);
	}

	@Override
	public List<RecruitListVO> recruitlist(String comNum) {
		return sqlSession.selectList("recruitlist", comNum);
	}

	@Override
	public RecruitListVO recruitDeteil(RecruitListVO recruitListVO) {
		return sqlSession.selectOne("recruitDeteil", recruitListVO);
	}

	@Override
	public int registHumanSeekerUpdate(RecruitListVO recruitListVO) {
		return sqlSession.update("registHumanSeekerUpdate", recruitListVO);
	}

	@Override
	public int recruitDeleteList(int[] announceNums) {
		return sqlSession.update("recruitDeleteList", announceNums);
	}

	
}












